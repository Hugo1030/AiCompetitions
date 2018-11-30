# -*- coding: utf-8 -*-
#!/usr/bin/env python
'''印象盐城·数创未来大数据竞赛 - 乘用车零售量预测 | 赛题与数据 
    https://tianchi.aliyun.com/competition/information.htm?spm=5176.11165320.5678.2.76d0507fX97NYj&raceId=231640

训练集处理:
    - 时间窗口特征核算
    - 周期特征提取
    - XGboost-style 训练集合成
'''

__version__ = 'v18.2.25.1642'
__author__ = 'DU4ai'
__license__ = 'MIT@2017-12'

#import sys
import os
import os.path

import sys
import logging
#logging.basicConfig()
logging.basicConfig(level=logging.CRITICAL)
_handler = logging.StreamHandler()
_formatter = logging.Formatter("[%(levelname)s]%(asctime)s:%(name)s(%(lineno)s): %(message)s"
                #, datefmt='%Y.%m.%d %H:%M:%S'
                , datefmt='%H:%M:%S'
                )
_handler.setFormatter(_formatter)
LOG = logging.getLogger(__name__)
#LOG = logging.getLogger()
LOG.setLevel(logging.DEBUG)  
LOG.propagate = False

LOG.addHandler(_handler)
LOG.debug('load LOG level')








import time
from datetime import datetime

import numpy as np 
import pandas as pd
import warnings
warnings.filterwarnings('ignore')

#from sklearn.preprocessing import MinMaxScaler






def gen_train_sets(resp, expp, pren='zq225'):
    '''销量+训练集
    销量训练集:
        - 获取每月销量 如果本月本车型没有销量，那么销量为0
        - 已销售时间 计算本车型已经销售的时间 
            如果从2012年1月至今销量为0，那么本车在本月还为上市，
            直到有销量的月份，已销售时间设为1，并随之间增长
        - 上月总销量与本车型销量
        - 去年总销量与本车型销量
        - 本月共有多少种车型在销售
    训练集:
        - 以 class_id 为周期
        - 逐步月加装
    '''
    csv_orig = os.path.join(resp
                        , "[new] yancheng_train_20171226.csv")
    csv_test = os.path.join(resp
                        , "yancheng_testA_20171225.csv")
    csv_feat = expp
    _aimpath = os.path.dirname(expp)
    #print(_aimpath)
    #return None
    csv_allt = os.path.join(_aimpath
                        , "%s_train_sets.csv"%pren)
    csv_allf = os.path.join(_aimpath
                        , "%s_features.csv"%pren)
    LOG.debug(csv_orig)
    
    train = pd.read_csv(csv_orig)
    test = pd.read_csv(csv_test)
    submit = test

    print("data size before drop ID feature is :\t{} ".format(train.shape))
    print("data size ask commit result as :\t{} ".format(test.shape))

    trainFeature = pd.read_csv(csv_feat)
    #print(_features.shape)
    print("data size after FeatureEngineer as :\t{} ".format(trainFeature.shape))




    
    trainDate = train[['sale_date', 'sale_quantity', 'class_id']]
    trainDate = trainDate.groupby(['sale_date', 'class_id']).agg('sum').reset_index()
    trainDate['year'] = trainDate['sale_date'].apply(lambda x: int(str(x)[0:4]))
    trainDate['month'] = trainDate['sale_date'].apply(lambda x: int(str(x)[4:6]))
    test['year'] = test['predict_date'].apply(lambda x: int(str(x)[0:4]))
    test['month'] = test['predict_date'].apply(lambda x: int(str(x)[4:6]))


    # 2012.1 data
    trainSaleDate = trainFeature
    _tmp = trainDate[(trainDate['year']==2012)&(trainDate['month']==1)]
    _tmp.loc[:, 'how_many_month_has_sell'] = 1
    sale_class_count = len(_tmp)

    trainSaleDate = pd.merge(trainSaleDate, _tmp, on='class_id', how='left')
    trainSaleDate['year'].fillna(2012.0, inplace=True)
    trainSaleDate['month'].fillna(1.0, inplace=True)
    trainSaleDate.loc[:, 'sale_quantity_total_last_month'] = 0
    trainSaleDate.loc[:, 'sale_quantity_this_last_month'] = 0
    trainSaleDate.loc[:, 'this_month_sale_class_count'] = sale_class_count

    #print(trainSaleDate)
    print('\n 安装 12.1 销售量'.format(trainSaleDate.shape))





    # 2012.2 - 2012.12 data
    for month in range(2, 13):
        trainSaleDateTmp = trainFeature
        trainTmp = trainDate[(trainDate['year']==2012)&(trainDate['month']==month)]
        
        sellmonth = trainSaleDate[['class_id', 'how_many_month_has_sell', 'sale_quantity']][(trainSaleDate['year']==2012)&(trainSaleDate['month']==(month-1))]
        sellmonth.dropna(inplace=True)
        sellmonth['how_many_month_has_sell'] = sellmonth['how_many_month_has_sell']+1
        sale_quantity_total_last_month = sellmonth['sale_quantity'].sum()
        sellmonth.rename(columns={'sale_quantity': 'sale_quantity_this_last_month'}, inplace=True)
        
        trainTmp = pd.merge(trainTmp, sellmonth, on='class_id', how='left')
        trainTmp['how_many_month_has_sell'].fillna(1.0, inplace=True)
        sale_class_count = len(trainTmp)
        
        trainSaleDateTmp = pd.merge(trainSaleDateTmp, trainTmp, on='class_id', how='left')
        trainSaleDateTmp['year'].fillna(2012.0, inplace=True)
        trainSaleDateTmp['month'].fillna(month, inplace=True)
        trainSaleDateTmp.loc[:, 'sale_quantity_total_last_month'] = sale_quantity_total_last_month
        trainSaleDateTmp.loc[:, 'this_month_sale_class_count'] = sale_class_count
        
        trainSaleDate = pd.concat([trainSaleDate, trainSaleDateTmp])
        
    trainSaleDate.loc[:, 'sale_quantity_total_last_year'] = 0
    trainSaleDate.loc[:, 'sale_quantity_this_last_year'] = 0

    #print(trainSaleDate.head())
    #print(trainSaleDate.shape)
    print('\n 安装 12.2~12 销售量'.format(trainSaleDate.shape))

    # 2013-2017
    for year in range(2013, 2018):
        print('mount %s trainsets'%year)
        for month in range(1, 13):
            trainSaleDateTmp = trainFeature
            trainTmp = trainDate[(trainDate['year']==year)&(trainDate['month']==month)]
            
            if month == 1:
                sellmonth = trainSaleDate[['class_id', 'how_many_month_has_sell', 'sale_quantity']][(trainSaleDate['year']==(year-1))&(trainSaleDate['month']==12)]
            else:
                sellmonth = trainSaleDate[['class_id', 'how_many_month_has_sell', 'sale_quantity']][(trainSaleDate['year']==year)&(trainSaleDate['month']==(month-1))]
            
            sellmonth.dropna(inplace=True)
            sellmonth['how_many_month_has_sell'] = sellmonth['how_many_month_has_sell']+1
            sale_quantity_total_last_month = sellmonth['sale_quantity'].sum()
            sellmonth.rename(columns={'sale_quantity': 'sale_quantity_this_last_month'}, inplace=True)

            sellYear = trainSaleDate[['class_id', 'sale_quantity']][((trainSaleDate['year']==(year-1))&(trainSaleDate['month']>=month))|((trainSaleDate['year']==year)&(trainSaleDate['month']<month))]
            sellYear.dropna(inplace=True)
            sellYear = sellYear.groupby('class_id').agg('sum').reset_index()
            sale_quantity_total_last_year = sellYear['sale_quantity'].sum()
            sellYear.rename(columns={'sale_quantity': 'sale_quantity_this_last_year'}, inplace=True)

            trainTmp = pd.merge(trainTmp, sellmonth, on='class_id', how='left')
            trainTmp['how_many_month_has_sell'].fillna(1.0, inplace=True)
            sale_class_count = len(trainTmp)

            trainTmp = pd.merge(trainTmp, sellYear, on='class_id', how='left')

            trainSaleDateTmp = pd.merge(trainSaleDateTmp, trainTmp, on='class_id', how='left')
            trainSaleDateTmp['year'].fillna(year, inplace=True)
            trainSaleDateTmp['month'].fillna(month, inplace=True)
            trainSaleDateTmp.loc[:, 'sale_quantity_total_last_month'] = sale_quantity_total_last_month
            trainSaleDateTmp.loc[:, 'sale_quantity_total_last_year'] = sale_quantity_total_last_year
            trainSaleDateTmp.loc[:, 'this_month_sale_class_count'] = sale_class_count

            trainSaleDate = pd.concat([trainSaleDate, trainSaleDateTmp])

            
    trainSaleDate = trainSaleDate[:-280]
    trainSaleDate.sort_values(['year', 'month', 'class_id'])
    trainSaleDate.fillna(0.0, inplace=True)

    #print(trainSaleDate.tail())
    #print(trainSaleDate.shape)
    print('\n 安装 2013~17 销售量'.format(trainSaleDate.shape))


    sellmonth = trainSaleDate[['class_id', 'how_many_month_has_sell', 'sale_quantity']][(trainSaleDate['year']==2017)&(trainSaleDate['month']==10)]
    sellmonth.dropna(inplace=True) 
    sellmonth['how_many_month_has_sell'] = sellmonth['how_many_month_has_sell']+1
    sale_quantity_total_last_month = sellmonth['sale_quantity'].sum()
    sellmonth.rename(columns={'sale_quantity': 'sale_quantity_this_last_month'}, inplace=True)

    #print(sellmonth.head())
    #print(sellmonth.shape)

    sellYear = trainSaleDate[['class_id', 'sale_quantity']][(
                        (trainSaleDate['year']==2016)&(trainSaleDate['month']>=11)
                            )|(
                        (trainSaleDate['year']==2017)&(trainSaleDate['month']<11)
                            )]
    sellYear.dropna(inplace=True)
    sellYear = sellYear.groupby('class_id').agg('sum').reset_index()
    sale_quantity_total_last_year = sellYear['sale_quantity'].sum()
    sellYear.rename(columns={'sale_quantity': 'sale_quantity_this_last_year'}
                            , inplace=True)

    test = pd.merge(test, trainFeature, on='class_id', how='left')
    test = pd.merge(test, sellmonth, on='class_id', how='left')
    test = pd.merge(test, sellYear, on='class_id', how='left')

    test.loc[:, 'sale_quantity_total_last_month'] = sale_quantity_total_last_month
    test.loc[:, 'sale_quantity_total_last_year'] = sale_quantity_total_last_year
    test.loc[:, 'this_month_sale_class_count'] = 140

    test.sort_values(['class_id'])
    test.fillna(0.0, inplace=True)

    test = test.drop(['predict_quantity'], axis=1)

    columns = train.drop(['sale_quantity'], axis=1).columns.tolist()
    test['sale_date'] = test['predict_date']
    test = test.drop(['predict_date'], axis=1)



    print('训练集尺寸:{}'.format(trainDate.shape))
    print('特征集尺寸:{}'.format(test.shape))


    

    trainSaleDate.to_csv(csv_allt, index=False)
    test.to_csv(csv_allf, index=False)
    print('输出训练集:%s'%csv_allt)
    print('输出特征集:%s'%csv_allf)
    return None


if __name__ == "__main__":
    print(__version__)
    if 4 != len(sys.argv) :
        print('''生成统一训练集
        Usage:
$ YCa1trainsets_gen.py path/2/原始数据目录 path/2/清洁数据集 [新数据集前缀 zq225]
    e.g
$ YCa1trainsets_gen.py ../raw/CarsSaleForecast/ ../raw/ZQ/dclean0224features.csv ZQ225
        ''')
    else:
        _orig = sys.argv[1]
        _feat = sys.argv[2]
        _name = sys.argv[3]
        gen_train_sets(_orig, _feat, _name)



        

