
create table if not exists stuff_woody_0306_base_feature_10_year_month_check as
select
a.sale_date,
a.province_id,
a.city_id,
a.class_id,
a.sale_quantity,
a.oil_price,
a.total_sale_last1m,
a.total_last12m_sum,
a.sale_last1m,
a.sale_last12m,
a.sale_last12m_sum,
a.cnt_classid,
a.year,
a.month,
b.power_max,
b.power_min,
b.power_avg,
b.car_length_max,
b.car_length_min,
b.car_length_avg,
b.car_width_max,
b.car_width_min,
b.car_width_avg,
b.car_height_max,
b.car_height_min,
b.car_height_avg,
b.total_quality_max,
b.total_quality_min,
b.total_quality_avg,
b.equipment_quality_max,
b.equipment_quality_min,
b.equipment_quality_avg,
b.wheelbase_max,
b.wheelbase_min,
b.wheelbase_avg,
b.front_track_max,
b.front_track_min,
b.front_track_avg,
b.rear_track_max,
b.rear_track_min,
b.rear_track_avg,
b.price_level_max,
b.price_level_min,
b.price_level_avg,
b.displacement_max,
b.displacement_min,
b.displacement_avg,
b.rated_passenger_max,
b.rated_passenger_min,
b.rated_passenger_avg,
b.brand_id_15,
b.brand_id_18,
b.brand_id_21,
b.brand_id_27,
b.brand_id_30,
b.brand_id_36,
b.brand_id_39,
b.brand_id_42,
b.brand_id_48,
b.brand_id_57,
b.brand_id_60,
b.brand_id_63,
b.brand_id_66,
b.brand_id_69,
b.brand_id_84,
b.brand_id_99,
b.brand_id_102,
b.brand_id_108,
b.brand_id_117,
b.brand_id_123,
b.brand_id_126,
b.brand_id_129,
b.brand_id_132,
b.brand_id_135,
b.brand_id_138,
b.brand_id_141,
b.brand_id_165,
b.brand_id_225,
b.brand_id_237,
b.brand_id_10,
b.brand_id_13,
b.brand_id_16,
b.brand_id_22,
b.brand_id_25,
b.brand_id_28,
b.brand_id_31,
b.brand_id_34,
b.brand_id_37,
b.brand_id_43,
b.brand_id_46,
b.brand_id_49,
b.brand_id_52,
b.brand_id_55,
b.brand_id_58,
b.brand_id_67,
b.brand_id_79,
b.brand_id_82,
b.brand_id_91,
b.brand_id_94,
b.brand_id_100,
b.brand_id_103,
b.brand_id_109,
b.brand_id_121,
b.brand_id_127,
b.brand_id_130,
b.brand_id_133,
b.brand_id_139,
b.brand_id_142,
b.brand_id_145,
b.brand_id_187,
b.brand_id_223,
b.brand_id_229,
b.brand_id_232,
b.brand_id_235,
b.brand_id_238,
b.brand_id_2,
b.brand_id_8,
b.brand_id_11,
b.brand_id_14,
b.brand_id_17,
b.brand_id_23,
b.brand_id_29,
b.brand_id_32,
b.brand_id_35,
b.brand_id_38,
b.brand_id_41,
b.brand_id_47,
b.brand_id_50,
b.brand_id_53,
b.brand_id_56,
b.brand_id_59,
b.brand_id_65,
b.brand_id_68,
b.brand_id_77,
b.brand_id_80,
b.brand_id_83,
b.brand_id_86,
b.brand_id_95,
b.brand_id_98,
b.brand_id_101,
b.brand_id_104,
b.brand_id_110,
b.brand_id_122,
b.brand_id_125,
b.brand_id_134,
b.brand_id_137,
b.brand_id_140,
b.brand_id_143,
b.brand_id_173,
b.brand_id_185,
b.brand_id_200,
b.brand_id_209,
b.brand_id_221,
b.brand_id_227,
b.brand_id_230,
b.brand_id_233,
b.brand_id_236,
b.brand_id_239,
b.brand_id_245,
b.compartment_1,
b.compartment_2,
b.compartment_3,
b.type_id_1,
b.type_id_2,
b.type_id_3,
b.type_id_4,
b.level_id_0,
b.level_id_1,
b.level_id_2,
b.level_id_3,
b.level_id_4,
b.level_id_5,
b.level_id_6,
b.level_id_7,
b.department_id_0,
b.department_id_1,
b.department_id_2,
b.department_id_3,
b.department_id_4,
b.department_id_5,
b.tr_0,
b.tr_1,
b.tr_1_2,
b.tr_2,
b.tr_4,
b.tr_4_5,
b.tr_4_6,
b.tr_5,
b.tr_5_0,
b.tr_5_4,
b.tr_5_6,
b.tr_5_7,
b.tr_6,
b.tr_6_0,
b.tr_6_7,
b.tr_7,
b.tr_8,
b.tr_8_0,
b.tr_8_7,
b.tr_9,
b.gearbox_type_amt,
b.gearbox_type_at,
b.gearbox_type_at_cvt,
b.gearbox_type_at_dct,
b.gearbox_type_cvt,
b.gearbox_type_dct,
b.gearbox_type_mt,
b.gearbox_type_mt_amt,
b.gearbox_type_mt_at,
b.gearbox_type_mt_cvt,
b.if_charging_l,
b.if_charging_t,
b.driven_type_id_0,
b.driven_type_id_1,
b.driven_type_id_2,
b.driven_type_id_3,
b.fuel_type_id_0,
b.fuel_type_id_1,
b.fuel_type_id_2,
b.fuel_type_id_3,
b.fuel_type_id_4,
b.newenergy_type_id_0,
b.newenergy_type_id_1,
b.newenergy_type_id_2,
b.newenergy_type_id_3,
b.newenergy_type_id_4,
b.emission_standards_id_0,
b.emission_standards_id_1,
b.emission_standards_id_2,
b.emission_standards_id_3,
b.emission_standards_id_4,
b.if_mpv_id,
b.if_luxurious_id,
b.cylinder_number_0,
b.cylinder_number_3,
b.cylinder_number_4,
b.cylinder_number_5,
b.cylinder_number_6,
b.cylinder_number_8,
b.cylinder_number_12
from ycc_sales_lichuan0306_feature_10_year_month a
left outer join
ycc_sales_lichuan0303_feature_2_base_feautres b
on a.class_id = b.class_id;

-- 备份一份
create table if not exists stuff_woody_0307_base_feature_10_year_month
as select * from stuff_woody_0306_base_feature_10_year_month_check;


--训练集分别201201-201709，201202-201710，201203-201711
-- stuff_woody_0307_base_feature_10_year_month_1201_1709_train
-- stuff_woody_0307_base_feature_10_year_month_1202_1710_train
-- stuff_woody_0307_base_feature_10_year_month_1203_1711_train
-- stuff_woody_0307_base_feature_10_year_month_1201_1712_train
-- 测试集合分别是201710，201711，201712
-- stuff_woody_0307_base_feature_10_year_month_1710_test
-- stuff_woody_0307_base_feature_10_year_month_1711_test
-- stuff_woody_0307_base_feature_10_year_month_1712_test
-- 预测集
-- stuff_woody_0307_base_feature_10_year_month_1801_predict

create table if not exists stuff_woody_0307_base_feature_10_year_month_1201_1709_train
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date not in (201801,201712,201711,201710) );

create table if not exists stuff_woody_0307_base_feature_10_year_month_1202_1710_train
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date not in (201801,201712,201711,201201) );

create table if not exists stuff_woody_0307_base_feature_10_year_month_1203_1711_train
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date not in (201801,201712,201202,201201) );

create table if not exists stuff_woody_0307_base_feature_10_year_month_1201_1712_train
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date !=201801);

create table if not exists stuff_woody_0307_base_feature_10_year_month_1710_test
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date=201710);

create table if not exists stuff_woody_0307_base_feature_10_year_month_1711_test
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date=201711);

create table if not exists stuff_woody_0307_base_feature_10_year_month_1712_test
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date=201712);

create table if not exists stuff_woody_0307_base_feature_10_year_month_1801_predict
as select * from stuff_woody_0307_base_feature_10_year_month
where (sale_date=201801);
