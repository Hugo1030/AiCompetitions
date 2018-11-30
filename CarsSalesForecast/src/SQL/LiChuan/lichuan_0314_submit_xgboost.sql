/*
* @Author: Hugo1030
* @Date:   2018-03-16
* @Last Modified by:   Hugo1030
* @Last Modified time: 2018-03-16
*/
-- 策略一:
-- 模型1, 训练集 201201-201711 => yc_result_submit_b_xgboost_method1_trainset1
-- 模型2, 训练集 201202-201712 => yc_result_submit_b_xgboost_method1_trainset2
-- 模型3, 训练集 201301-201711 => yc_result_submit_b_xgboost_method1_trainset3
-- 模型4, 训练集 201302-201712 => yc_result_submit_b_xgboost_method1_trainset4
-- 融合, => yc_result_submit_b_xgboost_stragy_one

-- 获取真实销量的函数
CREATE TABLE yc_result_submit_b_xgboost_method1_trainset1
AS
SELECT a.predict_date, a.province_id, a.city_id, a.class_id
    , pow(2, b.sale_quantity) - 1 AS predict_quantity
FROM yc_result_sample_b a
LEFT OUTER JOIN stuff_lichuan_0314_2019_xgboost_predict_1 b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

-- 模型融合
create table stuff_lichuan0314_method2_train12
as
select a.predict_date, a.province_id, a.city_id, a.class_id,
    a.predict_quantity*0.5 + b.predict_quantity*0.5 as predict_quantity
from yc_result_submit_b_xgboost_method2_trainset1 a
left outer join
    yc_result_submit_b_xgboost_method2_trainset2 b
on a.predict_date = b.predict_date
and a.city_id = b.city_id
and a.class_id = b.class_id;

create table stuff_lichuan0314_method2_train34
as
select a.predict_date, a.province_id, a.city_id, a.class_id,
    a.predict_quantity*0.5 + b.predict_quantity*0.5 as predict_quantity
from yc_result_submit_b_xgboost_method2_trainset3 a
left outer join
    yc_result_submit_b_xgboost_method2_trainset4 b
on a.predict_date = b.predict_date
and a.city_id = b.city_id
and a.class_id = b.class_id;
-- 
drop table if exists yc_result_submit_b_xgboost_stragy_one;

create table yc_result_submit_b_xgboost_stragy_two
as
select a.predict_date, a.province_id, a.city_id, a.class_id,
    a.predict_quantity*0.5 + b.predict_quantity*0.5 as predict_quantity
from stuff_lichuan0314_method2_train12 a
left outer join
    stuff_lichuan0314_method2_train34 b
on a.predict_date = b.predict_date
and a.city_id = b.city_id
and a.class_id = b.class_id;

INSERT OVERWRITE TABLE yc_result_submit_b_xgboost_stragy_two
SELECT predict_date, province_id, city_id, class_id
    , CASE 
        WHEN predict_quantity < 1 THEN 1
        ELSE predict_quantity
    END AS predict_quantity
FROM yc_result_submit_b_xgboost_stragy_two;
-- 
drop table if exists yc_result_submit_b;

create table yc_result_submit_b
as
select a.predict_date, a.province_id, a.city_id, a.class_id
    ,a.predict_quantity*0.4 + b.predict_quantity*0.6 as predict_quantity
from yc_result_submit_b_xgboost_stragy_one a
left outer join 
    yc_result_submit_b_gbdt_stragy_one_checked b
on a.predict_date = b.predict_date
and a.city_id = b.city_id
and a.class_id = b.class_id;

