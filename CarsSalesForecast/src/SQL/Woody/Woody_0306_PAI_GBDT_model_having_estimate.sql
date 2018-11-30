--训练生成的模型
drop offlinemodel if exists ycc_sales_woody0306_feature_8_time_window_1201_1709_model;
drop offlinemodel if exists ycc_sales_woody0306_feature_8_time_window_1202_1710_model;
drop offlinemodel if exists ycc_sales_woody0306_feature_8_time_window_1203_1711_model;
-- 预测测试集产生的临时表
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1710_predict;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1711_predict;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1712_predict;
--评估产生的临时表
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1710_estimate;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1711_estimate;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1712_estimate;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1710_estimate_histogram;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1711_estimate_histogram;
drop table if exists stuff_ycc_sales_woody0306_feature_8_time_window_1712_estimate_histogram;
--预测最终结果集产生的临时表
drop table if exists stuff_woody0306_1201_1709_model_yc_result_submit_a;
drop table if exists stuff_woody0306_1202_1710_model_yc_result_submit_a;
drop table if exists stuff_woody0306_1203_1711_model_yc_result_submit_a;

--train1 : ycc_sales_woody0306_feature_8_time_window_1201_1709_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="500"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.5"
-DmaxLeafCount="32"
-DlabelColName="sale_quantity"
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1201_1709_train"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1201_1709_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum"
-DtreeCount="50";


--predict1: ycc_sales_woody0306_feature_8_time_window_1710_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1201_1709_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1710_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1710_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum";


--estimate1:stuff_ycc_sales_woody0306_feature_8_time_window_1710_predict
PAI --回归评估
-name regression_evaluation -project algo_public
-DinputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1710_predict"--输入表名
-DyColName="sale_quantity"   --输入表lable列
-DpredictionColName="prediction_result"  --预测结果列
-DindexOutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1710_estimate"  --输出表表名
-Dlifecycle=28
-DresidualOutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1710_estimate_histogram";-- 残差直方图输出表表名，必填

--train2 : ycc_sales_woody0306_feature_8_time_window_1201_1710_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="500"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.5"
-DmaxLeafCount="32"
-DlabelColName="sale_quantity"
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1202_1710_train"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1202_1710_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum"
-DtreeCount="50";


--predict2:ycc_sales_woody0306_feature_8_time_window_1711_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1202_1710_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1711_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1711_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum";

--estimate2:stuff_ycc_sales_woody0306_feature_8_time_window_1711_predict
PAI --回归评估
-name regression_evaluation -project algo_public
-DinputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1711_predict"--输入表名
-DyColName="sale_quantity"   --输入表lable列
-DpredictionColName="prediction_result"  --预测结果列
-DindexOutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1711_estimate"  --输出表表名
-Dlifecycle=28
-DresidualOutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1711_estimate_histogram";-- 残差直方图输出表表名，必填



--train3 :ycc_sales_woody0306_feature_8_time_window_1203_1711_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="500"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.5"
-DmaxLeafCount="32"
-DlabelColName="sale_quantity"
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1203_1711_train"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1203_1711_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum"
-DtreeCount="50";


--predict3:ycc_sales_woody0306_feature_8_time_window_1712_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1203_1711_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1712_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1712_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum";


--estimate3:stuff_ycc_sales_woody0306_feature_8_time_window_1712_predict
PAI --回归评估
-name regression_evaluation -project algo_public
-DinputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1712_predict"--输入表名
-DyColName="sale_quantity"   --输入表lable列
-DpredictionColName="prediction_result"  --预测结果列
-DindexOutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1712_estimate"  --输出表表名
-Dlifecycle=28
-DresidualOutputTableName="stuff_ycc_sales_woody0306_feature_8_time_window_1712_estimate_histogram";-- 残差直方图输出表表名，必填




--------------------------------以下部分为预测201801数据--------------------------------------------
--predict_201801_1:ycc_sales_woody0306_feature_8_time_window_1201_1709_model

PAI --预测最终结果
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1201_1709_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="sale_quantity" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody0306_1201_1709_model_yc_result_submit_a" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1801_predict" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum";

--predict_201801_2:ycc_sales_woody0306_feature_8_time_window_1202_1710_model
PAI --预测最终结果
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1202_1710_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="sale_quantity" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody0306_1202_1710_model_yc_result_submit_a" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1801_predict" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum";


--predict_201801_3:ycc_sales_woody0306_feature_8_time_window_1203_1711_model
PAI --预测最终结果
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="ycc_sales_woody0306_feature_8_time_window_1203_1711_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="sale_quantity" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody0306_1203_1711_model_yc_result_submit_a" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="ycc_sales_woody0306_feature_8_time_window_1801_predict" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,class_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,sale_last12m_sum";

----------------------------将预测的三张表的结果合并成新的结果------------------------------------------------
--合并表一
create table if not exists stuff_woody_0306_test
as SELECT a.sale_date, a.province_id, a.city_id, a.class_id,a.sale_quantity*0.333+b.sale_quantity*0.333 as sale_quantity
FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody0306_1201_1709_model_yc_result_submit_a) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody0306_1202_1710_model_yc_result_submit_a) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--合并表二
create table if not exists stuff_woody_0306_test_new
as SELECT a.sale_date, a.province_id, a.city_id, a.class_id,a.sale_quantity+b.sale_quantity*0.333 as sale_quantity
FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody_0306_test) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody0306_1203_1711_model_yc_result_submit_a) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);


--创建新表匹配最终表的数据
create table if not exists yc_result_submit_a_copy as
SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(10,b.sale_quantity) as predict_quantity
FROM yc_result_submit_a a LEFT OUTER JOIN stuff_woody_0306_test_new b
ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

-- 需要把表yc_result_submit_a和yc_result_submit_a_copy换一下
drop table if exists yc_result_submit_a;
create table if not exists yc_result_submit_a as select * from yc_result_submit_a_copy;
-- 删除临时表
drop table if exists stuff_woody_0306_test;
drop table if exists stuff_woody_0306_test_new;
drop table if exists yc_result_submit_a_copy;
