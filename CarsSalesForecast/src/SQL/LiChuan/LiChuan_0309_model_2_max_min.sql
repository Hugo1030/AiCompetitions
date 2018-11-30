-- dataset_2_max_min
-- CHNAGELOH: 
--      18.3.9 Lichuan init.
--      <= ycc_sales_lichuan0307_traintest_1_time_window 合体训练测试集
--      => ycc_sales_lichuan0309_traintest_2_max_min  去掉空值的合体训练测试集
--      => ycc_sales_lichuan0309_trainset_1_max_min 训练集1 201301-201709        
--      => ycc_sales_lichuan0309_testset_1_max_min   测试集1 201710  
--      => ycc_sales_lichuan0309_trainset_2_max_min  训练集2 201302-201710        
--      => ycc_sales_lichuan0309_testset_2_max_min   测试集2 201711    
--      => ycc_sales_lichuan0309_trainset_3_max_min  训练集3 201303-201711        
--      => ycc_sales_lichuan0309_testset_3_max_min   测试集3 201712    
--      => ycc_sales_lichuan0309_train_max_min   训练集 201304-201712
--      => ycc_sales_lichuan0309_test_max_min    测试集 201801
-- du4ai / TianChi / issues / #11 - [TASK] 批量模型测试及融合 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/11/task
   

DROP TABLE IF EXISTS ycc_sales_lichuan0309_traintest_2_max_min;
CREATE TABLE ycc_sales_lichuan0309_traintest_2_max_min
AS
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
FROM ycc_sales_lichuan0307_traintest_1_time_window
where sale_quantity != 0;

DROP TABLE IF EXISTS ycc_sales_lichuan0309_trainset_1_max_min;
CREATE TABLE ycc_sales_lichuan0309_trainset_1_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where year != 2.012 and sale_date != '201710' and sale_date != '201711' and sale_date != '201712';


DROP TABLE IF EXISTS ycc_sales_lichuan0309_testset_1_max_min;
CREATE TABLE ycc_sales_lichuan0309_testset_1_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where sale_date = '201710';


DROP TABLE IF EXISTS ycc_sales_lichuan0309_trainset_2_max_min;
CREATE TABLE ycc_sales_lichuan0309_trainset_2_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where year != 2.012 and sale_date != '201301' and sale_date != '201711' and sale_date != '201712';

--
DROP TABLE IF EXISTS ycc_sales_lichuan0309_testset_2_max_min;
CREATE TABLE ycc_sales_lichuan0309_testset_2_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where sale_date = '201711' ;
--

DROP TABLE IF EXISTS ycc_sales_lichuan0309_trainset_3_max_min;
CREATE TABLE ycc_sales_lichuan0309_trainset_3_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where year != 2.012 and sale_date != '201301' and sale_date != '201302' and sale_date != '201712';

--
DROP TABLE IF EXISTS ycc_sales_lichuan0309_testset_3_max_min;
CREATE TABLE ycc_sales_lichuan0309_testset_3_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where sale_date = '201712';

--
DROP TABLE IF EXISTS ycc_sales_lichuan0309_train_max_min;
CREATE TABLE ycc_sales_lichuan0309_train_max_min
AS
select sale_date, province_id, city_id, class_id, sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, power_max, power_min
    , max2m, max3m, max6m, max12m
    , min2m, min3m, min6m, min12m
    , power_avg, car_length_max, car_length_min, car_length_avg, car_width_max
    , car_width_min, car_width_avg, car_height_max, car_height_min, car_height_avg
    , total_quality_max, total_quality_min, total_quality_avg, equipment_quality_max, equipment_quality_min
    , equipment_quality_avg, wheelbase_max, wheelbase_min, wheelbase_avg, front_track_max
    , front_track_min, front_track_avg, rear_track_max, rear_track_min, rear_track_avg
    , price_level_max, price_level_min, price_level_avg, displacement_max, displacement_min
    , displacement_avg, rated_passenger_max, rated_passenger_min, rated_passenger_avg, brand_id_15
    , brand_id_18, brand_id_21, brand_id_27, brand_id_30, brand_id_36
    , brand_id_39, brand_id_42, brand_id_48, brand_id_57, brand_id_60
    , brand_id_63, brand_id_66, brand_id_69, brand_id_84, brand_id_99
    , brand_id_102, brand_id_108, brand_id_117, brand_id_123, brand_id_126
    , brand_id_129, brand_id_132, brand_id_135, brand_id_138, brand_id_141
    , brand_id_165, brand_id_225, brand_id_237, brand_id_10, brand_id_13
    , brand_id_16, brand_id_22, brand_id_25, brand_id_28, brand_id_31
    , brand_id_34, brand_id_37, brand_id_43, brand_id_46, brand_id_49
    , brand_id_52, brand_id_55, brand_id_58, brand_id_67, brand_id_79
    , brand_id_82, brand_id_91, brand_id_94, brand_id_100, brand_id_103
    , brand_id_109, brand_id_121, brand_id_127, brand_id_130, brand_id_133
    , brand_id_139, brand_id_142, brand_id_145, brand_id_187, brand_id_223
    , brand_id_229, brand_id_232, brand_id_235, brand_id_238, brand_id_2
    , brand_id_8, brand_id_11, brand_id_14, brand_id_17, brand_id_23
    , brand_id_29, brand_id_32, brand_id_35, brand_id_38, brand_id_41
    , brand_id_47, brand_id_50, brand_id_53, brand_id_56, brand_id_59
    , brand_id_65, brand_id_68, brand_id_77, brand_id_80, brand_id_83
    , brand_id_86, brand_id_95, brand_id_98, brand_id_101, brand_id_104
    , brand_id_110, brand_id_122, brand_id_125, brand_id_134, brand_id_137
    , brand_id_140, brand_id_143, brand_id_173, brand_id_185, brand_id_200
    , brand_id_209, brand_id_221, brand_id_227, brand_id_230, brand_id_233
    , brand_id_236, brand_id_239, brand_id_245, compartment_1, compartment_2
    , compartment_3, type_id_1, type_id_2, type_id_3, type_id_4
    , level_id_0, level_id_1, level_id_2, level_id_3, level_id_4
    , level_id_5, level_id_6, level_id_7, department_id_0, department_id_1
    , department_id_2, department_id_3, department_id_4, department_id_5, gearbox_type_AMT
    , gearbox_type_AT, gearbox_type_AT_CVT, gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT
    , gearbox_type_MT, gearbox_type_MT_AMT, gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L
    , if_charging_T, driven_type_id_0, driven_type_id_1, driven_type_id_2, driven_type_id_3
    , fuel_type_id_0, fuel_type_id_1, fuel_type_id_2, fuel_type_id_3, fuel_type_id_4
    , newenergy_type_id_0, newenergy_type_id_1, newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4
    , emission_standards_id_0, emission_standards_id_1, emission_standards_id_2, emission_standards_id_3, emission_standards_id_4
    , if_mpv_id, if_luxurious_id, cylinder_number_0, cylinder_number_3, cylinder_number_4
    , cylinder_number_5, cylinder_number_6, cylinder_number_8, cylinder_number_12
from ycc_sales_lichuan0309_traintest_2_max_min
where year != 2.012 and sale_date != '201301' and sale_date != '201302' and sale_date != '201303';

DROP TABLE IF EXISTS ycc_sales_lichuan0309_test_max_min ;

CREATE TABLE ycc_sales_lichuan0309_test_max_min
AS
SELECT a.predict_date AS sale_date, a.province_id, a.city_id, a.class_id, a.predict_quantity AS sale_quantity
    , produce_quantity_last1m, spring_festival , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, lastyear_MoM, max2m, max3m
    , max6m, max12m, min2m, min3m, min6m
    , min12m, power_max, power_min, power_avg, car_length_max
    , car_length_min, car_length_avg, car_width_max, car_width_min, car_width_avg
    , car_height_max, car_height_min, car_height_avg, total_quality_max, total_quality_min
    , total_quality_avg, equipment_quality_max, equipment_quality_min, equipment_quality_avg, wheelbase_max
    , wheelbase_min, wheelbase_avg, front_track_max, front_track_min, front_track_avg
    , rear_track_max, rear_track_min, rear_track_avg, price_level_max, price_level_min
    , price_level_avg, displacement_max, displacement_min, displacement_avg, rated_passenger_max
    , rated_passenger_min, rated_passenger_avg, brand_id_15, brand_id_18, brand_id_21
    , brand_id_27, brand_id_30, brand_id_36, brand_id_39, brand_id_42
    , brand_id_48, brand_id_57, brand_id_60, brand_id_63, brand_id_66
    , brand_id_69, brand_id_84, brand_id_99, brand_id_102, brand_id_108
    , brand_id_117, brand_id_123, brand_id_126, brand_id_129, brand_id_132
    , brand_id_135, brand_id_138, brand_id_141, brand_id_165, brand_id_225
    , brand_id_237, brand_id_10, brand_id_13, brand_id_16, brand_id_22
    , brand_id_25, brand_id_28, brand_id_31, brand_id_34, brand_id_37
    , brand_id_43, brand_id_46, brand_id_49, brand_id_52, brand_id_55
    , brand_id_58, brand_id_67, brand_id_79, brand_id_82, brand_id_91
    , brand_id_94, brand_id_100, brand_id_103, brand_id_109, brand_id_121
    , brand_id_127, brand_id_130, brand_id_133, brand_id_139, brand_id_142
    , brand_id_145, brand_id_187, brand_id_223, brand_id_229, brand_id_232
    , brand_id_235, brand_id_238, brand_id_2, brand_id_8, brand_id_11
    , brand_id_14, brand_id_17, brand_id_23, brand_id_29, brand_id_32
    , brand_id_35, brand_id_38, brand_id_41, brand_id_47, brand_id_50
    , brand_id_53, brand_id_56, brand_id_59, brand_id_65, brand_id_68
    , brand_id_77, brand_id_80, brand_id_83, brand_id_86, brand_id_95
    , brand_id_98, brand_id_101, brand_id_104, brand_id_110, brand_id_122
    , brand_id_125, brand_id_134, brand_id_137, brand_id_140, brand_id_143
    , brand_id_173, brand_id_185, brand_id_200, brand_id_209, brand_id_221
    , brand_id_227, brand_id_230, brand_id_233, brand_id_236, brand_id_239
    , brand_id_245, compartment_1, compartment_2, compartment_3, type_id_1
    , type_id_2, type_id_3, type_id_4, level_id_0, level_id_1
    , level_id_2, level_id_3, level_id_4, level_id_5, level_id_6
    , level_id_7, department_id_0, department_id_1, department_id_2, department_id_3
    , department_id_4, department_id_5,gearbox_type_AMT, gearbox_type_AT, gearbox_type_AT_CVT
    , gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT, gearbox_type_MT, gearbox_type_MT_AMT
    , gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L, if_charging_T, driven_type_id_0
    , driven_type_id_1, driven_type_id_2, driven_type_id_3, fuel_type_id_0, fuel_type_id_1
    , fuel_type_id_2, fuel_type_id_3, fuel_type_id_4, newenergy_type_id_0, newenergy_type_id_1
    , newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4, emission_standards_id_0, emission_standards_id_1
    , emission_standards_id_2, emission_standards_id_3, emission_standards_id_4, if_mpv_id, if_luxurious_id
    , cylinder_number_0, cylinder_number_3, cylinder_number_4, cylinder_number_5, cylinder_number_6
    , cylinder_number_8, cylinder_number_12
FROM yc_result_sample_a_original a
LEFT OUTER JOIN ycc_sales_lichuan0307_test_time_window b
ON a.predict_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id
WHERE sale_date = '201801';