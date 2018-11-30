
create table if not exists stuff_woody_0311_include_produce_quantity as
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
a.lastyear_mom,
a.power_max,
a.power_min,
a.max2m,
a.max3m,
a.max6m,
a.max12m,
a.min2m,
a.min3m,
a.min6m,
a.min12m,
a.power_avg,
a.car_length_max,
a.car_length_min,
a.car_length_avg,
a.car_width_max,
a.car_width_min,
a.car_width_avg,
a.car_height_max,
a.car_height_min,
a.car_height_avg,
a.total_quality_max,
a.total_quality_min,
a.total_quality_avg,
a.equipment_quality_max,
a.equipment_quality_min,
a.equipment_quality_avg,
a.wheelbase_max,
a.wheelbase_min,
a.wheelbase_avg,
a.front_track_max,
a.front_track_min,
a.front_track_avg,
a.rear_track_max,
a.rear_track_min,
a.rear_track_avg,
a.price_level_max,
a.price_level_min,
a.price_level_avg,
a.displacement_max,
a.displacement_min,
a.displacement_avg,
a.rated_passenger_max,
a.rated_passenger_min,
a.rated_passenger_avg,
a.brand_id_15,
a.brand_id_18,
a.brand_id_21,
a.brand_id_27,
a.brand_id_30,
a.brand_id_36,
a.brand_id_39,
a.brand_id_42,
a.brand_id_48,
a.brand_id_57,
a.brand_id_60,
a.brand_id_63,
a.brand_id_66,
a.brand_id_69,
a.brand_id_84,
a.brand_id_99,
a.brand_id_102,
a.brand_id_108,
a.brand_id_117,
a.brand_id_123,
a.brand_id_126,
a.brand_id_129,
a.brand_id_132,
a.brand_id_135,
a.brand_id_138,
a.brand_id_141,
a.brand_id_165,
a.brand_id_225,
a.brand_id_237,
a.brand_id_10,
a.brand_id_13,
a.brand_id_16,
a.brand_id_22,
a.brand_id_25,
a.brand_id_28,
a.brand_id_31,
a.brand_id_34,
a.brand_id_37,
a.brand_id_43,
a.brand_id_46,
a.brand_id_49,
a.brand_id_52,
a.brand_id_55,
a.brand_id_58,
a.brand_id_67,
a.brand_id_79,
a.brand_id_82,
a.brand_id_91,
a.brand_id_94,
a.brand_id_100,
a.brand_id_103,
a.brand_id_109,
a.brand_id_121,
a.brand_id_127,
a.brand_id_130,
a.brand_id_133,
a.brand_id_139,
a.brand_id_142,
a.brand_id_145,
a.brand_id_187,
a.brand_id_223,
a.brand_id_229,
a.brand_id_232,
a.brand_id_235,
a.brand_id_238,
a.brand_id_2,
a.brand_id_8,
a.brand_id_11,
a.brand_id_14,
a.brand_id_17,
a.brand_id_23,
a.brand_id_29,
a.brand_id_32,
a.brand_id_35,
a.brand_id_38,
a.brand_id_41,
a.brand_id_47,
a.brand_id_50,
a.brand_id_53,
a.brand_id_56,
a.brand_id_59,
a.brand_id_65,
a.brand_id_68,
a.brand_id_77,
a.brand_id_80,
a.brand_id_83,
a.brand_id_86,
a.brand_id_95,
a.brand_id_98,
a.brand_id_101,
a.brand_id_104,
a.brand_id_110,
a.brand_id_122,
a.brand_id_125,
a.brand_id_134,
a.brand_id_137,
a.brand_id_140,
a.brand_id_143,
a.brand_id_173,
a.brand_id_185,
a.brand_id_200,
a.brand_id_209,
a.brand_id_221,
a.brand_id_227,
a.brand_id_230,
a.brand_id_233,
a.brand_id_236,
a.brand_id_239,
a.brand_id_245,
a.compartment_1,
a.compartment_2,
a.compartment_3,
a.type_id_1,
a.type_id_2,
a.type_id_3,
a.type_id_4,
a.level_id_0,
a.level_id_1,
a.level_id_2,
a.level_id_3,
a.level_id_4,
a.level_id_5,
a.level_id_6,
a.level_id_7,
a.department_id_0,
a.department_id_1,
a.department_id_2,
a.department_id_3,
a.department_id_4,
a.department_id_5,
a.tr_0,
a.tr_1,
a.tr_1_2,
a.tr_2,
a.tr_4,
a.tr_4_5,
a.tr_4_6,
a.tr_5,
a.tr_5_0,
a.tr_5_4,
a.tr_5_6,
a.tr_5_7,
a.tr_6,
a.tr_6_0,
a.tr_6_7,
a.tr_7,
a.tr_8,
a.tr_8_0,
a.tr_8_7,
a.tr_9,
a.gearbox_type_amt,
a.gearbox_type_at,
a.gearbox_type_at_cvt,
a.gearbox_type_at_dct,
a.gearbox_type_cvt,
a.gearbox_type_dct,
a.gearbox_type_mt,
a.gearbox_type_mt_amt,
a.gearbox_type_mt_at,
a.gearbox_type_mt_cvt,
a.if_charging_l,
a.if_charging_t,
a.driven_type_id_0,
a.driven_type_id_1,
a.driven_type_id_2,
a.driven_type_id_3,
a.fuel_type_id_0,
a.fuel_type_id_1,
a.fuel_type_id_2,
a.fuel_type_id_3,
a.fuel_type_id_4,
a.newenergy_type_id_0,
a.newenergy_type_id_1,
a.newenergy_type_id_2,
a.newenergy_type_id_3,
a.newenergy_type_id_4,
a.emission_standards_id_0,
a.emission_standards_id_1,
a.emission_standards_id_2,
a.emission_standards_id_3,
a.emission_standards_id_4,
a.if_mpv_id,
a.if_luxurious_id,
a.cylinder_number_0,
a.cylinder_number_3,
a.cylinder_number_4,
a.cylinder_number_5,
a.cylinder_number_6,
a.cylinder_number_8,
a.cylinder_number_12,
b.spring_festival,
b.produce_quantity_last1m
from stuff_woody_0310_max_min_window a
left outer join ycc_sales_lichuan0307_feature_16_produce_quantity b
on (a.sale_date =b.sale_date and a.province_id=b.province_id and a.city_id=b.city_id and a.class_id =b.class_id );


--create table if not exists  stuff_woody_0311_include_produce_quantity   as select * from ycc_sales_lichuan0309_traintest_2_max_min;
--训练集分别201301-201709，201302-201710，201303-201711

-- stuff_woody_0311_include_produce_quantity_1701_1709_train
-- stuff_woody_0311_include_produce_quantity_1702_1710_train
-- stuff_woody_0311_include_produce_quantity_1703_1711_train
-- stuff_woody_0311_include_produce_quantity_1701_1713_train

-- stuff_woody_0311_include_produce_quantity_1601_1709_train
-- stuff_woody_0311_include_produce_quantity_1602_1710_train
-- stuff_woody_0311_include_produce_quantity_1603_1711_train
-- stuff_woody_0311_include_produce_quantity_1601_1713_train

-- stuff_woody_0311_include_produce_quantity_1501_1709_train
-- stuff_woody_0311_include_produce_quantity_1502_1710_train
-- stuff_woody_0311_include_produce_quantity_1503_1711_train
-- stuff_woody_0311_include_produce_quantity_1501_1713_train

-- stuff_woody_0311_include_produce_quantity_1401_1709_train
-- stuff_woody_0311_include_produce_quantity_1402_1710_train
-- stuff_woody_0311_include_produce_quantity_1403_1711_train
-- stuff_woody_0311_include_produce_quantity_1401_1713_train

-- stuff_woody_0311_include_produce_quantity_1301_1709_train
-- stuff_woody_0311_include_produce_quantity_1302_1710_train
-- stuff_woody_0311_include_produce_quantity_1303_1711_train
-- stuff_woody_0311_include_produce_quantity_1301_1713_train

-- stuff_woody_0311_include_produce_quantity_1201_1709_train
-- stuff_woody_0311_include_produce_quantity_1202_1710_train
-- stuff_woody_0311_include_produce_quantity_1203_1711_train
-- stuff_woody_0311_include_produce_quantity_1201_1713_train
-- 测试集合分别是201710，201711，201713
-- stuff_woody_0311_include_produce_quantity_1710_test
-- stuff_woody_0311_include_produce_quantity_1711_test
-- stuff_woody_0311_include_produce_quantity_1713_test
-- 预测集
-- stuff_woody_0311_include_produce_quantity_1801_predict

--从17年开始
create table if not exists stuff_woody_0311_include_produce_quantity_1701_1709_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201710,201601,201602,201603,201604,201605,201606,201607,201608,201609,201610,201611,201612,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1702_1710_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201701,201601,201602,201603,201604,201605,201606,201607,201608,201609,201610,201611,201612,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1703_1711_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201702,201701,201601,201602,201603,201604,201605,201606,201607,201608,201609,201610,201611,201612,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_include_produce_quantity_1701_1712_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201601,201602,201603,201604,201605,201606,201607,201608,201609,201610,201611,201612,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

--从16年开始
create table if not exists stuff_woody_0311_include_produce_quantity_1601_1709_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201710,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1602_1710_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201601,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1603_1711_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201602,201601,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_include_produce_quantity_1601_1712_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201501,201502,201503,201504,201505,201506,201507,201508,201509,201510,201511,201512,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

--从15年开始
create table if not exists stuff_woody_0311_include_produce_quantity_1501_1709_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201710,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1502_1710_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201501,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1503_1711_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201502,201501,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_include_produce_quantity_1501_1712_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201401,201402,201403,201404,201405,201406,201407,201408,201409,201410,201411,201412,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

--从14年开始
create table if not exists stuff_woody_0311_include_produce_quantity_1401_1709_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201710,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1402_1710_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201401,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1403_1711_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201402,201401,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_include_produce_quantity_1401_1712_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201301,201302,201303,201304,201305,201306,201307,201308,201309,201310,201311,201312,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

--从13年开始
create table if not exists stuff_woody_0311_include_produce_quantity_1301_1709_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201710,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1302_1710_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201301,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_include_produce_quantity_1303_1711_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201302,201301,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_include_produce_quantity_1301_1712_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

--从12年开始
create table if not exists stuff_woody_0311_include_produce_quantity_1201_1709_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201710));
create table if not exists stuff_woody_0311_include_produce_quantity_1202_1710_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201711,201201));
create table if not exists stuff_woody_0311_include_produce_quantity_1203_1711_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date not in (201801,201712,201202,201201));
create table if not exists stuff_woody_0311_include_produce_quantity_1201_1712_train
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date !=201801);

--测试集
create table if not exists stuff_woody_0311_include_produce_quantity_1710_test
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date=201710);

create table if not exists stuff_woody_0311_include_produce_quantity_1711_test
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date=201711);

create table if not exists stuff_woody_0311_include_produce_quantity_1712_test
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date=201712);

create table if not exists stuff_woody_0311_include_produce_quantity_1801_predict
as select * from stuff_woody_0311_include_produce_quantity
where (sale_date=201801);
