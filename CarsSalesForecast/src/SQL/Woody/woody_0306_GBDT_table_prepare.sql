-- 核对一下数量
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date !=201801 );
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date =201801 );
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window ;

--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date not in (201801,201712) )
--select sale_date from ycc_sales_lichuan0305_feature_8_time_window where (sale_date =201801 );

--select sale_date from ycc_sales_lichuan0305_feature_8_time_window ;
--
--训练集分别201201-201709，201202-201710，201203-201711
-- ycc_sales_woody0306_feature_8_time_window_1201_1709_train
-- ycc_sales_woody0306_feature_8_time_window_1202_1710_train
-- ycc_sales_woody0306_feature_8_time_window_1203_1711_train
-- 测试集合分别是201710，201711，201712
-- ycc_sales_woody0306_feature_8_time_window_1710_test
-- ycc_sales_woody0306_feature_8_time_window_1711_test
-- ycc_sales_woody0306_feature_8_time_window_1712_test
-- 预测集
-- ycc_sales_woody0306_feature_8_time_window_1801_predict
--
--create table if not exists stuff_ycc_sales_woody0306_feature_8_time_window_1201_1709_train
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date not in (201801,201712,201711,201710) );
--检验数据
--select count(*) from stuff_ycc_sales_woody0306_feature_8_time_window_1201_1709_train ;--13814010？有重复按理来说应该是13419324条,197343
--发现自己将201710写错20710导致的，修正过来之后正常
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date not in (201801,201712,201711,201710) );-- 13616667
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date not in (201801,201712,201711) );--13814010
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date not in (201801,201712) );--14011353
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window where (sale_date !=201801 ) --14208696
--select count(*) from ycc_sales_lichuan0305_feature_8_time_window --14406039

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1201_1709_train
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date not in (201801,201712,201711,201710) );

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1202_1710_train
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date not in (201801,201712,201711,201201) );

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1203_1711_train
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date not in (201801,201712,201202,201201) );

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1710_test
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date=201710);

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1711_test
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date=201711);

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1712_test
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date=201712);

--create table if not exists ycc_sales_woody0306_feature_8_time_window_1712_test
--as select * from ycc_sales_lichuan0305_feature_8_time_window
--where (sale_date=201801);
--
--测试关联表
--SELECT a.sale_date,b.sale_date, a.province_id, a.city_id, a.class_id,a.sale_quantity, b.sale_quantity
--FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1710_test) a
--JOIN
--(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1711_test) b
--ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--测试关联表之后是否数量正确--197343
--SELECT count(*)
--FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1710_test) a
--JOIN
--(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1711_test) b
--ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--测试合并表一
--create table if not exists stuff_woody_0306_test
--as SELECT a.sale_date, a.province_id, a.city_id, a.class_id,a.sale_quantity*0.333+b.sale_quantity*0.333 as sale_quantity
--FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1710_test) a
--JOIN
--(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1711_test) b
--ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--测试合并表二
--create table if not exists stuff_woody_0306_test_new
--as SELECT a.sale_date, a.province_id, a.city_id, a.class_id,a.sale_quantity+b.sale_quantity*0.333 as sale_quantity
--FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody_0306_test) a
--JOIN
--(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM ycc_sales_woody0306_feature_8_time_window_1712_test) b
--ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--select * from stuff_woody_0306_test_new
--select count(*) from stuff_woody_0306_test_new
--select count(*) from yc_result_submit_a


--匹配最终表的数据
--SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(10,b.sale_quantity) as predict_quantity
--FROM yc_result_submit_a a LEFT OUTER JOIN stuff_woody_0306_test_new b
--ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);


--统计数量是否为yc_result_submit_a表的行数96785

--SELECT count(*) as predict_quantity
--FROM yc_result_submit_a a LEFT OUTER JOIN stuff_woody_0306_test_new b
--ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--create table if not exists yc_result_submit_a_copy as
--SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(10,b.sale_quantity) as predict_quantity
--FROM yc_result_submit_a a LEFT OUTER JOIN stuff_woody_0306_test_new b
--ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--select count(*)  from yc_result_submit_a_copy
--drop table if exists yc_result_submit_a
--创建一个10月、11月、12月平均值的表
--create table if not exists yc_result_submit_a as select * from yc_result_submit_a_copy
--ok
--select count(*) from yc_result_submit_a
--drop table if exists stuff_woody_0306_test;
--drop table if exists stuff_woody_0306_test_new;
--drop table if exists yc_result_submit_a_copy;
