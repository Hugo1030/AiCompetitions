-- feature_3_change_double
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
--      <= ycc_sales_lichuan0303_feature_2_base_feautres
--      => ycc_sales_lichuan0307_feature_3_change_double
-- du4ai / TianChi / issues / #4 - [TASK] 基础类别特征进行 one-hot 及 数值编码 
--    https://bitbucket.org/du4ai/tianchi/issues/4/task-one-hot
-- displacement_max, displacement_min], rated_passenger_max, rated_passenger_min 
-- 4 个字段由 str -> double
DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_3_change_double;

CREATE TABLE ycc_sales_lichuan0307_feature_3_change_double
AS
SELECT class_id, power_max, power_min, power_avg, car_length_max
    , car_length_min, car_length_avg, car_width_max, car_width_min, car_width_avg
    , car_height_max, car_height_min, car_height_avg, total_quality_max, total_quality_min
    , total_quality_avg, equipment_quality_max, equipment_quality_min, equipment_quality_avg, wheelbase_max
    , wheelbase_min, wheelbase_avg, front_track_max, front_track_min, front_track_avg
    , rear_track_max, rear_track_min, rear_track_avg, price_level_max, price_level_min
    , price_level_avg, CAST(displacement_max AS DOUBLE) AS displacement_max, CAST(displacement_min AS DOUBLE) AS displacement_min, displacement_avg, CAST(rated_passenger_max AS DOUBLE) AS rated_passenger_max
    , CAST(rated_passenger_min AS DOUBLE) AS rated_passenger_min, rated_passenger_avg, brand_id_15, brand_id_18, brand_id_21
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
    , department_id_4, department_id_5, tr_0, tr_1, tr_1_2
    , tr_2, tr_4, tr_4_5, tr_4_6, tr_5
    , tr_5_0, tr_5_4, tr_5_6, tr_5_7, tr_6
    , tr_6_0, tr_6_7, tr_7, tr_8, tr_8_0
    , tr_8_7, tr_9, gearbox_type_AMT, gearbox_type_AT, gearbox_type_AT_CVT
    , gearbox_type_AT_DCT, gearbox_type_CVT, gearbox_type_DCT, gearbox_type_MT, gearbox_type_MT_AMT
    , gearbox_type_MT_AT, gearbox_type_MT_CVT, if_charging_L, if_charging_T, driven_type_id_0
    , driven_type_id_1, driven_type_id_2, driven_type_id_3, fuel_type_id_0, fuel_type_id_1
    , fuel_type_id_2, fuel_type_id_3, fuel_type_id_4, newenergy_type_id_0, newenergy_type_id_1
    , newenergy_type_id_2, newenergy_type_id_3, newenergy_type_id_4, emission_standards_id_0, emission_standards_id_1
    , emission_standards_id_2, emission_standards_id_3, emission_standards_id_4, if_mpv_id, if_luxurious_id
    , cylinder_number_0, cylinder_number_3, cylinder_number_4, cylinder_number_5, cylinder_number_6
    , cylinder_number_8, cylinder_number_12
FROM ycc_sales_lichuan0303_feature_2_base_feautres;