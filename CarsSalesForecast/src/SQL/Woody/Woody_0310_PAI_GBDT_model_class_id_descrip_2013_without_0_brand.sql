


--train1 : stuff_woody_0310_max_min_window_brand_1301_1709_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.5"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0310_max_min_window_1301_1709_train"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0310_max_min_window_brand_1301_1709_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="50";


--predict1: stuff_woody_0310_max_min_window_brand_1710_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0310_max_min_window_brand_1301_1709_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0310_max_min_window_brand_1710_2013_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0310_max_min_window_1710_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate1:stuff_woody_0310_max_min_window_brand_1710_2013_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0310_max_min_window_brand_1710_2013_predict a
left outer join  stuff_woody_0310_max_min_window_1710_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;

--train2 : stuff_woody_0310_max_min_window_brand_1302_1710_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.5"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0310_max_min_window_1302_1710_train"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0310_max_min_window_brand_1302_1710_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="50";


--predict2:stuff_woody_0310_max_min_window_brand_1711_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0310_max_min_window_brand_1302_1710_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0310_max_min_window_brand_1711_2013_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0310_max_min_window_1711_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate2:stuff_woody_0310_max_min_window_brand_1711_2013_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0310_max_min_window_brand_1711_2013_predict a
left outer join  stuff_woody_0310_max_min_window_1711_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;

--train3 :stuff_woody_0310_max_min_window_brand_1303_1711_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.6"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0310_max_min_window_1303_1711_train"
-DminLeafSampleCount="1"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0310_max_min_window_brand_1303_1711_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="50";


--predict3:stuff_woody_0310_max_min_window_brand_1712_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0310_max_min_window_brand_1303_1711_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0310_max_min_window_brand_1712_2013_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0310_max_min_window_1712_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate3:stuff_woody_0310_max_min_window_brand_1712_2013_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0310_max_min_window_brand_1712_2013_predict a
left outer join  stuff_woody_0310_max_min_window_1712_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;
