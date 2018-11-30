# S2b榜算法陈述
说明,B榜的一些基础数据和思路是在A帮的基础之上完成的. 因此需要在此先简绍A榜一下
## A榜的数据
2.28知道进入复赛. 3.1日复赛A榜放出数据
### 数据预处理

#### 数据统计-全表统计

#### 数据补充

#### 归一化

#### log处理

### 特征工程的构建

#### 基础特征
字段解释
##### 特征离散化

##### 特征one-hot

#### 时序特征

### 机器学习
机器学习主要是用到GBDT模型和Xgboost模型,最终结果是GBDT和XGboost进行线性融合. 融合之前,分别对GBDT和
XGboost进行单模型融合
#### GBDT
<<<<<<< HEAD
GBDT 训练涉及3个方面:  
1,训练集的样本选取  
2,训练集特征的选择  
3,模型的特征选择
=======
GBDT 训练涉及3个方面:  
1,训练集的样本选取  
2,训练集特征的选择  
3,模型的特征选择  
[建表用的脚本]()  
[跑GBDT模型的脚本]()  
>>>>>>> 664c9ff6b71ca8e2ff2af39d40fda62dff530ede

[建表用的脚本](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0312_class_id_description_no_0_produce_table.sql?at=master&fileviewer=file-view-default):任务开发/woody_0315/woody_0312_class_id_description_no_0_produce_table

```
<=stuff_woody_0310_max_min_window
<=ycc_sales_lichuan0307_feature_16_produce_quantity
训练集
=>stuff_woody_0311_include_produce_quantity_1201_1709_train
=>stuff_woody_0311_include_produce_quantity_1202_1710_train
=>stuff_woody_0311_include_produce_quantity_1203_1711_train
=>stuff_woody_0311_include_produce_quantity_1201_1713_train
测试集
=>stuff_woody_0311_include_produce_quantity_1801_predict
```

[跑GBDT模型的脚本2012](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/Woody_0310_PAI_GBDT_model_class_id_descrip_2012_without_0_produce_final_1.sql?at=master&fileviewer=file-view-default) : 任务开发/woody_0315/Woody_0310_model_class_id_descrip_2012_without_0_produce_final_1
[跑GBDT模型的脚本2013](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/Woody_0310_PAI_GBDT_model_class_id_descrip_2013_without_0_fianl_1.sql?at=master&fileviewer=file-view-default)   
:任务开发/woody_0315/Woody_0310_model_class_id_descrip_2013_without_0_final_1
##### 样本选择
根据测试最终选用的训练集样本为以下时间段数据  
201201-201712  
201203-201711  
201301-201712  
201303-201711  
##### 特征选择
<<<<<<< HEAD
此处主要是通过观察,人为的去掉了一下重复性比较大的信息,然后对比结果变化决定最终特征的去留. 例如有最大,最小和平均值的信息,尝试着去掉最大,最小,保留平均值,看效果. 

不足:由于时间短,只能看一下模型跑完之后的特征重要性,但没有再跑之前做过更科学的降维处理. 
=======
此处主要是通过观察,人为的去掉了一下重复性比较大的信息,然后对比结果变化决定最终特征的去留. 例如有最大,最小和平均值的信息,尝试着去掉最大,最小,保留平均值,看效果.
本次的模型的最终特征:
```
province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12,produce_quantity_last1m
```
不足:由于时间短,只能看一下模型跑完之后的特征重要性,但没有再跑之前做过更科学的降维处理.
>>>>>>> 664c9ff6b71ca8e2ff2af39d40fda62dff530ede
##### 主要参数选择
- 调参的方法是先粗调,再微调:
方法:先设定一组基础参数,默认官方参数. 在官方给的参数的基础上,每次调整一个变量,上下变动参数值范围,进行探索参数变动方向. 方向确定之后,一些参数需要进一步探索参数变动的幅度. 例如inLeafSampleCount,shrinkage.  

- 根据一些探索的结果([探索过程]())最终选定的参数如下:

```
-DlossType="3"
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.3"
-DmaxLeafCount="64"
-DminLeafSampleCount="10"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DfeatureRatio="1"
-Dp="1"
-Dtau="0.6"
-DtestRatio="0"
-DtreeCount="100";
```
##### 单模型融合
GBDT融合策略:  
201201-201712模型的预测集权重0.25  
+201301-201712模型的预测集权重0.25  
+201203-201711模型的预测集权重0.25  
+201303-201711模型的预测集权重0.25

[GBDT单模型融合的脚本](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0311_gbdt_xgboost_mix.sql?at=master&fileviewer=file-view-default):任务开发/woody_0315/woody_0311_gbdt_xgboost_mix
=>yc_result_submit_a_gbdt_copy

##### 模型评估
评估的方式:用预测的结果和当前在线上最好的成绩取rmsle,判断偏离程度;以及整体销量的这一指标,直觉销量下降也是判断模型结果变好的参考.
融合之后的表`yc_result_submit_a_gbdt_copy`和83版本的表`yc_result_submit_a_xgboost0310_083`的rmsle:0.25

评估脚本
```
select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
yc_result_submit_a_gbdt_copy a
left outer join yc_result_submit_a_xgboost0310_083 b
on a.city_id = b.city_id and a.class_id = b.class_id  ;

```
#### XGBOOST

##### 特征选择

##### 参数选择

##### 单模型融合

##### 模型评估


#### 模型融合
一般多模型的融合的效果会比单模型效果好,模型之间能够取长补短. 在S1阶段就发现
两个分数很高的模型融合之后,结果分数不是简单的平均,而是比单模型的结果都好,虽然是线性融合,但是结果却是'化学反应'. 本次融合就是GBDT和XGboost融合. 线性模型由于S1阶段试验过,效果一般,所以S2就忽略了.

##### GBDT和XGboost融合
GBDT模型融合之后,整理销量大概580W,比83版本xgboost做下来少了70W,且
GBDT模型和83版本rmsle查0.25,有一定的距离,但不是特别远
直觉上GBDT应该占比更高一些
<<<<<<< HEAD
模型融合按照融合后的GBDT和融合后的XGboost进行线性融合. 
融合比例GBDT权重0.6,XGboost的权重0.4


https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0311_gbdt_xgboost_mix.sql?at=master&fileviewer=file-view-default):任务开发/woody_0315/woody_0311_gbdt_xgboost_mix
=>yc_result_submit_a_gbdt_60_xgboost_40
=======
模型融合按照融合后的GBDT和融合后的XGboost进行线性融合.
融合比例GBDT权重0.6,XGboost的权重0.4  
[融合代码]()
>>>>>>> 664c9ff6b71ca8e2ff2af39d40fda62dff530ede
#### 融合之后的效果评估

融合之后的表`yc_result_submit_a_gbdt_60_xgboost_40`和83版本的表`yc_result_submit_a_xgboost0310_083`的rmsle:0.14
整体销量大概是610W

评估脚本
```
select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
yc_result_submit_a_gbdt_60_xgboost_40 a
left outer join yc_result_submit_a_xgboost0310_083 b
on a.city_id = b.city_id and a.class_id = b.class_id  ;

```
最终成绩0.7932,从A榜第5升为第1.

## B榜的数据
3.14下午B榜放出数据,发现B榜的class\_id和A榜class\_id的有一些不同. 数据量有所下降.
### 数据预处理

### 预测策略选择
由于1月份的销量没有给出,直接预测2月份的销量,这对模型的鲁棒性要求很高. 我们想到了三种策略:
1. 填入79版(S1a 第一名成绩) 18.1 月销量数据, 预测 18.2, 再预测基础上再次预测, 效果需检验
2. 销量顺延一个月, 取前 2 个月销量作为时序特征. 测试结果得分 1.0 左右
3. 两月进行合并, 取 和/差/商/积, 预测 18.1/18.2 俩月销量, 然后取得 18.2 销量

#### 策略一
[策略一GBDT代码脚本](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0314_CID_mock_B_stragey_one_201802.sql?at=master&fileviewer=file-view-default)  
[GBDT模型脚本融合](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0314_CID_mock_B_stragey_one_201802_mix_gbdt.sql?at=master&fileviewer=file-view-default)
```
```

#### 策略二

#### 策略三
<<<<<<< HEAD
思路:1,将相邻两月的数据进行合并,对销量进行和/差/商/积计算,同时时序特征也按照合并之后的结果进行调整,从以单月为单位变为以双月为单位. 
##### 中间数据脚本

[销量基础表合并脚本](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0313_even_odd_merge_table.sql?at=master&fileviewer=file-view-default) 以及生成数据:任务开发/woody_0315/Woody/woody_0313_even_odd_merge_table

销量日期合并基础表
```
<=ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m
=>ycc_sales_woody_0313_base_mix_2018_add  
=>ycc_sales_woody_0313_base_mix_2018_minus  
=>ycc_sales_woody_0313_base_mix_2018_mul  
=>ycc_sales_woody_0313_base_mix_2018_div
```
[产量基本表合并脚本]()  
```
<=yc_passenger_car_yields     
<=ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m     
=>ycc_sales_woody_0313_base_produce_mix_2018_add
=>ycc_sales_woody_0313_base_produce_mix_2018_minus
=>ycc_sales_woody_0313_base_produce_mix_2018_mul   
=>ycc_sales_woody_0313_base_produce_mix_2018_div   

```

[1801和1802class_id 合并脚本]()  
=======
思路:1,将相邻两月的数据进行合并,对销量进行和/差/商/积计算,同时时序特征也按照合并之后的结果进行调整,从以单月为单位变为以双月为单位.
##### 中间数据脚本  
[销量基础表合并脚本]() 以及生成数据
[产量基本表合并脚本]()  
[1801和1802class\_id 合并脚本]()  
>>>>>>> 664c9ff6b71ca8e2ff2af39d40fda62dff530ede
[时序特征脚本]()  
[特征'和表'脚本]()  
[特征'差表'脚本]()
##### 训练集数据
<<<<<<< HEAD
[生成训练集数据_add](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0315_class_id_description_mock_B_strage_03_table_add.sql?at=master&fileviewer=file-view-default):woody_0315_class_id_description_mock_B_strage_03_table_add

[生成训练集数据_minus](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0315_class_id_description_mock_B_strage_03_table_minus.sql?at=master&fileviewer=file-view-default):woody_0315_class_id_description_mock_B_strage_03_table_minus

```
--训练集
=>ycc_woody_0314_mock_B_strategy_three_add_0_1202_1710_train
=>ycc_woody_0314_mock_B_strategy_three_add_0_1202_1712_train
=>ycc_woody_0314_mock_B_strategy_three_add_0_1302_1710_train
=>ycc_woody_0314_mock_B_strategy_three_add_0_1302_1712_train

=>ycc_woody_0314_mock_B_strategy_three_minus_0_1202_1710_train
=>ycc_woody_0314_mock_B_strategy_three_minus_0_1202_1712_train
=>ycc_woody_0314_mock_B_strategy_three_minus_0_1302_1710_train
=>ycc_woody_0314_mock_B_strategy_three_minus_0_1302_1712_train
--测试集
=>ycc_woody_0314_mock_B_strategy_three_add_1802_test
=>ycc_woody_0314_mock_B_strategy_three_minus_1802_test

```   
[模型训练脚本_add](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0314_CID_mock_B_stragey_three_201802_add_no_0.sql?at=master&fileviewer=file-view-default):woody_0314_CID_mock_B_stragey_three_201802_add_no_0

[模型训练脚本_minus](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0314_CID_mock_B_stragey_three_201802_minus_no_0.sql?at=master&fileviewer=file-view-default) :woody_0314_CID_mock_B_stragey_three_201802_minus_no_0

[add_mix](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0314_CID_mock_B_stragey_theree_201802_mix_add.sql?at=master&fileviewer=file-view-default):woody_0314_CID_mock_B_stragey_theree_201802_mix_add

[minus_mix](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0314_CID_mock_B_stragey_theree_201802_mix_minus.sql?at=master&fileviewer=file-view-default):woody_0314_CID_mock_B_stragey_theree_201802_mix_minus

[生成预测值](https://bitbucket.org/du4ai/tianchi/src/e11be82b8cbe6eb976f2eccb11698fc8cf37f4d0/src/SQL/Woody/woody_0315_chaos.sql?at=master&fileviewer=file-view-default):woody_0315_stragey_theree_predict


=======
[生成训练集数据脚本]()  
[模型训练脚本]()
>>>>>>> 664c9ff6b71ca8e2ff2af39d40fda62dff530ede

##### 模型效果评估
