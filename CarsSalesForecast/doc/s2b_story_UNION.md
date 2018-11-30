# 天池:盐城:乘用车零售量预测:第二赛季算法回顾

DataWork:
- 项目: prj_tc_231640_123409_4l0qvy

附录:
- 时间窗口特征集制备过程 att_timewindow_story.md
- "跳月"策略预测 18.2 过程 att_jump_month_story.md
- "双月"策略预测 18.2 过程 att_doublemonth_story.md

## 综述
> 持续脑洞的理性放弃止损过程...

整体上, 推进过程相对普通:
1. 数据清洗, 主要过滤乱码,补缺值,数值化字串数据
2. 特征提取,  除常规提取外,根据观察,
    - 引入宏观经济数据:
        - 北京地区93号成品油价格
        - 全国购置税历史数据
    - 以及销售行为特征:
        - 当月分省市多少 class_id 在销售;
        - 分省市 class_id 已经销售了多少个月;
3. PAI 模型:  仅仅使用 XGboost/GBDT
4. 多模融合:  根据以往经验, 对不同切分的训练集, 使用不同模型, 获得多组预测结果, 使用简单线性比例加以融合

实际上, 为了提高预测效果,
尝试各种不同的特征/训练数据集,
都根据本地 RMSLE 评估结果, 最终放弃,

详细代码调用, 数据表生成使用过程,在以下各章节分别简述.


## 数据清洗
注意: 执行过程描述约定:

- `IDE:脚本/DAMA/...` SQL 脚本路径
- `<=` 输入数据表名
- `=>` 输出数据表名

```

    IDE:脚本/DAMA/dclean_0_null_kill
    (清查 NULL 并置0)
        <= yc_passenger_car_sales
        => ycc_sales_dama0302_dclean_0_killnull

    IDE:脚本/DAMA/dclean_1_reorder_fields
    (调整字段顺序)
        <=ycc_sales_dama0302_dclean_0_killnull
        => ycc_sales_dama0302_dclean_8_reorder_fields

    IDE:脚本/DAMA/ dclean_2_empty_aim_table
    (构建目标特征集数据空表)
        <= ycc_sales_dama0302_dclean_8_reorder_fields
        => ycc_sales_dama0303_dclean_13_kill_chaos_fields

    IDE:脚本/DAMA/ dclean_3_fix_CHAOS_fields
    (对有乱码的字段进行数值化)
        <= ycc_sales_dama0302_dclean_8_reorder_fields
        => ycc_sales_dama0303_dclean_13_kill_chaos_fields

    IDE:脚本/DAMA/dclean_4_price_level_numerical
    (对price_level 进行数值化)
        <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
        => ycc_sales_dama0303_dclean_13_kill_chaos_fields

    IDE:脚本/DAMA/dclean_5_rated_passenger_numerical
    (对 rated_passenger 进行数值化)
        <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
        => ycc_sales_dama0303_dclean_13_kill_chaos_fields

```

其中发现:
`length(rated_passenger) >= 1` 可以对乱码字段完成判定


至此, 获得 可用原始数据集: `ycc_sales_dama0303_dclean_13_kill_chaos_fields`

## 特征摄取
根据以往 Kaggle 同类大数据竞赛分享的经验,
对车型数据进行标准数值和 one-hot 处置,
对销量进行多种挖掘组织,比如:
- 分省市上月整体销量
- 分省市上一年整体销量
- 上月销量
- ...

除常规的销量组合外, 发现有的车型中途消失, 有的很晚才上市,
所以, 设计追加了整体销售行为特征:
- 分省市在销售 class_id 数量
- 提取分省市 class_id 已经销售月数

另外从国家统计局([http://data.stats.gov.cn](http://data.stats.gov.cn/ "http://data.stats.gov.cn"))等数据源, 发掘很多相关/间接宏观数据, 比如:
- 铝合金产量_当期值(万吨)
- 发动机产量_当期值(万千瓦)_
- 航空运输业固定资产投资额_累计增长(%)_
- 管道运输业固定资产投资额_累计增长(%)
- ...

但是发现合并入特征集时, 造成大量相同数据段, 对模型可能是干挠, 只好放弃,

但保留了`北京地区93号成品油价格`,`全国购置税` 两种对销售有明显刺激效应的指数.


至此, 获得290种特征用来组合为训练集.

## 训练集加强
> 整体策略1
基于A榜最好成绩(RMSLE = 0.79)的 18.1 月销量数据
制备为训练集, 来预测 18.2,
训练集数据则放弃 18.1 不可控数据集,
只取到 17.12 的数据集;

## 模型运用
相比相关教程, 根据经验, 对训练集进行 `鲁棒性` 切分,分化模型效果,以便融合出更好结果;

### 调参

通过 SQL 完成的 RMSLE 算法,
对专门划成不同时段的训练集,获得一组预测集,
然后核算成绩, 以此进一步决策参数调节,
反复预测评估的目标月份是:
- 2015.2
- 2016.2
- 2017.2
- 2017.10
- 2017.11
- 2017.12

通过以上流程, 经过反复检验, 并参考网络中各种相关经验, 对XGboost/GBDT模型, 统一配置以下参数, 可以获得已知最好效果:

- Deta="0.008"
- Dobjective="reg:linear"
- Dseed="0"
- Dnum_round="4200"
- DlabelColName="sale_quantity"
- DinputTableName="ycc_sales_lichuan0309_trainset_2_max_min"
- DenableSparse="false"
- Dmax_depth="8"
- Dsubsample="0.8"
- Dcolsample_bytree="0.6"
- DmodelName="stuff_lichuan_0311_1701_xgboost_model_2"
- Dgamma="0"
- Dlambda="50"
- Dbase_score="0.11"
- Dmin_child_weight="100"

### 切分制备

根据往年销量周期变化, 注意到:
- 每年1/2月都有很大起伏

特此, 将训练集划分为以下不同跨度:
- 2012.01 - 2017.11
- 2012.02 - 2017.12
- 2013.01 - 2017.11
- 2013.02 - 2017.12


至此, 再分别喂给不同 PAI中预置 XGboost/GBDT 模型, 获得一组预测结果集.

## 结果融合
> 单模线性融合

- GBDT 和 XGboost 模型分别有4组预测结果
- 以每组 25% 比重加以融合
- 获得两组预测结果

> 混模线性融合

- 以上两组预测结果
- 再分别以 GBDT:XGboost = 6:4 的比例进行融合
- (具体比例, 人为直觉决定, 没有时间完成数理评估了)

至此, 获得 B榜 第11名 预测集

## 执行过程
> 以上预测过程, 有很多反复尝试/调整, 最终通场过程如下


注意: 执行过程描述约定:

- `IDE:脚本/DAMA/...` SQL 脚本路径
- `IDE:任务/DAMA/...` PAI 脚本路径
- `<=` 输入数据表名
- `=>` 输出数据表名


```
    IDE:脚本/LiChuan/lichuan_0313_traintest_method1
(合并 训练和测试集, 得到真实全轮动结构)
        <= yc_result_sample_b
        <= yc_result_submit_a
        <= ycc_sales_lichuan0307_feature_16_produce_quantity
        => ycc_sales_lichuan0313_traintest_method1

    IDE:脚本/LiChuan/lichuan_0313_oil_price_method1
        <= ycc_sales_lichuan0313_traintest_method1
        => ycc_sales_lichuan0313_oil_price_method1

    IDE:脚本/LiChuan/lichuan_0313_method1_all_process
        <= ycc_sales_lichuan0313_oil_price_method1
中间表
....
        <= 参考: 时间窗口特征集制备过程

        => ycc_sales_lichuan0313_feature_16_produce_quantity

    IDE:脚本/LiChuan/lichuan_0314_dataset_method1
        <= ycc_sales_lichuan0313_feature_16_produce_quantity
        <= ycc_sales_lichuan0307_feature_3_change_double
        => ycc_sales_lichuan0314_traintest_1_method1 合体训练测试集
        => ycc_sales_lichuan0314_trainset_1_method1  训练集 201201-201711        
        => ycc_sales_lichuan0314_trainset_2_method1  训练集 201202-201712               
        => ycc_sales_lichuan0314_trainset_3_method1  训练集 201301-201711             
        => ycc_sales_lichuan0314_trainset_4_method1  训练集 201302-201712
        => ycc_sales_lichuan0314_test_time_window       测试集 201802

(PAI 模型训练)
IDE:任务/LiChuan/lichuan_xgboost_submit
   (模型分组)
        lichuan_0314_xgboost_method1_train1
        lichuan_0314_xgboost_method1_train2
        lichuan_0314_xgboost_method1_train3
        lichuan_0314_xgboost_method1_train4
(结果融合)
    lichuan_0314_submit_xgboost

IDE:任务/Woody/woody_0315/
    woody_0314_CID_mock_B_stragey_one_201802
    (模型分组)
    <=ycc_sales_lichuan0314_trainset_1_method1
    <=ycc_sales_lichuan0314_trainset_1_method1
    <=ycc_sales_lichuan0314_trainset_1_method1
    <=ycc_sales_lichuan0314_trainset_1_method1
    <=ycc_sales_lichuan0314_test_time_window
    =>stuff_woody_0314_stragy_one_out_gbdt_1802_predict_mix  
    =>ycc_sales_woody_0314_strategy_one_out_01_1201_1712_predict
    =>ycc_sales_woody_0314_strategy_one_out_01_1201_1801_predict
    =>ycc_sales_woody_0314_strategy_one_out_01_1301_1801_predict
    =>ycc_sales_woody_0314_strategy_one_out_01_1301_1712_predict

IDE:任务/Woody/woody_0315/
    woody_0314_CID_mock_B_stragey_one_201802_mix_gbdt
    (结果融合)
    <=ycc_sales_woody_0314_strategy_one_out_01_1201_1712_predict
    <=ycc_sales_woody_0314_strategy_one_out_01_1201_1801_predict
    <=ycc_sales_woody_0314_strategy_one_out_01_1301_1801_predict
    <=ycc_sales_woody_0314_strategy_one_out_01_1301_1712_predict
    <=yc_result_sample_b
    =>stuff_woody_0314_stragy_one_out_gbdt_1802_predict_mix
    =>yc_result_submit_b_gbdt_stragy_one
    =>yc_result_submit_b_gbdt_stragy_one_checked

```


## 回顾

由于 B 榜并未给出 18.1 的销量数据, 如果单纯填入 A 榜预测 18.1 销量数据, 进行再预测, 是在预测之上预测, 偏差难免增大. 不过优势是咱们 A 榜成绩第一. 再预测的基础相对更好.

于是我们又想了两种, 不依赖 18.1 销量, 使用原始真实数据集, 直接预测 18.2 销量的策略方法.

经过简单测试, 发现效果并不十分理想. 并且平台赛, 最后两天计算资源非常紧张, 很多思路和想法来不及验证, 甚是遗憾.

以下是对咱们探索的两种策略的介绍:

### "跳月"策略
> 整体策略2

参考: "跳月"策略预测 18.2 过程 att_jump_month_story.md


特征提取让过前一个月,
确保 测试/训练集 销量部分, 都让过不可控月份,
只包含现实数据集;


### "双月"策略
> 整体策略3

参考: "双月"策略预测 18.2 过程 att_doublemonth_story.md

将相邻两月进行合并, 取 销量的和/差/作为label, 这样预测 18.1/18.2 俩月销量和之与和之差, 然后间接取得 18.2 销量

