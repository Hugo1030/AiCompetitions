create table if not exists stuff_woody_0314_stragy_three_gbdt_1802_predict_minus_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.25+b.prediction_result*0.25+c.prediction_result*0.25+d.prediction_result*0.25 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_out_1202_1710_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_out_1202_1712_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_out_1302_1710_predict) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_out_1302_1712_predict) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);



--去掉0的合并

create table if not exists stuff_woody_0314_stragy_three_gbdt_1802_predict_minus_0_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.25+b.prediction_result*0.25+c.prediction_result*0.25+d.prediction_result*0.25 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_0_out_1202_1710_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_0_out_1202_1712_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_0_out_1302_1710_predict) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM ycc_woody_0314_mock_B_strategy_three_minus_0_out_1302_1712_predict) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);
