-- feature_4_data_set
-- CHNAGELOH: 
--      18.3.4 Lichuan init.
--      <= _stuff_ycc_sales_lichuan0303_train 
--      => ycc_sales_lichuan0304_feature_4_data_set
--      
-- 
-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
--
-- 
--  
-- 先锚定 province_id, city_id, class_id, => stuff_ycc_sales_lichuan0304_pcc
-- 再锚定 sale_date, province_id, city_id => stuff_ycc_sales_lichuan0304_sale_date
-- 再合并 sale_date, province_id, city_id, class_id => stuff_ycc_sales_lichuan0304_dpcc
-- 再填充 slae_quantity => ycc_sales_lichuan0304_feature_4_data_set
-- 将 sale_quantity is null 填 0 => ycc_sales_lichuan0304_feature_4_data_set
-- 
-- 
CREATE TABLE stuff_ycc_sales_lichuan0305_spc
AS
SELECT a.sale_date, b.province_id, b.city_id
FROM (
    SELECT sale_date, province_id
    FROM ycc_sales_lichuan0304_feature_3_train_test
    GROUP BY sale_date, 
        province_id
) a
LEFT OUTER JOIN (
    SELECT province_id, city_id
    FROM ycc_sales_lichuan0304_feature_3_train_test
    GROUP BY province_id, 
        city_id
) b
ON a.province_id = b.province_id;

CREATE TABLE stuff_ycc_sales_lichuan0305_spcc
AS
SELECT sale_date, province_id, b.city_id, class_id
FROM stuff_ycc_sales_lichuan0305_spc b
LEFT OUTER JOIN (
    SELECT city_id, class_id
    FROM ycc_sales_lichuan0304_feature_3_train_test
    GROUP BY city_id, 
        class_id
) c
ON b.city_id = c.city_id;

DROP TABLE IF EXISTS ycc_sales_lichuan0304_feature_4_data_set;

CREATE TABLE ycc_sales_lichuan0304_feature_4_data_set
AS
SELECT stuff_ycc_sales_lichuan0305_spcc.sale_date, stuff_ycc_sales_lichuan0305_spcc.province_id, stuff_ycc_sales_lichuan0305_spcc.city_id, stuff_ycc_sales_lichuan0305_spcc.class_id, ycc_sales_lichuan0304_feature_3_train_test.sale_quantity
FROM stuff_ycc_sales_lichuan0305_spcc
LEFT OUTER JOIN ycc_sales_lichuan0304_feature_3_train_test
ON stuff_ycc_sales_lichuan0305_spcc.sale_date = ycc_sales_lichuan0304_feature_3_train_test.sale_date
    AND stuff_ycc_sales_lichuan0305_spcc.province_id = ycc_sales_lichuan0304_feature_3_train_test.province_id
    AND stuff_ycc_sales_lichuan0305_spcc.city_id = ycc_sales_lichuan0304_feature_3_train_test.city_id
    AND stuff_ycc_sales_lichuan0305_spcc.class_id = ycc_sales_lichuan0304_feature_3_train_test.class_id;

INSERT OVERWRITE TABLE ycc_sales_lichuan0304_feature_4_data_set
SELECT sale_date, province_id, city_id, class_id
    , CASE 
        WHEN sale_quantity IS NULL THEN 0
        ELSE sale_quantity
    END AS sale_quantity
FROM ycc_sales_lichuan0304_feature_4_data_set;

INSERT OVERWRITE TABLE ycc_sales_lichuan0304_feature_4_data_set
SELECT sale_date, province_id, city_id, class_id
    , SUM(sale_quantity) AS sale_quantity
FROM ycc_sales_lichuan0304_feature_4_data_set
GROUP BY sale_date, 
    province_id, 
    city_id, 
    class_id;