/*
* @Author: Hugo1030
* @Date:   2018-03-04
* @Last Modified by:   Hugo1030
* @Last Modified time: 2018-03-04
*/

-- feature_3_train_test
-- CHNAGELOH: 
--      18.3.3 Lichuan init.
--      <= yc_result_sample_a_original   
--      <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
--      => ycc_sales_lichuan0303_feature_3_train_test
-- 
-- du4ai / TianChi / issues / #4 - [TASK] 基础类别特征进行 one-hot 及 数值编码 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/4/task-one-hot
-- 合并合并 训练和测试集, 便于后期处理, 避免 bug
-- Size: 68911576 

CREATE TABLE _stuff_ycc_sales_lichuan0303_train
AS
SELECT sale_date, province_id, city_id, class_id, sale_quantity
FROM ycc_sales_dama0303_dclean_13_kill_chaos_fields;

CREATE TABLE _stuff_ycc_sales_lichuan0303_test
AS
SELECT predict_date AS sale_date, province_id, city_id, class_id, predict_quantity AS sale_quantity
FROM yc_result_sample_a_original;

DROP TABLE IF EXISTS ycc_sales_lichuan0303_feature_3_train_test;

CREATE TABLE ycc_sales_lichuan0303_feature_3_train_test
AS
SELECT *
FROM (
    SELECT *
    FROM _stuff_ycc_sales_lichuan0303_train
    UNION ALL
    SELECT *
    FROM _stuff_ycc_sales_lichuan0303_test
) t;