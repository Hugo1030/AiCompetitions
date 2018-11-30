/*
* @Author: Hugo1030
* @Date:   2018-03-15
* @Last Modified by:   Hugo1030
* @Last Modified time: 2018-03-15
*/

-- feature_3_traintest_methond1
-- CHNAGELOH: 
--      18.3.13 Lichuan init.
--      <= yc_result_sample_b 
--      <= yc_result_submit_a
--      <= ycc_sales_lichuan0307_feature_16_produce_quantity
--      => ycc_sales_lichuan0313_traintest_method1 合并 训练和测试集, 得到真实全轮动结构

-- du4ai / TianChi / issues / #22 - [TASK] B 榜数据处理 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/22/task-b
   
-- 从 ycc_sales_lichuan0307_feature_16_produce_quantity 取出 201712 之前的销量数据 => stuff_ycc_sales_lichuan0313_201712
-- 从 ycc_sales_lichuan0307_feature_16_produce_quantity 取出 201801 格式 => stuff_ycc_sales_lichuan0313_201801
-- 从 yc_result_submit_a_gbdt60_xgboost_40_79  取出 201801 销量数据并入上面数据集 => stuff_ycc_sales_lichuan0313_201801
-- NULL 值填 0 => stuff_ycc_sales_lichuan0313_201801
-- log 变换 => stuff_ycc_sales_lichuan0313_201801
-- 从 yc_result_sample_b 取出 201802 格式 => stuff_ycc_sales_lichuan0313_201802
-- 将全部数据集进行和并 => ycc_sales_lichuan0313_traintest_method1
-- 
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_201712;
CREATE TABLE stuff_ycc_sales_lichuan0313_201712
AS
SELECT sale_date, province_id, city_id, class_id, sale_quantity
FROM ycc_sales_lichuan0307_feature_16_produce_quantity
where sale_date != '201801';

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_201801;
CREATE TABLE stuff_ycc_sales_lichuan0313_201801
AS
SELECT sale_date, province_id, city_id, class_id, sale_quantity
FROM ycc_sales_lichuan0307_feature_16_produce_quantity
where sale_date = '201801';

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_201801
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, b.predict_quantity as sale_quantity
FROM stuff_ycc_sales_lichuan0313_201801 a
LEFT OUTER JOIN yc_result_submit_a_gbdt60_xgboost_40_79 b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_201801
SELECT sale_date, province_id, city_id, class_id
    , CASE 
        WHEN sale_quantity IS NULL THEN 0
        ELSE sale_quantity
    END AS sale_quantity
FROM stuff_ycc_sales_lichuan0313_201801;

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_201801
SELECT sale_date, province_id, city_id, class_id
    , log(2, sale_quantity + 1) as sale_quantity
FROM stuff_ycc_sales_lichuan0313_201801;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_201802;
CREATE TABLE stuff_ycc_sales_lichuan0313_201802
AS
SELECT predict_date AS sale_date, province_id, city_id, class_id, predict_quantity AS sale_quantity
FROM yc_result_sample_b;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_traintest_method1;

CREATE TABLE ycc_sales_lichuan0313_traintest_method1
AS
SELECT *
FROM stuff_ycc_sales_lichuan0313_201712
UNION ALL
SELECT *
FROM stuff_ycc_sales_lichuan0313_201801
UNION ALL
SELECT *
FROM stuff_ycc_sales_lichuan0313_201802;