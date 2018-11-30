--create table if not exists stuff_woody_0314_stragy_three_gbdt_raw_0 as
--select a.sale_date,a.province_id,a.city_id,a.class_id,a.prediction_result as add_result,b.prediction_result as minus_result
--from (select * from stuff_woody_0314_stragy_three_gbdt_1802_predict_add_0_mix) a
--join (select * from stuff_woody_0314_stragy_three_gbdt_1802_predict_minus_0_mix) b
--on (a.city_id=b.city_id and a.class_id=b.class_id);

--create table if not exists stuff_woody_0314_stragy_three_gbdt_raw_0_1801 as
--select sale_date,province_id,city_id,class_id,(add_result-minus_result)/2 as prediction_result
--from stuff_woody_0314_stragy_three_gbdt_raw_0;

--create table if not exists stuff_woody_0314_stragy_three_gbdt_raw_1802 as
--select sale_date,province_id,city_id,class_id,(add_result+minus_result)/2 as prediction_result
--from stuff_woody_0314_stragy_three_gbdt_raw;


--create table if not exists yc_result_submit_b_gbdt_stragy_three_0 as
--SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(2,b.prediction_result)-1 as predict_quantity
--FROM yc_result_sample_b a LEFT OUTER JOIN stuff_woody_0314_stragy_three_gbdt_raw_0_1802 b
--ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--create table if not exists yc_result_submit_a_gbdt_stragy_three_0_1801 as
--SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(2,b.prediction_result)-1 as predict_quantity
--FROM yc_result_sample_a a LEFT OUTER JOIN stuff_woody_0314_stragy_three_gbdt_raw_0_1801 b
--ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--select count(*) from yc_result_submit_b_gbdt_stragy_three;
--select count(*) from yc_result_submit_a_gbdt_stragy_three_1801;
--
--

--select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
--yc_result_submit_b_gbdt_stragy_three_0 a
--left outer join yc_result_submit_b_gbdt_stragy_one b
--on a.city_id = b.city_id and a.class_id = b.class_id  ;


--select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
--yc_result_submit_a_gbdt_stragy_three_0_1801 a
--left outer join  yc_result_submit_a b
--on a.city_id = b.city_id and a.class_id = b.class_id  ;

--备份和表
--create table if not exists woody_0315_stragegy_three_add_79 as
--select * from stuff_woody_0314_stragy_three_gbdt_1802_predict_add_0_mix;

--
--备份差表
--create table if not exists woody_0315_stragegy_three_minus_79 as
--select * from stuff_woody_0314_stragy_three_gbdt_1802_predict_minus_0_mix;
--
--和表减去79版本值

--create table if not exists woody_0315_stragegy_three_add_79_1 as
--select a.sale_date,a.province_id,a.city_id,a.class_id,a.prediction_result,b.predict_quantity
--from woody_0315_stragegy_three_add_79 a
--left outer join yc_result_submit_a b
--on a.city_id =b.city_id and a.class_id =b.class_id ;
-- 将79版和“和”表组合之后，相减掉
--create table if not exists woody_0315_stragegy_three_add_79_2 as
--select case when predict_quantity is null
--then 0
--else predict_quantity
--end as predict_quantity,sale_date,province_id,city_id,class_id,prediction_result
--from woody_0315_stragegy_three_add_79_1;

--create table if not exists woody_0315_stragegy_three_add_79_3 as
--select sale_date,province_id,city_id,class_id,pow(2,prediction_result)-1-predict_quantity as predict_quantity
--from woody_0315_stragegy_three_add_79_2;

--create table if not exists woody_0315_stragegy_three_add_79_4 as
--select a.predict_date,a.province_id, a.city_id, a.class_id,b. predict_quantity
--FROM yc_result_sample_b a LEFT OUTER JOIN woody_0315_stragegy_three_add_79_3 b
--ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);
--该思路不行，会出现log之后有负数的问题，无法计算下去
--select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
--woody_0315_stragegy_three_add_79_4 a
--left outer join yc_result_submit_b_gbdt_stragy_one b
--on a.city_id = b.city_id and a.class_id = b.class_id  ;
