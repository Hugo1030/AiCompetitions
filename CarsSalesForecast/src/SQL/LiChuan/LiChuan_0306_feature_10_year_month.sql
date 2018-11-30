-- feature_10_year_month
-- CHNAGELOH: 
--      18.3.6 Lichuan init.
--      <= ycc_sales_lichuan0306_feature_9_count_classid
--      => ycc_sales_lichuan0306_feature_10_year_month 
-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
-- 提取 year/ month 特征

DROP TABLE IF EXISTS ycc_sales_lichuan0306_feature_10_year_month;

CREATE TABLE ycc_sales_lichuan0306_feature_10_year_month
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , sale_last12M_sum, cnt_classid, year, month
FROM ycc_sales_lichuan0306_feature_9_count_classid a
LEFT OUTER JOIN (
    SELECT sale_date, CAST(SUBSTR(sale_date, 1, 4) AS DOUBLE) / 1000 AS year, CAST(SUBSTR(sale_date, 5, 2) AS DOUBLE) AS month
    FROM ycc_sales_lichuan0306_feature_9_count_classid
    GROUP BY sale_date
) b
ON a.sale_date = b.sale_date;