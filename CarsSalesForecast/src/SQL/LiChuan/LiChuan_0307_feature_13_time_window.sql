-- feature_13_time_window
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
--      <= ycc_sales_lichuan0307_feature_12_purchase_tax
--      <= ycc_sales_caijun0306_feature_sum_2m3m6m12m
--      <= ycc_sales_caijun0306_feature_avg_2m3m6m12m
--      <= ycc_sales_caijun0306_feature_std_2m3m6m12m
--      => ycc_sales_lichuan0307_feature_13_time_window 
        

-- du4ai / TianChi / issues / #8 - [TASK] 时间窗口类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task

-- 并入2/3/6/12 的 SUM/AVG/STD, 并入去年环比
-- 
DROP TABLE IF EXISTS stuff1_sales_lichuan0307_feature_13_time_window;

CREATE TABLE stuff1_sales_lichuan0307_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , b.sale_last2M_sum, b.sale_last3M_sum, b.sale_last6M_sum, b.sale_last12M_sum
FROM ycc_sales_lichuan0307_feature_12_purchase_tax a
LEFT OUTER JOIN ycc_sales_caijun0306_feature_sum_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff2_sales_lichuan0307_feature_13_time_window;

CREATE TABLE stuff2_sales_lichuan0307_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , b.sale_last2M_std, b.sale_last3M_std, b.sale_last6M_std, b.sale_last12M_std
FROM stuff1_sales_lichuan0307_feature_13_time_window a
LEFT OUTER JOIN ycc_sales_caijun0306_feature_std_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff3_sales_lichuan0307_feature_13_time_window;

CREATE TABLE stuff3_sales_lichuan0307_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , b.sale_last2M_avg, b.sale_last3M_avg, b.sale_last6M_avg, b.sale_last12M_avg
FROM stuff2_sales_lichuan0307_feature_13_time_window a
LEFT OUTER JOIN ycc_sales_caijun0306_feature_avg_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_13_time_window;

CREATE TABLE ycc_sales_lichuan0307_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , b.lastyear_MoM
FROM stuff3_sales_lichuan0307_feature_13_time_window a
LEFT OUTER JOIN ycc_sales_caijun0306_feature_lastyear_MoM b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;