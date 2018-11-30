create table if not exists stuff_woody_0314_stragy_three_gbdt_1712_predict_add_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.5+b.prediction_resultd*0.5 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_add_modfy_out_1302_1710_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_add_modfy_out_1302_1710_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);

select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_three_gbdt_1702_predict_add_mix a
left outer join  ycc_woody_0314_mock_B_strategy_three_add_1702_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;


create table if not exists stuff_woody_0314_stragy_three_gbdt_1712_predict_minus_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.5+b.prediction_result*0.5 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_modfy_out_1202_1710_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_modfy_out_1302_1710_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id);


select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_three_gbdt_1702_predict_minus_mix a
left outer join  ycc_woody_0314_mock_B_strategy_three_minus_1702_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;
