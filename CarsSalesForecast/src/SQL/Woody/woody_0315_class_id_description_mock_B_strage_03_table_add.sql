



create table if not exists ycc_woody_0314_mock_B_strategy_three_add as
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
a.cnt_classid,
a.year,
a.month,
a.how_many_month_sale,
a.purchase_tax,
a.sale_last2m_sum,
a.sale_last3m_sum,
a.sale_last6m_sum,
a.sale_last12m_sum,
a.sale_last2m_std,
a.sale_last3m_std,
a.sale_last6m_std,
a.sale_last12m_std,
a.sale_last2m_avg,
a.sale_last3m_avg,
a.sale_last6m_avg,
a.sale_last12m_avg,
a.max2m,
a.max3m,
a.max6m,
a.max12m,
a.min2m,
a.min3m,
a.min6m,
a.min12m,
a.spring_festival,
a.produce_quantity_last1m,
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
from ycc_sales_lichuan0314_feature_16_produce_quantity_add a
left outer join
ycc_sales_lichuan0307_feature_3_change_double b
on a.class_id = b.class_id;



--create table if not exists  ycc_woody_0314_mock_B_strategy_three_add   as select * from ycc_sales_lichuan0309_traintest_2_max_min;
--训练集分别201301-201709，201302-201710，201303-201711

-- 训练集
-- ycc_woody_0314_mock_B_strategy_three_add_1202_1610_train
-- ycc_woody_0314_mock_B_strategy_three_add_1204_1612_train
-- ycc_woody_0314_mock_B_strategy_three_add_1302_1610_train
-- ycc_woody_0314_mock_B_strategy_three_add_1304_1612_train

-- ycc_woody_0314_mock_B_strategy_three_add_1202_1510_train
-- ycc_woody_0314_mock_B_strategy_three_add_1204_1512_train
-- ycc_woody_0314_mock_B_strategy_three_add_1302_1510_train
-- ycc_woody_0314_mock_B_strategy_three_add_1304_1512_train

-- ycc_woody_0314_mock_B_strategy_three_add_1202_1410_train
-- ycc_woody_0314_mock_B_strategy_three_add_1204_1412_train
-- ycc_woody_0314_mock_B_strategy_three_add_1302_1410_train
-- ycc_woody_0314_mock_B_strategy_three_add_1304_1412_train

-- ycc_woody_0314_mock_B_strategy_three_add_1202_1710_train
-- ycc_woody_0314_mock_B_strategy_three_add_1202_1712_train
-- ycc_woody_0314_mock_B_strategy_three_add_1302_1710_train
-- ycc_woody_0314_mock_B_strategy_three_add_1302_1712_train

-- 测试集合分别是201702，201602，201502

-- ycc_woody_0314_mock_B_strategy_three_add_1702_test
-- ycc_woody_0314_mock_B_strategy_three_add_1602_test
-- ycc_woody_0314_mock_B_strategy_three_add_1502_test


-- 预测集
-- ycc_woody_0314_mock_B_strategy_three_add_1802_test


--预测2017年2月
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1202_1610_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1204_1612_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1302_1610_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (
201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1304_1612_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date  in (
201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612));

--预测2016年2月
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1202_1510_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1204_1512_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1302_1510_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (
201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1304_1512_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date  in (
201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512));

--预测2015年2月
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1202_1410_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1204_1412_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1302_1410_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (
201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1304_1412_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date  in (
201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412));

--测试集201702
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1702_test
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date=201702);
--测试集201602
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1602_test
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date=201602);
--测试集201502
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1502_test
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date=201502);

--预测2018年2月
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1202_1710_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1202_1712_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710,201712));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1302_1710_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date in (201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710));
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1302_1712_train
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date  in (201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710,201712));


--预测集201802
create table if not exists ycc_woody_0314_mock_B_strategy_three_add_1802_test
as select * from ycc_woody_0314_mock_B_strategy_three_add
where (sale_date=201802);




--去掉0
create table if not exists  ycc_woody_0314_mock_B_strategy_three_add_0_1202_1710_train as
select * from ycc_woody_0314_mock_B_strategy_three_add_1202_1710_train
where (sale_quantity !=0);

create table if not exists  ycc_woody_0314_mock_B_strategy_three_add_0_1202_1712_train as
select * from ycc_woody_0314_mock_B_strategy_three_add_1202_1712_train
where (sale_quantity !=0);

create table if not exists  ycc_woody_0314_mock_B_strategy_three_add_0_1302_1710_train as
select * from ycc_woody_0314_mock_B_strategy_three_add_1302_1710_train
where (sale_quantity !=0);

create table if not exists  ycc_woody_0314_mock_B_strategy_three_add_0_1302_1712_train as
select * from ycc_woody_0314_mock_B_strategy_three_add_1302_1712_train
where (sale_quantity !=0);
