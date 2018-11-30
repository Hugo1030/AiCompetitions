-- feature_5_log_sale
-- CHNAGELOH: 
--      18.3.5 Lichuan init.
--      <= ycc_sales_lichuan0304_feature_4_data_set 
--      => ycc_sales_lichuan0304_feature_5_log_sale
--      
-- 
-- du4ai / TianChi / issues / #11 - [SUGGEST] 整体训练集结构 
--    https://bitbucket.org/du4ai/tianchi/issues/14/suggest
--
-- 
-- 先将 sale_quantity 转换成 double
-- 对 sale_quantity 做 log 变换
-- 
DROP TABLE IF EXISTS ycc_sales_lichuan0304_feature_5_log_sale;

CREATE TABLE ycc_sales_lichuan0304_feature_5_log_sale
AS
SELECT sale_date, province_id, city_id, class_id, CAST(sale_quantity AS DOUBLE) AS sale_quantity
FROM ycc_sales_lichuan0304_feature_4_data_set;

INSERT OVERWRITE TABLE ycc_sales_lichuan0304_feature_5_log_sale
SELECT sale_date, province_id, city_id, class_id
    , log(2, sale_quantity + 1) as sale_quantity
FROM ycc_sales_lichuan0304_feature_5_log_sale;