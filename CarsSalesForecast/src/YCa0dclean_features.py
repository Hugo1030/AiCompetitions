# -*- coding: utf-8 -*-
#!/usr/bin/env python
'''印象盐城·数创未来大数据竞赛 - 乘用车零售量预测 | 赛题与数据 
    https://tianchi.aliyun.com/competition/information.htm?spm=5176.11165320.5678.2.76d0507fX97NYj&raceId=231640

数据处理:
    - 原始数据归并
    - 常规特征提取
'''

__version__ = 'v18.2.25.1542'
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








#import time
#from datetime import datetime

import numpy as np 
import pandas as pd
import warnings
warnings.filterwarnings('ignore')

#from sklearn.preprocessing import MinMaxScaler



from modules.FeatureDraw import unique1hot_by_field
from modules.FeatureDraw import maxinean_by_field



def dclean2features(resp, expp):
    csv_orig = os.path.join(resp
                        , "[new] yancheng_train_20171226.csv")
    csv_test = os.path.join(resp
                        , "yancheng_testA_20171225.csv")
    LOG.debug(csv_orig)
    #_aimpath = os.path.dirname(expp)
    csv_allt = expp
    
    train = pd.read_csv(csv_orig)
    test = pd.read_csv(csv_test)

    #print(train.head())
    #... [5 rows x 32 columns]

    print("The train data size before dropping Id feature is : {} ".format(train.shape))
    print("The test data size before dropping Id feature is : {} ".format(test.shape))

    
    #去重:同一车型在同一月份有多条记录, 简单相加
    labels = ['sale_date','class_id','brand_id'
            ,'compartment','type_id','level_id'
            ,'department_id','TR','gearbox_type'
            ,'displacement','if_charging','price_level'
            ,'driven_type_id','fuel_type_id','newenergy_type_id'
            ,'emission_standards_id','if_MPV_id','if_luxurious_id'
            ,'power','cylinder_number','engine_torque'
            ,'car_length','car_width','car_height'
            ,'total_quality','equipment_quality','rated_passenger'
            , 'wheelbase','front_track','rear_track']

    train = train.groupby(labels).agg('sum').reset_index()
    #print(train.info())
    '''功率异常
    三个功率为81/70的条目里共有两款车
    其中一款车有记载的功率为66和81，我们令值为81
    另一款车有记载的功率为66，70,81和96，也令值为81
    '''

    train['power'][train['power']=='81/70'] = 81
    train['power'] = train['power'].astype('float32')

    # 其它异常调节
    train['engine_torque'][train['engine_torque']=='155/140'] = 155
    train['engine_torque'][train['engine_torque']=='-'] = 201.8
    train['engine_torque'] = train['engine_torque'].astype('float32')

    train['fuel_type_id'][train['fuel_type_id']==1] = '1'
    train['fuel_type_id'][train['fuel_type_id']==2] = '2'
    train['fuel_type_id'][train['fuel_type_id']==3] = '3'

    #   ipynb/caijun/caijun0225bugfix.ipynb
    # 仅对 排量 这一列的0值统一提 2 
    #train[train['displacement'] == 0] = 2.
    train['displacement'][train['displacement'] == 0] = 2.




    train = train.groupby(labels).agg('sum').reset_index()



        
    classLabels = ['class_id']
    #   抛弃 class_id 重叠行
    df_dock = train[classLabels].drop_duplicates().reset_index(drop=True)                                                    
    print('\t 统计 class_id:')
    df_dock.info()
    #   class_id    140 non-null float64

    #   功率
    df_dock = maxinean_by_field(df_dock, train, 'power', echo_head=0)
    #   发动机扭矩
    df_dock = maxinean_by_field(df_dock, train, 'engine_torque')
    #   车长
    df_dock = maxinean_by_field(df_dock, train, 'car_length')
    #   车宽
    df_dock = maxinean_by_field(df_dock, train, 'car_width')
    #   车高
    df_dock = maxinean_by_field(df_dock, train, 'car_height')
    #   车重
    df_dock = maxinean_by_field(df_dock, train, 'total_quality')
    #   装备质量
    df_dock = maxinean_by_field(df_dock, train, 'equipment_quality')
    #   轴距
    df_dock = maxinean_by_field(df_dock, train, 'wheelbase')
    #   前轮距
    df_dock = maxinean_by_field(df_dock, train, 'front_track')
    #   后轮距
    df_dock = maxinean_by_field(df_dock, train, 'rear_track')


    #return None


    #   品牌
    df_dock = unique1hot_by_field(df_dock, train, 'brand_id')
    #   箱数
    df_dock = unique1hot_by_field(df_dock, train, 'compartment')
    #   车型类别
    df_dock = unique1hot_by_field(df_dock, train, 'type_id')
    #   车型级别
    df_dock = unique1hot_by_field(df_dock, train, 'level_id', echo_head=0)
    #   车型系别
    df_dock = unique1hot_by_field(df_dock, train, 'department_id')
    #   变速档位
    df_dock = unique1hot_by_field(df_dock, train, 'TR')
    #   变速器形式
    df_dock = unique1hot_by_field(df_dock, train, 'gearbox_type')
    #   排量
    df_dock = unique1hot_by_field(df_dock, train, 'displacement')
    #   iff 增压
    df_dock = unique1hot_by_field(df_dock, train, 'if_charging', echo_head=0)
    #   成交段/价位
    df_dock = unique1hot_by_field(df_dock, train, 'price_level', echo_head=0)
    #   驱动形式
    df_dock = unique1hot_by_field(df_dock, train, 'driven_type_id', echo_head=0)
    #    燃料种类
    df_dock = unique1hot_by_field(df_dock, train, 'fuel_type_id', echo_head=0)
    #   新能源类型
    df_dock = unique1hot_by_field(df_dock, train, 'newenergy_type_id', echo_head=0)
    #   排放标准
    df_dock = unique1hot_by_field(df_dock, train, 'emission_standards_id')
    #   是否微客 MPV
    df_dock = unique1hot_by_field(df_dock, train, 'if_MPV_id')
    #   缸数
    df_dock = unique1hot_by_field(df_dock, train, 'cylinder_number')
    #   额定载客
    df_dock = unique1hot_by_field(df_dock, train, 'rated_passenger', echo_head=0)







    
    #df_dock.info()
    df_dock.to_csv(csv_allt)
    #LOG.debug(csv_allt)
    print('输出为:%s'%csv_allt)
    return None

    LOG.debug('init.=> \n{}\n{}'.format(
                resp, expp))




if __name__ == "__main__":
    print(__version__)
    if 3 != len(sys.argv) :
        print('''生成统一训练集
        Usage:
$ YCa0dclean_features.py path/2/原始数据目录 path/2/输出数据文件名
    e.g
$ YCa0dclean_features.py ../raw/CarsSaleForecast/ ../raw/ZQ/dclean0224features.csv
        ''')
    else:
        _orig = sys.argv[1]
        _aim = sys.argv[2]
        dclean2features(_orig, _aim)



