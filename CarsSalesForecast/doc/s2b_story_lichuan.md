# S2b榜算法陈述

## 队伍简介
队伍名"Du4AI", 四位队员均来自 Python 技术社区 [自怼圈][1], 成员分别是 [大妈 Zoom.Quiet][2], [沥川][3], [阿虎][4]和[蔡俊][5]

## 整体赛题回顾

本次比赛, 是阿里天池举办的[印象盐城·数创未来大数据竞赛 - 乘用车零售量预测][6]大数据竞赛.

初赛提供2012年1月-2017年10月盐城分车型销量配置数据,预测 2017 年 11 月和 12 月盐城分车型销量数据.

复赛数据量扩大, 提供2012年1月-2017年12月全国分城市分车型销量配置数据,全国整体车型产量数据,全国宏观经济月度数据. 分别预测 2018 年 1 月和 2 月全国分城市分车型销量数据.

**采用 RMSLE 作为评测指标:**

![][image-1]

相较于初赛的 RMSE, RMSLE 对大值误差不那么敏感, 但是对小值的偏差更加敏感.

比如: 1024 预测 2048, 误差绝对值很大, 但是 log 的平方只有 1. 但如果将 1 预测成 8, 误差绝对值很小, log 后的平方为 4, RMSLE 的误差是前者的 4 倍, 所以需要特别注意销量小的值.

## 解决方案概述

首先我们队数据集进行了清洗工作, 对缺值进行了均值填充, 对重复值和异常值, 进行了清洗去除等操作.

接着针对最要的销量表进行特征提取工作, 第一部分是与 class\_id 相关, 例如: 品牌,厢数,排量...等特征, 代替 class\_id 的对车型进行描述. 另一部分是关于时间与销量关系的时间序列特征.然后选用了部分宏观经济和产量指标作为特征辅助特征.

最后训练了 GBDT, XGBoost 两种模型, 并进行了加权融合.

## 数据集划分

- A 榜

	- 预测区间: 2018.01
	- 特征提取区间:
		- 2013.01 - 2017.11
		- 2013.02 - 2017.12

- B 榜

	- 预测区间: 2018.02
	- 特征提取区间:
		- 2012.01 - 2017.11
		- 2012.02 - 2017.12
		- 2013.01 - 2017.11
		- 2013.02 - 2017.12

## 特征工程

特征工程主要包含三大类, 分别是针对时间和销量相关的时间序列特征, 与车型相关的 class\_id 描述团, 还有与宏观及产量销量的特征.

以下简要地说明各部分特征:
- 时序相关特征
	- total\_sale\_last1M 分省市上月整体销量
	- total\_last12M\_sum 分省市上一年整体销量
	- sale\_last1M 上月销量
	- sale\_last12M 去年同月销量
	- cnt\_classid 本月有多少种车型在销售
	- year 年份
	- month 月份
	- how\_many\_month\_sale 已销售月累加
	- sale\_last2M/3M/6M/12M\_sum/std/avg/max/min 2/3/6/12个月时间窗口,的和/标准差/平均/最大/最小值
	- lastyear\_MoM 上一年同月环比
	- spring\_festival 是否包含春节
- 车型 class\_id 相关特征
	- 类别特征进行 one-hot 编码
		- brand\_id 品牌
		- compartment 箱数
		- type\_id 车型类别
		- level\_id 车型级别
		- department\_id 车型系别
		- gearbox\_type 变速器形式
		- if\_charging 是否增压
		- driven\_type\_id 驱动形式
		- fuel\_type\_id 燃料种类
		- newenergy\_type\_id 新能源类型
		- emission\_standards\_id 排放标准
		- if\_MPV\_id 是否微客
		- if\_luxurious\_id 是否豪华
	- 数值类型, 取平均值
		- displacement 排量
		- price\_level 成交段
		- power 功率
		- engine\_torque 发动机扭矩
		- car\_length 车长
		- car\_width 车宽
		- car\_height 车高
		- total\_quality 总质量
		- equipment\_quality 整备质量
		- rated\_passenger 额定载客
		- wheelbase 轴距
		- front\_track 前轮距
		- rear\_track 后轮距
- 整体宏观特征
	- oil\_price 油价
	- purchase\_tax 低排量购置税
- 产量特征
	- produce\_quantity\_last1m 上月同车型产量


## 模型设计与融合
将 A 榜排名第一(RMSLE = 0.79)的预测值, 填入 18.1 销量. 并提取 18.2 特征

训练了 XGBoost 和 GBDT 两个模型, 然后进行简单的加权融合, XGBoost × 0.4 + XGBoost × 0.6, 作为最终结果提交

## 代码执行顺序
A 榜
```
脚本开发/LiChuan/
    lichuan_0301_feature_1_onehot
        <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
        => ycc_sales_lichuan0303_feature_0_onehot
    lichuan_0303_feature_1_1_merge_onehot
        <= ycc_sales_lichuan0303_feature_0_onehot
        => ycc_sales_lichuan0303_feature_0_onehot
    lichuan_0303_feature_2_base_feautres 基础特征
         <= ycc_sales_dama0303_feature_14_numerical
         => ycc_sales_lichuan0306_feature_15_numerical 数值特征归一化
         <= ycc_sales_lichuan0303_feature_0_onehot
         => ycc_sales_lichuan0303_feature_2_base_feautres 合并 num 和 one-hot 基础特征
    lichuan_0307_2_2_chang_double    
         <= ycc_sales_lichuan0303_feature_2_base_feautres
         => ycc_sales_lichuan0307_feature_3_change_double 4个字段 str -> double
    lichuan_0303_feature_3_train_test
         <= yc_result_submit_a_baseline
         <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
         => ycc_sales_lichuan0304_feature_3_train_test 合并 训练和测试集
    lichuan_0304_feature_4_data_set
         <= ycc_sales_lichuan0304_feature_3_train_test
         => ycc_sales_lichuan0304_feature_4_data_set
    lichuan_0305_feature_5_log_sale
        <= ycc_sales_lichuan0304_feature_4_data_set
        => ycc_sales_lichuan0304_feature_5_log_sale 对 sale_quantity 做 log 变换
    lichuan_0305_feature_6_oil_price
        <= ycc_sales_lichuan0304_feature_5_log_sale
        => ycc_sales_lichuan0305_feature_6_oil_price 全国历史油价特征提取
    lichuan_0305_feature_7_total_sale
        <= ycc_sales_lichuan0305_feature_6_oil_price
        => ycc_sales_lichuan0305_feature_7_total_sale 上个月分省市整体销量及12个月整体销量特征

    (插入时窗)
    lichuan_0305_feature_8_time_window
        <= ycc_sales_lichuan0305_feature_7_total_sale
        <= stuff_ycc_sales_caijun0305_feature_1M_12M_12Msum
        => ycc_sales_lichuan0305_feature_8_time_window 并入上 1/12 月销量及12月销量和
    lichuan_0306_feature_9_count_classid
        <= ycc_sales_lichuan0305_feature_8_time_window
        => ycc_sales_lichuan0306_feature_9_count_classid 当月分省市多少 class_id 在销售
    lichuan_0306_feature_10_year_month
        <= ycc_sales_lichuan0306_feature_9_count_classid
        => ycc_sales_lichuan0306_feature_10_year_month 提取 year/ month 特征
    lichuan_0307_feature_11_how_many_month_sale
        <= ycc_sales_lichuan0306_feature_10_year_month
        => ycc_sales_lichuan0306_feature_11_how_many_month_sale 提取分省市 class_id 已经销售了多少个月
    lichuan_0307_feature_12_purchase_tax
        <= ycc_sales_lichuan0307_feature_11_how_many_month_sale
        => ycc_sales_lichuan0307_feature_12_purchase_tax 购置税特征

    (插入时窗)
    lichuan_0307_feature_13_time_window
        <= ycc_sales_caijun0306_feature_sum_2m3m6m12m
        <= ycc_sales_caijun0306_feature_avg_2m3m6m12m
        <= ycc_sales_caijun0306_feature_std_2m3m6m12m
        => ycc_sales_lichuan0307_feature_13_time_window 并上 2/3/6/12 个月的 sum/avg/std 特征
    lichuan_0308_feature_14_max_min
        <= ycc_sales_lichuan0307_feature_13_time_window
        <= ycc_sales_caijun0306_feature_max_2m3m6m12m
        <= ycc_sales_caijun0306_feature_min_2m3m6m12m
        => ycc_sales_lichuan0307_feature_14_max_min
    lichuan_0309_feature_15_spring_festival
        <= ycc_sales_lichuan0307_feature_14_max_min
        => ycc_sales_lichuan0309_feature_15_spring_festival 是包含春节
    lichuan_0311_lfeature_16_produce_quantity
        <= ycc_sales_lichuan0307_feature_15_spring_festival
        => ycc_sales_lichuan0307_feature_16_produce_quantity 分车型上月产量特征

    (切分数据集)
    lichuan_0307_model_1_time_window
        <= ycc_sales_lichuan0307_feature_16_produce_quantity
        <= ycc_sales_lichuan0307_feature_3_change_double
        => ycc_sales_lichuan0307_traintest_1_time_window 合体训练测试集        
        => ycc_sales_lichuan0307_trainset_1_time_window 训练集 201301-201709        
        => ycc_sales_lichuan0307_testset_1_time_window  测试集 201710       
        => ycc_sales_lichuan0307_trainset_2_time_window 训练集 201302-201710        
        => ycc_sales_lichuan0307_testset_2_time_window  测试集 201711         
        => ycc_sales_lichuan0307_trainset_3_time_window 训练集 201303-201711        
        => ycc_sales_lichuan0307_testset_3_time_window  测试集 201712     
        => ycc_sales_lichuan0307_train_time_window   训练集 201304-201712
        => ycc_sales_lichuan0307_test_time_window       测试集 201801
    lichuan_0309_model_2_max_min
        <= ycc_sales_lichuan0307_traintest_1_time_window 合体训练测试集
        => ycc_sales_lichuan0309_traintest_2_max_min  去掉空值的合体训练测试集
        => ycc_sales_lichuan0309_trainset_1_max_min 训练集1 201301-201709        
        => ycc_sales_lichuan0309_testset_1_max_min   测试集1 201710  
        => ycc_sales_lichuan0309_trainset_2_max_min  训练集2 201302-201710        
        => ycc_sales_lichuan0309_testset_2_max_min   测试集2 201711    
        => ycc_sales_lichuan0309_trainset_3_max_min  训练集3 201303-201711        
        => ycc_sales_lichuan0309_testset_3_max_min   测试集3 201712    
        => ycc_sales_lichuan0309_train_max_min   训练集 201304-201712
        => ycc_sales_lichuan0309_test_max_min       测试集 201801

    (PAI 模型训练)
任务开发/LiChuan
    lichuan_xgboost_submit
        lichuan_0312_xgboost_submit
```

B 榜
```
    lichuan_0313_traintest_method1
        <= yc_result_sample_b
        <= yc_result_submit_a
        <= ycc_sales_lichuan0307_feature_16_produce_quantity
        => ycc_sales_lichuan0313_traintest_method1 合并 训练和测试集, 得到真实全轮动结构

    lichuan_0313_oil_price_method1
        <= ycc_sales_lichuan0313_traintest_method1
        => ycc_sales_lichuan0313_oil_price_method1

    MC:SQL/LiChuan/lichuan_0313_method1_all_process
        <= ycc_sales_lichuan0313_oil_price_method1
中间表
        => ycc_sales_lichuan0313_total_sale_method1

		<=
> 上1个月,上2个月,上3个月... 上12个月的单月销量caijun\_0313\_feature\_1\_basewindow.sql
<= ycc\_sales\_lichuan0313\_traintest\_method1
=> ycc\_sales\_caijun0313\_feature\_basewindow

        => ycc_sales_lichuan0313_feature_8_time_window
        => ycc_sales_lichuan0313_feature_9_count_classid
        => ycc_sales_lichuan0313_feature_10_year_month
        => ycc_sales_lichuan0313_feature_11_how_many_month_sale

		<= ycc\_sales\_caijun0313\_feature\_*_2m3m6m12m
5种时间窗特征
        => ycc_sales_lichuan0313_feature_13_time_window
        => ycc_sales_lichuan0313_feature_15_spring_festival
交付表
        => ycc_sales_lichuan0313_feature_16_produce_quantity

    lichuan_0314_dataset_method1
        <= ycc_sales_lichuan0313_feature_16_produce_quantity
        <= ycc_sales_lichuan0307_feature_3_change_double
        => ycc_sales_lichuan0314_traintest_1_method1 合体训练测试集
        => ycc_sales_lichuan0314_trainset_1_method1  训练集 201201-201711        
        => ycc_sales_lichuan0314_trainset_2_method1  训练集 201202-201712               
        => ycc_sales_lichuan0314_trainset_3_method1  训练集 201301-201711             
        => ycc_sales_lichuan0314_trainset_4_method1  训练集 201302-201712
        => ycc_sales_lichuan0314_test_time_window       测试集 201802

    (PAI 模型训练)
任务开发/LiChuan
    lichuan_xgboost_submit
        lichuan_0314_xgboost_method1_train1
        lichuan_0314_xgboost_method1_train2
        lichuan_0314_xgboost_method1_train3
        lichuan_0314_xgboost_method1_train4
```

```
任务开发/woody_0315/Woody/woody_0314_CID_mock_B_stragey_one_201802

<=ycc_sales_lichuan0314_trainset_1_method1
<=ycc_sales_lichuan0314_trainset_1_method1
<=ycc_sales_lichuan0314_trainset_1_method1
<=ycc_sales_lichuan0314_trainset_1_method1
<=ycc_sales_lichuan0314_test_time_window
=>stuff_woody_0314_stragy_one_out_gbdt_1802_predict_mix  =>ycc_sales_woody_0314_strategy_one_out_01_1201_1712_predict
=>ycc_sales_woody_0314_strategy_one_out_01_1201_1801_predict
=>ycc_sales_woody_0314_strategy_one_out_01_1301_1801_predict
=>ycc_sales_woody_0314_strategy_one_out_01_1301_1712_predict
```
```
任务开发/woody_0315/Woody/woody_0314_CID_mock_B_stragey_one_201802_mix_gbdt

<=ycc_sales_woody_0314_strategy_one_out_01_1201_1712_predict
<=ycc_sales_woody_0314_strategy_one_out_01_1201_1801_predict
<=ycc_sales_woody_0314_strategy_one_out_01_1301_1801_predict
<=ycc_sales_woody_0314_strategy_one_out_01_1301_1712_predict
<=yc_result_sample_b
=>stuff_woody_0314_stragy_one_out_gbdt_1802_predict_mix
=>yc_result_submit_b_gbdt_stragy_one
```





[1]:	https://github.com/DebugUself
[2]:	http://zoomquiet.io/
[3]:	https://github.com/hugo1030
[4]:	https://github.com/wuhuhu800
[5]:	https://github.com/littlexiaocai
[6]:	https://tianchi.aliyun.com/competition/introduction.htm?spm=5176.100066.0.0.2268d780GaGVE6&raceId=231640

[image-1]:	https://ws3.sinaimg.cn/large/006tNc79ly1fpdk96suhlj306w02oa9y.jpg
