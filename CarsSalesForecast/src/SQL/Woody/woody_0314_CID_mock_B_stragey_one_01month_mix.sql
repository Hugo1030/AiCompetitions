create table if not exists stuff_woody_0314_stragy_one_out_01_1501_predict_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.25+b.prediction_result*0.25+c.prediction_result*0.25+d.prediction_result*0.25 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1201_1411_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1202_1412_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1301_1411_predict) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1302_1412_predict) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);

create table if not exists stuff_woody_0314_stragy_one_out_01_1601_predict_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.25+b.prediction_result*0.25+c.prediction_result*0.25+d.prediction_result*0.25 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1201_1511_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1202_1512_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1301_1511_predict) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1302_1512_predict) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);

create table if not exists stuff_woody_0314_stragy_one_out_01_1701_predict_mix as
SELECT a.sale_date, a.province_id, a.city_id,a.class_id,
a.prediction_result*0.25+b.prediction_result*0.25+c.prediction_result*0.25+d.prediction_result*0.25 as prediction_result
FROM (SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1201_1611_predict) a
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1202_1612_predict) b
ON( a.province_id=b.province_id and a.city_id=b.city_id and a.class_id=b.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1301_1611_predict) c
ON( a.province_id=c.province_id and a.city_id=c.city_id and a.class_id=c.class_id)
JOIN
(SELECT sale_date, province_id, city_id, class_id, prediction_result FROM stuff_woody_0314_stragy_one_out_01_1302_1612_predict) d
ON( a.province_id=d.province_id and a.city_id=d.city_id and a.class_id=d.class_id);

select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1502_predict_mix a
left outer join  stuff_woody_0314_stragy_one_1501_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;

select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1602_predict_mix a
left outer join  stuff_woody_0314_stragy_one_1601_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;

select sqrt(sum(pow(a.prediction_result-b.sale_quantity,2))/count(a.prediction_result)) as rmsle from
stuff_woody_0314_stragy_one_out_01_1702_predict_mix a
left outer join  stuff_woody_0314_stragy_one_1701_test b
on a.city_id = b.city_id and a.class_id = b.class_id and a.sale_date=b.sale_date ;
