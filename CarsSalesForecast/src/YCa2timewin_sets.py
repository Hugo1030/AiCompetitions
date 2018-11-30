# -*- coding: utf-8 -*-
#!/usr/bin/env python
'''印象盐城·数创未来大数据竞赛 - 乘用车零售量预测 | 赛题与数据 
    https://tianchi.aliyun.com/competition/information.htm?spm=5176.11165320.5678.2.76d0507fX97NYj&raceId=231640

训练集处理:
    - 时间窗口特征核算
    - 周期特征提取
    - XGboost-style 训练集合成
'''

__version__ = 'v18.2.25.2442'
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



'''
from modules.FeatureDraw import sale_cal_sum
from modules.FeatureDraw import sale_cal_max
from modules.FeatureDraw import sale_cal_min
from modules.FeatureDraw import sale_cal_median
from modules.FeatureDraw import sale_cal_mean
from modules.FeatureDraw import sale_cal_std
'''
from modules.FeatureDraw import sale_cal_mix
from modules.FeatureDraw import sale_cal_mix_decay


def _gen_twin(mli, wsize):
    print(range(wsize))
    _tw = []
    for i in range(wsize):
        _tw.append(mli + i)        
    return _tw
def timewin_sets(aim, feat, pren='zq225'):
    '''时间窗口训练集:
        - 最近 2/3/6/12 个月窗口 销量之和/差(平均/中值/最大/最小/方差)
        - 基于时间窗口滑动递减统计特征
    '''
    _aimpath = os.path.dirname(aim)
    #print(_aimpath)
    csv_tran = '../raw/ZQ/LCh1_trainSaleDatetest.csv'
    #csv_tran = aim
    LOG.info(csv_tran)
    csv_feat = feat
    csv_twt = os.path.join(_aimpath
                        , "%s_timewin.csv"%pren)
    csv_tw_decay = os.path.join(_aimpath
                        , "%s_timewin_decay.csv"%pren)
    LOG.debug(csv_twt)
    
    _start=time.time()
    train = pd.read_csv(csv_tran)
    test = pd.read_csv(csv_feat)

    print("之前训练集尺寸 :\t{} ".format(train.shape))
    print("之前特征集尺寸 :\t{} ".format(test.shape))
    _twin23612 = train
    _twin23612_decay = train




    _unique_mon = train['sale_date'].unique()
    print('有效月度累计:%s月'%len(_unique_mon))
    #_tmp = train.loc[:,['class_id','sale_date','sale_quantity']]
    #print(_tmp[_tmp.class_id == 2])
    #return None

    train['sale_date'] = train['year'] * 100 + train['month']
    train['sale_date'] = train['sale_date'].astype(int)
    train['sale_date'] = pd.to_datetime(train['sale_date'],format='%Y%m',errors = "coerce")
    train['sale_date'] = train['sale_date'].dt.to_period('m')
    #print(train['sale_date'][0] + 1)
    test['sale_date'] = test['sale_date'].astype(int)
    test['sale_date'] = pd.to_datetime(test['sale_date'],format='%Y%m',errors = "coerce")
    test['sale_date'] = test['sale_date'].dt.to_period('M')

    train = pd.concat([train, test]).reset_index(drop=True)
    train.fillna(0, inplace=True)

    print("进入训练集尺寸 :\t{} ".format(train.shape))

    
    # 从最近开始
    #m = train['sale_date'].iloc[-1]
    # 从最远开始
    #m = train['sale_date'].iloc[-1]
    m = train['sale_date'][0] + 1
    # 俩月窗口 特征需计算69轮
    twindow=_gen_twin(m,2)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _decay2M_mix = sale_cal_mix_decay(_twin23612_decay
                                            , twindow,69, seedname='decay2M') 
    print("安装特征集尺寸 :\t{} ".format(_decay2M_mix.shape))
    _twin23612_decay = pd.merge(_twin23612_decay
                                , _decay2M_mix, on=['class_id','sale_date']
                                , how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612_decay.shape))

    # 仨月窗口 特征需计算68轮
    twindow=_gen_twin(m,3)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _decay3M_mix = sale_cal_mix_decay(_twin23612_decay
                                        , twindow,68, seedname='decay3M') 
    print("安装特征集尺寸 :\t{} ".format(_decay3M_mix.shape))
    _twin23612_decay = pd.merge(_twin23612_decay
                                , _decay3M_mix, on=['class_id','sale_date']
                                , how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612_decay.shape))

    # 陆月窗口 特征需计算65轮
    twindow=_gen_twin(m,6)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _decay6M_mix = sale_cal_mix_decay(_twin23612_decay
                                        , twindow,65, seedname='decay6M') 
    print("安装特征集尺寸 :\t{} ".format(_decay6M_mix.shape))
    _twin23612_decay = pd.merge(_twin23612_decay
                                , _decay6M_mix, on=['class_id','sale_date']
                                , how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612_decay.shape))

    # 12月窗口 特征需计算59轮
    twindow=_gen_twin(m,12)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _decay12M_mix = sale_cal_mix_decay(_twin23612_decay
                                        , twindow,59, seedname='decayHY') 
    print("安装特征集尺寸 :\t{} ".format(_decay12M_mix.shape))
    _twin23612_decay = pd.merge(_twin23612_decay
                                , _decay12M_mix, on=['class_id','sale_date']
                                , how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612_decay.shape))




    _end=time.time()
    print('\t Duration:{:.3f}s'.format(_end-_start))

    # 从最近开始
    #m = train['sale_date'].iloc[-1]
    # 从最远开始
    #m = train['sale_date'].iloc[-1]
    m = train['sale_date'][0] + 1
    # 俩月窗口 特征需计算69轮
    twindow=_gen_twin(m,2)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _last2M_mix = sale_cal_mix(_twin23612,twindow,69, seedname='last2M') 
    print("安装特征集尺寸 :\t{} ".format(_last2M_mix.shape))
    _twin23612 = pd.merge(_twin23612, _last2M_mix, on=['class_id','sale_date'], how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612.shape))

    # 仨月窗口 特征需计算68轮
    twindow=_gen_twin(m,3)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _last3M_mix = sale_cal_mix(_twin23612,twindow,68, seedname='last3M') 
    print("安装特征集尺寸 :\t{} ".format(_last3M_mix.shape))
    _twin23612 = pd.merge(_twin23612, _last3M_mix, on=['class_id','sale_date'], how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612.shape))

    # 陆月窗口 特征需计算65轮
    twindow=_gen_twin(m,6)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _last6M_mix = sale_cal_mix(_twin23612,twindow,65, seedname='last6M') 
    print("安装特征集尺寸 :\t{} ".format(_last6M_mix.shape))
    _twin23612 = pd.merge(_twin23612, _last6M_mix, on=['class_id','sale_date'], how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612.shape))

    # 12月窗口 特征需计算59轮
    twindow=_gen_twin(m,12)#[m,m-1] #每次计算必须重新初始化window
    print('\t 时窗 轮算尺寸:{}月'.format(len(twindow)))
    _last12M_mix = sale_cal_mix(_twin23612,twindow,59, seedname='lastHY') 
    print("安装特征集尺寸 :\t{} ".format(_last12M_mix.shape))
    _twin23612 = pd.merge(_twin23612, _last12M_mix, on=['class_id','sale_date'], how='left')
    print("当前训练集尺寸 :\t{} ".format(_twin23612.shape))




    _end=time.time()
    print('\t Duration:{:.3f}s'.format(_end-_start))

    _twin23612.to_csv(csv_twt, index=False)
    print('输出训练集:%s'%csv_twt)
    _twin23612_decay.to_csv(csv_tw_decay, index=False)
    print('输出训练集:%s'%csv_tw_decay)
    #print('输出特征集:%s'%csv_feat)
    _end=time.time()
    print('\t Duration:{:.3f}s'.format(_end-_start))
    #_tmp = train.loc[:,['class_id','sale_date','sale_quantity']]
    #print(_tmp[_tmp.class_id == 2])
    return None


if __name__ == "__main__":
    print(__version__)
    if 4 != len(sys.argv) :
        print('''追加时间窗口训练集
        Usage:
$ YCa2timewin_sets.py path/2/目标训练集 path/2/特征增强数据集 [新数据集前缀 zq225]
    e.g
$ YCa2timewin_sets.py ../raw/CarsSaleForecast/ ../raw/ZQ/train0224features.csv ZQ225
        ''')
    else:
        _train = sys.argv[1]
        _feat = sys.argv[2]
        _name = sys.argv[3]
        timewin_sets(_train, _feat)



        

