-- feature_15_spring_festival
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
--      <= ycc_sales_lichuan0307_feature_14_max_min 
--      => ycc_sales_lichuan0307_feature_15_spring_festival 是否为春节
-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
-- 201201 201302 201402 201502 201602 201701 201702 201802 春节进行编码
-- 
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0310_spring_festival;
CREATE TABLE stuff_ycc_sales_lichuan0310_spring_festival
AS
SELECT sale_date
FROM ycc_sales_lichuan0307_feature_14_max_min
GROUP BY sale_date;
ALTER TABLE stuff_ycc_sales_lichuan0310_spring_festival ADD COLUMNS (spring_festival double);
INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0310_spring_festival
SELECT sale_date
    , CASE 
        WHEN sale_date = '201201' THEN 1
        WHEN sale_date = '201302' THEN 1
        WHEN sale_date = '201402' THEN 1
        WHEN sale_date = '201502' THEN 1
        WHEN sale_date = '201602' THEN 1
        WHEN sale_date = '201701' THEN 1
        WHEN sale_date = '201702' THEN 1
        ELSE 0
    END AS spring_festival
FROM stuff_ycc_sales_lichuan0310_spring_festival;
-- 
DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_15_spring_festival;

CREATE TABLE ycc_sales_lichuan0307_feature_15_spring_festival
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , lastyear_MoM, spring_festival
FROM ycc_sales_lichuan0307_feature_14_max_min a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0310_spring_festival b
ON a.sale_date = b.sale_date;