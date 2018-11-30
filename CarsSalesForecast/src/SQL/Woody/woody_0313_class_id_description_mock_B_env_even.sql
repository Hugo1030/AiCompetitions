


--create table if not exists  stuff_woody_0312_mock_B_env   as select * from ycc_sales_lichuan0309_traintest_2_max_min;
--训练集分别201301-201709，201302-201710，201303-201711

-- stuff_woody_0312_mock_B_env_enev_1202_1610_train
-- stuff_woody_0312_mock_B_env_enev_1204_1612_train
-- stuff_woody_0312_mock_B_env_enev_1302_1610_train
-- stuff_woody_0312_mock_B_env_enev_1304_1612_train

-- stuff_woody_0312_mock_B_env_enev_1202_1510_train
-- stuff_woody_0312_mock_B_env_enev_1204_1512_train
-- stuff_woody_0312_mock_B_env_enev_1302_1510_train
-- stuff_woody_0312_mock_B_env_enev_1304_1512_train

-- stuff_woody_0312_mock_B_env_enev_1202_1410_train
-- stuff_woody_0312_mock_B_env_enev_1204_1412_train
-- stuff_woody_0312_mock_B_env_enev_1302_1410_train
-- stuff_woody_0312_mock_B_env_enev_1304_1412_train

-- stuff_woody_0312_mock_B_env_enev_1202_1710_train
-- stuff_woody_0312_mock_B_env_enev_1204_1712_train
-- stuff_woody_0312_mock_B_env_enev_1302_1710_train
-- stuff_woody_0312_mock_B_env_enev_1304_1712_train

-- 测试集合分别是201710，201711，201713
-- stuff_woody_0312_mock_B_env_1702_test
-- stuff_woody_0312_mock_B_env_1602_test
-- stuff_woody_0312_mock_B_env_1502_test
-- 预测集
-- stuff_woody_0312_mock_B_env_1802_predict


--预测2017年2月
create table if not exists stuff_woody_0312_mock_B_env_enev_1202_1610_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610));
create table if not exists stuff_woody_0312_mock_B_env_enev_1204_1612_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612));
create table if not exists stuff_woody_0312_mock_B_env_enev_1302_1610_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (
201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610));
create table if not exists stuff_woody_0312_mock_B_env_enev_1304_1612_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date  in (
201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612));

--预测2016年2月
create table if not exists stuff_woody_0312_mock_B_env_enev_1202_1510_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510));
create table if not exists stuff_woody_0312_mock_B_env_enev_1204_1512_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512));
create table if not exists stuff_woody_0312_mock_B_env_enev_1302_1510_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (
201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510));
create table if not exists stuff_woody_0312_mock_B_env_enev_1304_1512_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date  in (
201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512));

--预测2015年2月
create table if not exists stuff_woody_0312_mock_B_env_enev_1202_1410_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410));
create table if not exists stuff_woody_0312_mock_B_env_enev_1204_1412_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412));
create table if not exists stuff_woody_0312_mock_B_env_enev_1302_1410_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (
201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410));
create table if not exists stuff_woody_0312_mock_B_env_enev_1304_1412_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date  in (
201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412));




--测试集201702
create table if not exists stuff_woody_0312_mock_B_env_1702_test
as select * from stuff_woody_0312_mock_B_env
where (sale_date=201702);
--测试集201602
create table if not exists stuff_woody_0312_mock_B_env_1602_test
as select * from stuff_woody_0312_mock_B_env
where (sale_date=201602);
--测试集201502
create table if not exists stuff_woody_0312_mock_B_env_1502_test
as select * from stuff_woody_0312_mock_B_env
where (sale_date=201502);

--预测2018年2月
create table if not exists stuff_woody_0312_mock_B_env_enev_1202_1710_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710));
create table if not exists stuff_woody_0312_mock_B_env_enev_1202_1712_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710,201712));
create table if not exists stuff_woody_0312_mock_B_env_enev_1302_1710_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date in (201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710));
create table if not exists stuff_woody_0312_mock_B_env_enev_1302_1712_train
as select * from stuff_woody_0312_mock_B_env
where (sale_date  in (201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710,201712));


--预测集201802
create table if not exists stuff_woody_0312_mock_B_env_1802_predict
as select * from stuff_woody_0312_mock_B_env
where (sale_date=201802);
