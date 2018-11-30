
--GBDT四张表融合
create table if not exists stuff_woody_0311_gbdt_mix_log as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.sale_quantity as a_sale_quantity,b.sale_quantity as b_sale_quantity,c.sale_quantity as c_sale_quantity,d.sale_quantity as d_sale_quantity ,
a.sale_quantity*0.25+b.sale_quantity*0.25+c.sale_quantity*0.25+d.sale_quantity*0.25 as sale_quantity
FROM (SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody_0311_include_produce_quantity_final_1_1201_1712_model_yc_result_submit_a) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody_0311_include_produce_quantity_final_1_1203_1711_model_yc_result_submit_a) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody_0311_include_produce_quantity_final_1_1301_1712_model_yc_result_submit_a) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, sale_quantity FROM stuff_woody_0311_include_produce_quantity_final_1_1303_1711_model_yc_result_submit_a) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);


--创建新表匹配最终表的数据
--drop table if exists yc_result_submit_a_gbdt_copy;
create table if not exists yc_result_submit_a_gbdt_copy as
SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(2,b.sale_quantity)-1 as predict_quantity
FROM yc_result_submit_a a LEFT OUTER JOIN stuff_woody_0311_gbdt_mix_log b
ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

--查看融合之后gbdt和82版本rmsle
select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
yc_result_submit_a_gbdt_copy a
left outer join  yc_result_submit_a_xgboost0310_083 b
on a.city_id = b.city_id and a.class_id = b.class_id and a.predict_date=b.predict_date ;
--
--select sum(predict_quantity) from yc_result_submit_a_xgboost;

--select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
--yc_result_submit_a_gbdt_copy a
--left outer join  yc_result_submit_a_xgboost b
--on a.city_id = b.city_id and a.class_id = b.class_id and a.predict_date=b.predict_date ;

--select count(*) from yc_result_submit_a_gbdt_copy;
--select count(*) from yc_result_submit_a_xgboost0310_083;
--gbdt*0.6+xgboost*0.4
--融合gbdt和xgboost表
create table if not exists yc_result_submit_a_gbdt_60_xgboost_40 as
SELECT a.predict_date, a.province_id, a.city_id,a.class_id,
a.predict_quantity*0.6+b.predict_quantity*0.4 as predict_quantity
FROM (SELECT predict_date, province_id, city_id, class_id, predict_quantity FROM yc_result_submit_a_gbdt_copy) a
JOIN
(SELECT predict_date, province_id, city_id, class_id, predict_quantity FROM yc_result_submit_a_xgboost0310_083) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)

--select * from yc_result_submit_a_gbdt_60_xgboost_40;
--select * from yc_result_submit_a;

drop table if exists yc_result_submit_a;
create table if not exists yc_result_submit_a as select * from yc_result_submit_a_gbdt_60_xgboost_40;
--select sum(predict_quantity) from yc_result_submit_a;

select sqrt(sum(pow(log(2,a.predict_quantity+1)-log(2,b.predict_quantity+1),2))/count(a.predict_quantity)) as rmsle from
yc_result_submit_a a
left outer join  yc_result_submit_a_xgboost0310_083 b
on a.city_id = b.city_id and a.class_id = b.class_id and a.predict_date=b.predict_date
