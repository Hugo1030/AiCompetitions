### 如何使用PAI
PAI命令行
- 使用PAI命令的IDE界面入口:

![1](https://user-images.githubusercontent.com/21167490/36955234-38ec17ca-2062-11e8-948c-847d35ff65c9.png)

![](https://user-images.githubusercontent.com/21167490/36955232-38b31fe2-2062-11e8-919f-8570b005d89b.png)

![](https://user-images.githubusercontent.com/21167490/36955235-392586b8-2062-11e8-821b-546d91805998.png)

![](https://user-images.githubusercontent.com/21167490/36955236-396070ca-2062-11e8-970c-6f5aeb34793d.png)

- [PAI相关模型参数介绍](https://help.aliyun.com/document_detail/42745.html?spm=a2c4g.11186623.6.556.dniKtC)
    + 补充xgboost模型

        - 参考文档[阿里大航杯AI电力大赛比赛分享及数加平台，机器学习pai使用经验](https://yq.aliyun.com/articles/138214)

        - 参数可以参照gbdt,命令如下

```python
drop table if exists xgb_pred_1;
DROP OFFLINEMODEL IF EXISTS xgboost_1;
```

```python
-- train
PAI
-name xgboost
-project algo_public
-Deta="0.01"
-Dobjective="reg:linear"
-DitemDelimiter=","
-Dseed="0"
-Dnum_round="3500"
-DlabelColName="power_consumption"
-DinputTableName="tianchi_power_sum_min_input_1"
-DenableSparse="false"
-Dmax_depth="8"
-Dsubsample="0.4"
-Dcolsample_bytree="0.6"
-DmodelName="xgboost_1"
-Dgamma="0"
-Dlambda="50"
-DfeatureColNames="year,month,day,dow,holiday,season,mean_1,d_max_1,d_min_1,d_median_1,mean_2,d_max_2,d_min_2,d_median_2,mean_avg,mean_dist,d_max_avg,d_max_dist,d_min_avg,d_min_dist,d_median_avg,d_median_dist,tem_h,tem_l,tem_avg,tem_dist,row_n"
-Dbase_score="0.11"
-Dmin_child_weight="100"
-DkvDelimiter=":";

-- predict
PAI
-name prediction
-project algo_public
-DdetailColName="prediction_detail"
-DappendColNames="year,day"
-DmodelName="xgboost_1"
-DitemDelimiter=","
-DresultColName="prediction_result"
-Dlifecycle="28"
-DoutputTableName="xgb_pred_1"
-DscoreColName="prediction_score"
-DkvDelimiter=":"
-DfeatureColNames="year,month,day,dow,holiday,season,mean_1,d_max_1,d_min_1,d_median_1,mean_2,d_max_2,d_min_2,d_median_2,mean_avg,mean_dist,d_max_avg,d_max_dist,d_min_avg,d_min_dist,d_median_avg,d_median_dist,tem_h,tem_l,tem_avg,tem_dist,row_n"
-DinputTableName="tianchi_power_sum_min_output_2"
-DenableSparse="false";

select * from xgb_pred_1;
```

### 实战测试：
- 牛刀小试GBDT二分类数据

```python
drop offlinemodel if exists woody_0305_gbdt_lr_test_model;
drop table if exists gbdt_lr_test_prediction_result;

PAI --GBDT二分类
-name gbdt_lr -project algo_public --不用管
-DfeatureSplitValueMaxSize="500"
-DrandSeed="1" --随机种子
-Dshrinkage="1" --学习率
-DmaxLeafCount="30" --最大叶子数
-DlabelColName="_c2" --lable 列
-DinputTableName="pai_temp_109669_1246532_1" --输入表名
-DminLeafSampleCount="1"
-DsampleRatio="1" --训练样本蔡俊
-DmaxDepth="10" --最大树深
-DmodelName="woody_0305_gbdt_lr_test_model" --输出模型名称
-DmetricType="0" --metic类型
-DfeatureRatio="1" --特征列选择比例
-DtestRatio="0" --test部分选择的比例
-DfeatureColNames="pm10,so2,co,no2"
-DtreeCount="5";

PAI --预测
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="woody_0305_gbdt_lr_test_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="woody_gbdt_lr_test_prediction_result" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="pai_temp_109669_1246532_2" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="_c2"; --输出表中保留输入表的列名
```
训练结果
![](https://user-images.githubusercontent.com/21167490/36961657-55fa3f7a-2087-11e8-8581-3b942357b838.png)

- xgboost二分类牛刀小试

```python
drop offlinemodel if exists woody_0305_xgboost_test_model;
drop table if exists woody_0305_xgboost_test_prediction_result;

-- train
PAI
-name xgboost
-project algo_public
-Deta="0.01"
-Dobjective="binary:logistic"
-DitemDelimiter=","
-Dseed="0"
-Dnum_round="400"
-DlabelColName="_c2"
-DinputTableName="pai_temp_109669_1246532_1"
-DenableSparse="false"
-Dmax_depth="8"
-Dsubsample="1"
-Dcolsample_bytree="1"
-DmodelName="woody_0305_xgboost_test_model"
-Dgamma="0"
-Dlambda="10"
-DfeatureColNames="pm10,so2,co,no2"
-Dbase_score="0.5"
-Dmin_child_weight="100"
-DkvDelimiter=":";

-- predict

PAI --预测
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="woody_0305_xgboost_test_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="woody_0305_xgboost_test_prediction_result" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="pai_temp_109669_1246532_2" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="_c2"; --输出表中保留输入表的列名

select * from woody_0305_xgboost_test_prediction_result
```
结果：
![](https://user-images.githubusercontent.com/21167490/36964721-84280de0-2092-11e8-98a8-ca8f3a6c5138.png)

- GBDT回归牛刀小试

```python
drop offlinemodel if exists woody_0308_xlab_m_GBDT_LR;
drop table if exists woody_0305_gbdt_test_prediction_result;
--train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="500"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.5"
-DmaxLeafCount="32"
-DlabelColName="claimvalue"
-DinputTableName="pai_temp_110951_1256082_1"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="woody_0308_xlab_m_GBDT_LR"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="farmsize,rainfall,landquality,region_num,claimtype_num,farmincome"
-DtreeCount="50";


--predict
PAI
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="woody_0308_xlab_m_GBDT_LR" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="woody_0305_gbdt_test_prediction_result" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="pai_temp_110951_1256086_1" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="claimvalue"; --输出表中保留输入表的列名

select * from woody_0305_gbdt_test_prediction_result

```
结果展示：
![](https://user-images.githubusercontent.com/21167490/36981089-2eb37cac-20c7-11e8-9fdd-1e119ba194fe.png)

跑模型注意：
1、有多个参数时，之间不能有空格
2、PAI预测里有个参数，-DenableSparse="false" --输入表是否为稀疏格式，我改为true，之后发现
模型测效果不是很好，尽管用到矩阵确实是稀疏矩阵。
