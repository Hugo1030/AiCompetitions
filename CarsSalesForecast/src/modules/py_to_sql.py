# -*- coding: utf-8 -*-
#!/usr/bin/env python
# @Author: Du4ai
# @Date:   2018-03-04
# @Last Modified by:   Hugo1030
# @Last Modified time: 2018-03-04
# @License: 'MIT'
'''
* 在数加系统内获得全部 features 的值
* 复制 SQL 里面的 feature 到 csv 文件中
* 读取 csv 文件到 pandas
* 获得 feature 的全部列表
* 构建 sql 语言函数
* 生成 sql 语言
'''


import numpy as np 
import pandas as pd

def get_sql(feature):
    """
    1. 读取各个特征的 csv 文件进入 pandas
    2. 得到全部值的列表
    3. 打印全部值的 sql 语言 
    """
    # 读取 pandas 文件
    df = pd.read_csv('../../raw/LiChuan/features/{}.csv'.format(feature))
    
    # 得到全部 brand_id 的列表
    feature_ids = []
    for index, row in df.iterrows():
        feature_ids.append(str(row.values[0]))
        
        
    """
    用于 One-hot 编码的 sql 语言生成
    """
    for i in feature_ids:
        if ";" in i:
            x = i.split(";")[0] + "_" + i.split(";")[1] # 将 xx;xx, 形式转换成 xx_xx 形式, 这样 sql 才能读取
            print('case when {}={} then 1.0 else 0.0 end as {}_{},'.format(feature, i, feature, str(x)))
        else:
            print('case when {}={} then 1.0 else 0.0 end as {}_{},'.format(feature, i, feature, str(i)))
    
    """
    用于相同 class_id 进行 merge 的 sql 语言生成
    """
    for j in feature_ids:
        if ";" in j:
            m = feature + "_" + j.split(";")[0] + "_" + j.split(";")[1] # 将 xx;xx, 形式转换成 xx_xx 形式, 这样 sql 才能读取
            print(",sum(" + m + ") as " + m)
        else:
            n = feature + "_" + j
            print(",sum(" + n + ") as " + n)
            
    """
    用于特征序列的 sql 语言生成
    """
    for j in feature_ids:
        if ";" in j:
            m = feature + "_" + j.split(";")[0] + "_" + j.split(";")[1] # 将 xx;xx, 形式转换成 xx_xx 形式, 这样 sql 才能读取
            print("," + m)
        else:
            n = feature + "_" + j
            print("," + n)