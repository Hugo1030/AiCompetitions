-- feature_7_data_total_sale
-- CHNAGELOH: 
--      18.3.5 Lichuan init.
--      <= ycc_sales_lichuan0305_feature_6_oil_price 
--      => ycc_sales_lichuan0305_feature_7_total_sale
--      
-- 
-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
--
-- 获取月份/城市 整体销量 => stuff_ycc_sales_lichuan0305_total_sale
-- 获取 1/2/3/4/5/6/7/8/9/10/11/12 个月前整体销量 => stuff_ycc_sales_lichuan0305_total_sale_lsat12M
-- NULL 值填 0 => stuff_ycc_sales_lichuan0305_total_sale_lsat12M
-- 获取 12 个月整体销量和 => stuff_ycc_sales_lichuan0305_total_sale_lsat12M_sum
-- 并入开发数据集 => ycc_sales_lichuan0305_feature_7_total_sale
--
--
--
--
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0305_total_sale;
CREATE TABLE stuff_ycc_sales_lichuan0305_total_sale
AS
SELECT sale_date, province_id, city_id, SUM(sale_quantity) AS total_sale
FROM ycc_sales_lichuan0305_feature_6_oil_price
GROUP BY sale_date, 
    province_id, 
    city_id;
    
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0305_total_sale_lsat12M;
CREATE TABLE stuff_ycc_sales_lichuan0305_total_sale_lsat12M
AS
SELECT sale_date, province_id, city_id, total_sale
    , LAG(total_sale, 1) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last1M
    , LAG(total_sale, 2) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last2M
    , LAG(total_sale, 3) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last3M
    , LAG(total_sale, 4) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last4M
    , LAG(total_sale, 5) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last5M
    , LAG(total_sale, 6) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last6M
    , LAG(total_sale, 7) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last7M
    , LAG(total_sale, 8) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last8M
    , LAG(total_sale, 9) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last9M
    , LAG(total_sale, 10) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last10M
    , LAG(total_sale, 11) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last11M
    , LAG(total_sale, 12) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last12M
FROM stuff_ycc_sales_lichuan0305_total_sale;

-- 将NULL填充为0
INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0305_total_sale_lsat12M
SELECT sale_date, province_id, city_id, total_sale
    , CASE 
        WHEN total_sale_last1M IS NULL THEN 0
        ELSE total_sale_last1M
    END AS total_sale_last1M
    , CASE 
        WHEN total_sale_last2M IS NULL THEN 0
        ELSE total_sale_last2M
    END AS total_sale_last2M
    , CASE 
        WHEN total_sale_last3M IS NULL THEN 0
        ELSE total_sale_last3M
    END AS total_sale_last3M
    , CASE 
        WHEN total_sale_last4M IS NULL THEN 0
        ELSE total_sale_last4M
    END AS total_sale_last4M
    , CASE 
        WHEN total_sale_last5M IS NULL THEN 0
        ELSE total_sale_last5M
    END AS total_sale_last5M
    , CASE 
        WHEN total_sale_last6M IS NULL THEN 0
        ELSE total_sale_last6M
    END AS total_sale_last6M
    , CASE 
        WHEN total_sale_last7M IS NULL THEN 0
        ELSE total_sale_last7M
    END AS total_sale_last7M
    , CASE 
        WHEN total_sale_last8M IS NULL THEN 0
        ELSE total_sale_last8M
    END AS total_sale_last8M
    , CASE 
        WHEN total_sale_last9M IS NULL THEN 0
        ELSE total_sale_last9M
    END AS total_sale_last9M
    , CASE 
        WHEN total_sale_last10M IS NULL THEN 0
        ELSE total_sale_last10M
    END AS total_sale_last10M
    , CASE 
        WHEN total_sale_last11M IS NULL THEN 0
        ELSE total_sale_last11M
    END AS total_sale_last11M
    , CASE 
        WHEN total_sale_last12M IS NULL THEN 0
        ELSE total_sale_last12M
    END AS total_sale_last12M
FROM stuff_ycc_sales_lichuan0305_total_sale_lsat12M;


DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0305_total_sale_lsat12M_sum;
CREATE TABLE stuff_ycc_sales_lichuan0305_total_sale_lsat12M_sum
AS
SELECT sale_date, province_id, city_id, total_sale_last1M
    , total_sale_last1M + total_sale_last2M + total_sale_last3M + total_sale_last4M + total_sale_last5M + total_sale_last6M + total_sale_last7M + total_sale_last8M + total_sale_last9M + total_sale_last10M + total_sale_last11M + total_sale_last12M as total_last12M_sum 
FROM stuff_ycc_sales_lichuan0305_total_sale_lsat12M;

DROP TABLE IF EXISTS ycc_sales_lichuan0305_feature_7_total_sale;

CREATE TABLE ycc_sales_lichuan0305_feature_7_total_sale
AS
SELECT a.sale_date, a.province_id, a.city_id, class_id, a.sale_quantity, oil_price
    , b.total_sale_last1M, b.total_last12M_sum
FROM ycc_sales_lichuan0305_feature_6_oil_price a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0305_total_sale_lsat12M_sum b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;  