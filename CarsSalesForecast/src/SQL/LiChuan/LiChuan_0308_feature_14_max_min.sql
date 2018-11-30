-- feature_14_max_min
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
--      <= ycc_sales_lichuan0307_feature_13_time_window
--      <= ycc_sales_caijun0306_feature_max_2m3m6m12m
--      <= ycc_sales_caijun0306_feature_min_2m3m6m12m
--      => ycc_sales_lichuan0307_feature_14_max_min
        

-- du4ai / TianChi / issues / #8 - [TASK] 时间窗口类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task

-- 并入2/3/6/12 的 MAX/MIN
DROP TABLE IF EXISTS stuff_lichuan0307_feature_14_time_window;

CREATE TABLE stuff_lichuan0307_feature_14_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , b.max2m, b.max3m, b.max6m, b.max12m
    , lastyear_MoM
FROM ycc_sales_lichuan0307_feature_13_time_window a
LEFT OUTER JOIN stuff_ycc_sales_caijun0307_feature_max_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_14_max_min;

CREATE TABLE ycc_sales_lichuan0307_feature_14_max_min
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , max2m, max3m, max6m, max12m
    , b.min2m, b.min3m, b.min6m, b.min12m
    , lastyear_MoM
FROM stuff_lichuan0307_feature_14_time_window a
LEFT OUTER JOIN stuff_ycc_sales_caijun0307_feature_min_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;