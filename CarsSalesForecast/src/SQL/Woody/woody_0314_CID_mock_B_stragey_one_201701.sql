





--train1 : stuff_woody_0314_stragy_one_out_01_1201_1611_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.3"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0314_stragy_one_1201_1611_train"
-DminLeafSampleCount="10"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0314_stragy_one_out_01_1201_1611_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="100";


--predict1: stuff_woody_0314_stragy_one_out_01_1710_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0314_stragy_one_out_01_1201_1611_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0314_stragy_one_out_01_1201_1611_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0314_stragy_one_1701_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate1:stuff_woody_0314_stragy_one_out_01_1201_1611_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1201_1611_predict a
left outer join  stuff_woody_0314_stragy_one_1701_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;

--train2 : stuff_woody_0314_stragy_one_out_01_1202_1612_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.3"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0314_stragy_one_1202_1612_train"
-DminLeafSampleCount="10"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0314_stragy_one_out_01_1202_1612_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="100";


--predict2:stuff_woody_0314_stragy_one_out_01_1711_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0314_stragy_one_out_01_1202_1612_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0314_stragy_one_out_01_1202_1612_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0314_stragy_one_1701_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate2:stuff_woody_0314_stragy_one_out_01_1202_1612_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1202_1612_predict a
left outer join  stuff_woody_0314_stragy_one_1701_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;

--train3 : stuff_woody_0314_stragy_one_out_01_1301_1611_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.3"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0314_stragy_one_1301_1611_train"
-DminLeafSampleCount="10"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0314_stragy_one_out_01_1301_1611_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="100";


--predict3: stuff_woody_0314_stragy_one_out_01_1710_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0314_stragy_one_out_01_1301_1611_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0314_stragy_one_out_01_1301_1611_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0314_stragy_one_1701_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate3:stuff_woody_0314_stragy_one_out_01_1301_1611_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1301_1611_predict a
left outer join  stuff_woody_0314_stragy_one_1701_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;




--train4 : stuff_woody_0314_stragy_one_out_01_1302_1612_train
PAI --GBDT回归
-name GBDT -project algo_public
-DfeatureSplitValueMaxSize="700"
-DlossType="3" --3-REGRESSION LOSS：mean squared error loss
-DrandSeed="0"
-DnewtonStep="1"
-Dshrinkage="0.3"
-DmaxLeafCount="64"
-DlabelColName="sale_quantity"
-DinputTableName="stuff_woody_0314_stragy_one_1302_1612_train"
-DminLeafSampleCount="10"
-DsampleRatio="1"
-DmaxDepth="10"
-DmetricType="0"
-DmodelName="stuff_woody_0314_stragy_one_out_01_1302_1612_model"
-DfeatureRatio="1"
-Dp="1" --可选）指数底数。gbrank与regression loss中的指数底数,默认1如果p 1,将样本的label映身为p^label；当p <= 1时，不做映射，保持原来的label.范围1到5
-Dtau="0.6" --Tau参数。gbrank loss中的Tau参数，默认0.6，范围：[0,1]
-DtestRatio="0"
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12"
-DtreeCount="100";


--predict4:stuff_woody_0314_stragy_one_out_01_1711_2013_test
PAI --预测测试集，注意每个PAI语句结束后的分号
-name prediction -project algo_public
-DdetailColName="prediction_detail"  --输出表中detail列名
-DmodelName="stuff_woody_0314_stragy_one_out_01_1302_1612_model" --输入模型名称
-DitemDelimiter="," --当输入表数据为稀疏格式时，kv间的分割符，这个和DkvDelimiter有什么区别？
-DresultColName="prediction_result" --输出表result列名称
-Dlifecycle="28" --指定输出表的生命周期，应该是28天吧
-DoutputTableName="stuff_woody_0314_stragy_one_out_01_1302_1612_predict" --输出表的名
-DscoreColName="prediction_score" --输出表中score列名
-DkvDelimiter=":" --当输入表数据为稀疏格式时，key和value的分割符
-DinputTableName="stuff_woody_0314_stragy_one_1701_test" --输入的表名
-DenableSparse="false" --输入表是否为稀疏格式
-DappendColNames="sale_date,province_id,city_id,class_id,sale_quantity" --输出表中保留输入表的列名
--输入表中哪些列作为预测的feature，多列以逗号分隔,默认所有列,该值与训练脚本的DfeatureColNames值一样
-DfeatureColNames="province_id,city_id,oil_price,total_sale_last1m,total_last12m_sum,sale_last1m,sale_last12m,cnt_classid,year,month,how_many_month_sale,purchase_tax,sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum,sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std,lastyear_mom,power_max,power_min,max2m,max3m,max6m,max12m,min2m,min3m,min6m,min12m,power_avg,car_length_avg,car_width_avg,car_height_avg,total_quality_avg,equipment_quality_avg,wheelbase_avg,front_track_avg,rear_track_avg,price_level_avg,displacement_avg,rated_passenger_avg,brand_id_15,brand_id_18,brand_id_21,brand_id_27,brand_id_30,brand_id_36,brand_id_39,brand_id_42,brand_id_48,brand_id_57,brand_id_60,brand_id_63,brand_id_66,brand_id_69,brand_id_84,brand_id_99,brand_id_102,brand_id_108,brand_id_117,brand_id_123,brand_id_126,brand_id_129,brand_id_132,brand_id_135,brand_id_138,brand_id_141,brand_id_165,brand_id_225,brand_id_237,brand_id_10,brand_id_13,brand_id_16,brand_id_22,brand_id_25,brand_id_28,brand_id_31,brand_id_34,brand_id_37,brand_id_43,brand_id_46,brand_id_49,brand_id_52,brand_id_55,brand_id_58,brand_id_67,brand_id_79,brand_id_82,brand_id_91,brand_id_94,brand_id_100,brand_id_103,brand_id_109,brand_id_121,brand_id_127,brand_id_130,brand_id_133,brand_id_139,brand_id_142,brand_id_145,brand_id_187,brand_id_223,brand_id_229,brand_id_232,brand_id_235,brand_id_238,brand_id_2,brand_id_8,brand_id_11,brand_id_14,brand_id_17,brand_id_23,brand_id_29,brand_id_32,brand_id_35,brand_id_38,brand_id_41,brand_id_47,brand_id_50,brand_id_53,brand_id_56,brand_id_59,brand_id_65,brand_id_68,brand_id_77,brand_id_80,brand_id_83,brand_id_86,brand_id_95,brand_id_98,brand_id_101,brand_id_104,brand_id_110,brand_id_122,brand_id_125,brand_id_134,brand_id_137,brand_id_140,brand_id_143,brand_id_173,brand_id_185,brand_id_200,brand_id_209,brand_id_221,brand_id_227,brand_id_230,brand_id_233,brand_id_236,brand_id_239,brand_id_245,compartment_1,compartment_2,compartment_3,type_id_1,type_id_2,type_id_3,type_id_4,level_id_0,level_id_1,level_id_2,level_id_3,level_id_4,level_id_5,level_id_6,level_id_7,department_id_0,department_id_1,department_id_2,department_id_3,department_id_4,department_id_5,tr_0,tr_1,tr_1_2,tr_2,tr_4,tr_4_5,tr_4_6,tr_5,tr_5_0,tr_5_4,tr_5_6,tr_5_7,tr_6,tr_6_0,tr_6_7,tr_7,tr_8,tr_8_0,tr_8_7,tr_9,gearbox_type_amt,gearbox_type_at,gearbox_type_at_cvt,gearbox_type_at_dct,gearbox_type_cvt,gearbox_type_dct,gearbox_type_mt,gearbox_type_mt_amt,gearbox_type_mt_at,gearbox_type_mt_cvt,if_charging_l,if_charging_t,driven_type_id_0,driven_type_id_1,driven_type_id_2,driven_type_id_3,fuel_type_id_0,fuel_type_id_1,fuel_type_id_2,fuel_type_id_3,fuel_type_id_4,newenergy_type_id_0,newenergy_type_id_1,newenergy_type_id_2,newenergy_type_id_3,newenergy_type_id_4,emission_standards_id_0,emission_standards_id_1,emission_standards_id_2,emission_standards_id_3,emission_standards_id_4,if_mpv_id,if_luxurious_id,cylinder_number_0,cylinder_number_3,cylinder_number_4,cylinder_number_5,cylinder_number_6,cylinder_number_8,cylinder_number_12";

--estimate4:stuff_woody_0314_stragy_one_out_01_1302_1612_predict
--回归评估
select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1302_1612_predict a
left outer join  stuff_woody_0314_stragy_one_1701_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;
