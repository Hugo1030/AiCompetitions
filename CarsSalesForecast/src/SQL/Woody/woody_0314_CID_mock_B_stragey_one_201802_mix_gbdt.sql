create table if not exists stuff_woody_0314_stragy_one_out_gbdt_1802_predict_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.25+b.prediction_result*0.25+c.prediction_result*0.25+d.prediction_result*0.25 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_sales_woody_0314_strategy_one_out_01_1201_1712_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_sales_woody_0314_strategy_one_out_01_1201_1801_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_sales_woody_0314_strategy_one_out_01_1301_1801_predict) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_sales_woody_0314_strategy_one_out_01_1301_1712_predict) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);


create table if not exists yc_result_submit_b_gbdt_stragy_one as
SELECT a.predict_date,a.province_id, a.city_id, a.class_id,pow(2,b.sale_quantity)-1 as predict_quantity
FROM yc_result_sample_b a LEFT OUTER JOIN stuff_woody_0314_stragy_one_out_gbdt_1802_predict_mix b
ON ( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);
