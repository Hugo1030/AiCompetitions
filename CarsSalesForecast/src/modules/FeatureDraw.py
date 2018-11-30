# -*- coding: utf-8 -*-
#!/usr/bin/env python
'''特征工程常用函式
- 分类归化
- ..

'''

__version__ = 'v18.2.24.2342'
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
def ignore_warn(*args, **kwargs):
    pass
warnings.warn = ignore_warn

from sklearn.preprocessing import MinMaxScaler






def unique1hot_by_field(dock_df
                            , res_df
                            , field_name
                            , dock_field='class_id'
                            , echo_head=0
                            ):
    '''根据指定字段的 unique 分解 one-hot 为一系列特征状态:
        - dock_df ~ 码头 DataFrame 用以安装特征
        - res_df ~ DataFrame 对象
        - field_name ~ 分解对象
        - dock_field ~ 安装字段
    '''
    print('\t 归化:%s'% field_name)

    _aim = res_df[[dock_field, field_name]].drop_duplicates()
    _dummies = pd.get_dummies(_aim[field_name], prefix=field_name)
    _aim = pd.concat([_aim,_dummies],axis=1)
    _aim = _aim.drop([field_name],axis=1)
    _aim = _aim.groupby(dock_field).agg('sum').reset_index()
    dock_df = pd.merge(dock_df, _aim, on=dock_field)
    if echo_head:
        print(res_df[field_name].unique())
        print(dock_df.head())
    return dock_df








def maxinean_by_field(dock_df
                            , res_df
                            , field_name
                            , dock_field='class_id'
                            , echo_head=0
                            ):
    '''根据指定字段值 阶段化 为 max-min-mean 数值特征:
        - dock_df ~ 码头 DataFrame 用以安装特征
        - res_df ~ DataFrame 对象
        - field_name ~ 分解对象
        - dock_field ~ 安装字段
    '''
    print('\t sklearn=>MinMaxScaler:%s'% field_name)

    _aim = res_df[[dock_field, field_name]].drop_duplicates().reset_index(drop=True)
    _aim[field_name] = MinMaxScaler().fit_transform(_aim[field_name].reshape(-1, 1))
    
    _max = _aim.groupby(_aim[dock_field])[[field_name]].agg('max').reset_index()
    _max.rename(columns={field_name:'%s_max'%field_name},inplace=True)
    _min = _aim.groupby(_aim[dock_field])[[field_name]].agg('min').reset_index()
    _min.rename(columns={field_name:'%s_min'%field_name},inplace=True)
    _mean = _aim.groupby(_aim[dock_field])[[field_name]].agg('mean').reset_index()
    _mean.rename(columns={field_name:'%s_mean'%field_name},inplace=True)
    
    _aim = _aim.drop([field_name],axis=1)
    _aim = _aim.drop_duplicates().reset_index(drop=True)
    _aim = pd.merge(_aim, _max, on=dock_field)
    _aim = pd.merge(_aim, _min, on=dock_field)
    _aim = pd.merge(_aim, _mean, on=dock_field)
    
    dock_df = pd.merge(dock_df, _aim, on=dock_field)
    if echo_head:
        print(dock_df.head())
    return dock_df


def _groupby4mix_sale_quantity_decay(df_orig
                                , calc='sum'
                                , grpby='class_id' 
                                , seedf='last2M'
                                , dropid=True
                                , decay=1
                                ):
    if calc == 'sum':
        _df = df_orig.groupby([grpby]).agg(sum).sale_quantity.reset_index() 
    elif calc == 'max':
        _df = df_orig.groupby([grpby]).agg(max).sale_quantity.reset_index() 
    elif calc == 'min':
        _df = df_orig.groupby([grpby]).agg(min).sale_quantity.reset_index() 
    elif calc == 'mean':
        _df = df_orig.groupby([grpby]).mean().sale_quantity.reset_index() 
    elif calc == 'median':
        _df = df_orig.groupby([grpby]).median().sale_quantity.reset_index() 
    elif calc == 'std':
        _df = df_orig.groupby([grpby]).std().sale_quantity.reset_index() 
    else:
        _df = df_orig.groupby([grpby]).diff().sale_quantity.reset_index() 

    _df.sale_quantity = _df.sale_quantity*decay
    _df.rename(columns={'sale_quantity': 'sale_quantity_{}_{}'.format(seedf,calc)}
                , inplace=True)# 替换列名称 
    if dropid:
        _df = _df.drop([grpby],axis=1)
    return _df

def sale_cal_mix_decay(train,window,num, seedname='decay2M', scale=0.9):
    '''销售额 时间窗口特征 衰减
    例如, 预测 11 月,
        9/10 月销量的均值, 一个特征/
        8/9月销量 * 0.9 均值, 一个特征/
        7/8月销量 * 0.9^2 均值, 一个特征…
        进 1 出 1
    注意:
        滑动次数决定最终输出的数据集尺寸
        进行特征工程时,必须确保所有特征尺寸相同
        否则无法拼接完备
    '''

    _df = pd.DataFrame()
    print('sale_cal_mix 滚次:%s'%num)
    #print(window)
    for i in range(num): 
        _decay = scale**i        
        #print('\t _decay steps<~{}->{}'.format(i,_decay))
        #continue
        _tmp = train[train['sale_date'].isin(window)]
        _tmp = _tmp.loc[:,['class_id','sale_quantity']]
        _tmp['sale_date'] = window[0] + 1
        _sum = _groupby4mix_sale_quantity_decay(_tmp
                                , calc = 'sum'
                                , seedf = seedname
                                , dropid = False
                                , decay = _decay
                                )
        _max = _groupby4mix_sale_quantity_decay(_tmp
                                , calc = 'max'
                                , seedf = seedname
                                , decay = _decay
                                )
        _min = _groupby4mix_sale_quantity_decay(_tmp
                                , calc = 'min'
                                , seedf = seedname
                                , decay = _decay
                                )
        _mean = _groupby4mix_sale_quantity_decay(_tmp
                                , calc = 'mean'
                                , seedf = seedname
                                , decay = _decay
                                )
        _median = _groupby4mix_sale_quantity_decay(_tmp
                                , calc = 'median'
                                , seedf = seedname
                                , decay = _decay
                                )
        _std = _groupby4mix_sale_quantity_decay(_tmp
                                , calc = 'std'
                                , seedf = seedname
                                , decay = _decay
                                )

        _mix = pd.concat([_sum, _max, _min, _mean, _median, _std]
                        , axis=1)
        _mix['sale_date'] = window[0] + 1
        if i == 0:
            _df = _mix
        else:
            print(_df.shape)
            _df = pd.concat([_df, _mix])#, _max, _min, _mean, _median, _std])    
        #print('\t 滚装轮次:%s'%i)
        print(' '*i+'*')
        for j,k in enumerate(window):
            window[j] = window[j] + 1

    return _df


def _groupby4mix_sale_quantity(df_orig
                                , calc='sum'
                                , grpby='class_id' 
                                , seedf='last2M'
                                , dropid=True
                                ):
    if calc == 'sum':
        _df = df_orig.groupby([grpby]).agg(sum).sale_quantity.reset_index() 
    elif calc == 'max':
        _df = df_orig.groupby([grpby]).agg(max).sale_quantity.reset_index() 
    elif calc == 'min':
        _df = df_orig.groupby([grpby]).agg(min).sale_quantity.reset_index() 
    elif calc == 'mean':
        _df = df_orig.groupby([grpby]).mean().sale_quantity.reset_index() 
    elif calc == 'median':
        _df = df_orig.groupby([grpby]).median().sale_quantity.reset_index() 
    elif calc == 'std':
        _df = df_orig.groupby([grpby]).std().sale_quantity.reset_index() 
    else:
        _df = df_orig.groupby([grpby]).diff().sale_quantity.reset_index() 
    
    _df.rename(columns={'sale_quantity': 'sale_quantity_{}_{}'.format(seedf,calc)}
                , inplace=True)# 替换列名称 
    if dropid:
        _df = _df.drop([grpby],axis=1)
    return _df

def sale_cal_mix(train,window,num, seedname='last2M'):
    _df = pd.DataFrame()
    print('sale_cal_mix 滚次:%s'%num)
    #print(window)
    for i in range(num):          
        _tmp = train[train['sale_date'].isin(window)]
        _tmp = _tmp.loc[:,['class_id','sale_quantity']]
        _tmp['sale_date'] = window[0] + 1
        '''
        _sum = _tmp.groupby(['class_id']).agg(sum).sale_quantity.reset_index() 
        #_sum['sale_date'] = window[0] + 1
        #_sum = _sum.pop('sale_quantity')
        _sum.rename(columns={'sale_quantity': 'sale_quantity_%s_sum'%seedname}
                        , inplace=True)# 替换列名称 
        '''
        _sum = _groupby4mix_sale_quantity(_tmp
                                , calc = 'sum'
                                , seedf = seedname
                                , dropid = False
                                )
        _max = _groupby4mix_sale_quantity(_tmp
                                , calc = 'max'
                                , seedf = seedname
                                )
        _min = _groupby4mix_sale_quantity(_tmp
                                , calc = 'min'
                                , seedf = seedname
                                )
        _mean = _groupby4mix_sale_quantity(_tmp
                                , calc = 'mean'
                                , seedf = seedname
                                )
        _median = _groupby4mix_sale_quantity(_tmp
                                , calc = 'median'
                                , seedf = seedname
                                )
        _std = _groupby4mix_sale_quantity(_tmp
                                , calc = 'std'
                                , seedf = seedname
                                )
        
        _mix = pd.concat([_sum, _max, _min, _mean, _median, _std]
                        , axis=1)
                        #, join_axes=[_sum.class_id])
        _mix['sale_date'] = window[0] + 1
        #_mix = _mix.drop_duplicates() 
        #print('\t crt. _mix') 
        #print(_mix.head())
        #print(_mix.shape)
        if i == 0:
            _df = _mix
            #print(_df.shape)
            #print(_df.tail())
        else:
            print(_df.shape)
            #print(_df.tail())
            _df = pd.concat([_df, _mix])#, _max, _min, _mean, _median, _std])    
        #print('\t 滚装轮次:%s'%i)
        print(' '*i+'*')
        for j,k in enumerate(window):
            window[j] = window[j] + 1
            #print('滚次:月度 => {}:{}'.format(i,window[j]))
    #_df = pd.merge(_df, _sum, on=['class_id','sale_date'], how='left')
    #_df = pd.merge(_df, _max, on=['class_id','sale_date'], how='left')
    return _df

'''
        _max = _tmp.groupby(['class_id']).agg(max).sale_quantity.reset_index() 
        #_max['sale_date'] = window[0] + 1
        #_max = _max.pop('sale_quantity')
        _max.rename(columns={'sale_quantity': 'sale_quantity_%s_max'%seedname}
                        , inplace=True)# 替换列名称 
        
        _min = _tmp.groupby(['class_id']).agg(min).sale_quantity.reset_index() 
        #_min['sale_date'] = window[0] + 1
        #_min = _min.pop('sale_quantity')
        _min.rename(columns={'sale_quantity': 'sale_quantity_%s_min'%seedname}
                        , inplace=True)# 替换列名称 
        #_mean['sale_date'] = window[0] + 1
        
        _mean = _tmp.groupby(['class_id']).mean().sale_quantity.reset_index() 
        #_mean = _mean.pop('sale_quantity')
        _mean.rename(columns={'sale_quantity': 'sale_quantity_%s_mean'%seedname}
                        , inplace=True)# 替换列名称 
        
        _median = _tmp.groupby(['class_id']).median().sale_quantity.reset_index() 
        #_median['sale_date'] = window[0] + 1
        #_median = _median.pop('sale_quantity')
        _median.rename(columns={'sale_quantity': 'sale_quantity_%s_median'%seedname}
                        , inplace=True)# 替换列名称 
        
        _std = _tmp.groupby(['class_id']).std().sale_quantity.reset_index()     
        #_std['sale_date'] = window[0] + 1
        #_std = _std.pop('sale_quantity')
        _std.rename(columns={'sale_quantity': 'sale_quantity_%s_std'%seedname}
                        , inplace=True)# 替换列名称 

'''
def sale_cal_sum(train,window,num):
    traintmp = pd.DataFrame()
    for i in range(num):          
        trainSaletmp = train[train['sale_date'].isin(window)]
        trainSaletmp = trainSaletmp.loc[:,['class_id','sale_quantity']]
        trainSaletmp = trainSaletmp.groupby(['class_id']).agg(sum).sale_quantity.reset_index() 
        trainSaletmp['sale_date'] = window[0]+1
        if i == 0:
            traintmp = trainSaletmp
        else:
            traintmp = pd.concat([traintmp, trainSaletmp])    
        for j,k in enumerate(window):
            window[j] = window[j] + 1
    return traintmp


def sale_cal_max(train,window,num):
    traintmp = pd.DataFrame()
    for i in range(num):          
        trainSaletmp = train[train['sale_date'].isin(window)]
        trainSaletmp = trainSaletmp.loc[:,['class_id','sale_quantity']]
        trainSaletmp = trainSaletmp.groupby(['class_id']).agg(max).sale_quantity.reset_index() #更换所需的函数
        trainSaletmp['sale_date'] = window[0]+1
        if i == 0:
            traintmp = trainSaletmp
        else:
            traintmp = pd.concat([traintmp, trainSaletmp])    
        for j,k in enumerate(window):
            window[j] = window[j] + 1
    return traintmp

def sale_cal_min(train,window,num):
    traintmp = pd.DataFrame()
    for i in range(num):          
        trainSaletmp = train[train['sale_date'].isin(window)]
        trainSaletmp = trainSaletmp.loc[:,['class_id','sale_quantity']]
        trainSaletmp = trainSaletmp.groupby(['class_id']).agg(min).sale_quantity.reset_index() #更换所需的函数
        trainSaletmp['sale_date'] = window[0]+1
        if i == 0:
            traintmp = trainSaletmp
        else:
            traintmp = pd.concat([traintmp, trainSaletmp])    
        for j,k in enumerate(window):
            window[j] = window[j] + 1
    return traintmp

def sale_cal_mean(train,window,num):
    traintmp = pd.DataFrame()
    for i in range(num):          
        trainSaletmp = train[train['sale_date'].isin(window)]
        trainSaletmp = trainSaletmp.loc[:,['class_id','sale_quantity']]
        trainSaletmp = trainSaletmp.groupby(['class_id']).mean().sale_quantity.reset_index() #更换所需的函数
        trainSaletmp['sale_date'] = window[0]+1
        if i == 0:
            traintmp = trainSaletmp
        else:
            traintmp = pd.concat([traintmp, trainSaletmp])    
        for j,k in enumerate(window):
            window[j] = window[j] + 1
    return traintmp


def sale_cal_median(train,window,num):
    traintmp = pd.DataFrame()
    for i in range(num):          
        trainSaletmp = train[train['sale_date'].isin(window)]
        trainSaletmp = trainSaletmp.loc[:,['class_id','sale_quantity']]
        trainSaletmp = trainSaletmp.groupby(['class_id']).median().sale_quantity.reset_index() #更换所需的函数
        trainSaletmp['sale_date'] = window[0]+1
        if i == 0:
            traintmp = trainSaletmp
        else:
            traintmp = pd.concat([traintmp, trainSaletmp])    
        for j,k in enumerate(window):
            window[j] = window[j] + 1
    return traintmp


def sale_cal_std(train,window,num):
    traintmp = pd.DataFrame()
    for i in range(num):       
        trainSaletmp = train[train['sale_date'].isin(window)]
        trainSaletmp = trainSaletmp.loc[:,['class_id','sale_quantity']]
        trainSaletmp = trainSaletmp.groupby(['class_id']).std().sale_quantity.reset_index() #更换所需的函数
        trainSaletmp['sale_date'] = window[0]+1
        if i == 0:
            traintmp = trainSaletmp
        else:
            traintmp = pd.concat([traintmp, trainSaletmp])    
        for j,k in enumerate(window):
            window[j] = window[j] + 1
    return traintmp


if __name__ == "__main__":
    print(__version__)
