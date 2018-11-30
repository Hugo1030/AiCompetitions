-- method1_all_process
-- CHNAGELOH: 
--      18.3.13 Lichuan init.
--      <= ycc_sales_lichuan0313_oil_price_method1 
--      => ycc_sales_lichuan0313_total_sale_method1
--      => ycc_sales_lichuan0313_feature_8_time_window
--      => ycc_sales_lichuan0313_feature_9_count_classid
--      => ycc_sales_lichuan0313_feature_10_year_month
--      => ycc_sales_lichuan0313_feature_11_how_many_month_sale
--      => ycc_sales_lichuan0313_feature_13_time_window
--      => ycc_sales_lichuan0313_feature_15_spring_festival
--      => ycc_sales_lichuan0313_feature_16_produce_quantity
--      
-- 
-- du4ai / TianChi / issues / #22 - [TASK] B 榜数据处理 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/22/task-b
--    
-- 
--    
INSERT OVERWRITE TABLE ycc_sales_lichuan0313_oil_price_method1
SELECT sale_date, province_id, city_id, class_id
    , CASE 
        WHEN sale_quantity IS NULL THEN 0
        ELSE sale_quantity
    END AS sale_quantity, oil_price
FROM ycc_sales_lichuan0313_oil_price_method1;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale;
CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale
AS
SELECT sale_date, province_id, city_id, SUM(sale_quantity) AS total_sale
FROM ycc_sales_lichuan0313_oil_price_method1
GROUP BY sale_date, 
    province_id, 
    city_id;
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_lsat12M;
CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M
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
FROM stuff_ycc_sales_lichuan0313_total_sale;

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M
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
FROM stuff_ycc_sales_lichuan0313_total_sale_lsat12M;
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_lsat12M_sum;
CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_sum
AS
SELECT sale_date, province_id, city_id, total_sale_last1M
    , total_sale_last1M + total_sale_last2M + total_sale_last3M + total_sale_last4M + total_sale_last5M + total_sale_last6M + total_sale_last7M + total_sale_last8M + total_sale_last9M + total_sale_last10M + total_sale_last11M + total_sale_last12M as total_last12M_sum 
FROM stuff_ycc_sales_lichuan0313_total_sale_lsat12M;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_total_sale_method1;

CREATE TABLE ycc_sales_lichuan0313_total_sale_method1
AS
SELECT a.sale_date, a.province_id, a.city_id, class_id, a.sale_quantity
    , oil_price, b.total_sale_last1M, b.total_last12M_sum
FROM ycc_sales_lichuan0313_oil_price_method1 a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_total_sale_lsat12M_sum b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_8_time_window;

CREATE TABLE ycc_sales_lichuan0313_feature_8_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
FROM ycc_sales_lichuan0313_total_sale_method1 a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_basewindow b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_time_window;

CREATE TABLE stuff_ycc_sales_lichuan0313_time_window
AS
SELECT sale_date, province_id, city_id, class_id
FROM ycc_sales_lichuan0313_feature_8_time_window
WHERE sale_quantity != 0;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_submit;
CREATE TABLE stuff_ycc_sales_lichuan0313_submit
AS
SELECT predict_date AS sale_date, province_id, city_id, class_id
FROM yc_result_sample_b
GROUP BY predict_date, 
    province_id, 
    city_id, 
    class_id;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_time_window2;

CREATE TABLE stuff_ycc_sales_lichuan0313_time_window2
AS
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0313_time_window
UNION ALL
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0313_submit;
    

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_9_count_classid;

CREATE TABLE ycc_sales_lichuan0313_feature_9_count_classid
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , b.cnt_classid
FROM ycc_sales_lichuan0313_feature_8_time_window a
LEFT OUTER JOIN (
    SELECT sale_date, province_id, city_id, COUNT(class_id) AS cnt_classid
    FROM stuff_ycc_sales_lichuan0313_time_window2
    GROUP BY sale_date, 
        province_id, 
        city_id
) b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_9_count_classid
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , CASE 
        WHEN cnt_classid IS NULL 
            THEN 0
        ELSE cnt_classid
    END AS cnt_classid
FROM ycc_sales_lichuan0313_feature_9_count_classid;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_10_year_month;

CREATE TABLE ycc_sales_lichuan0313_feature_10_year_month
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month
FROM ycc_sales_lichuan0313_feature_9_count_classid a
LEFT OUTER JOIN (
    SELECT sale_date, CAST(SUBSTR(sale_date, 1, 4) AS DOUBLE) / 1000 AS year, CAST(SUBSTR(sale_date, 5, 2) AS DOUBLE) AS month
    FROM ycc_sales_lichuan0313_feature_9_count_classid
    GROUP BY sale_date
) b
ON a.sale_date = b.sale_date;
-- 
-- 201802
ALTER TABLE stuff_ycc_sales_lichuan0313_201802 ADD COLUMNS (how_many_month_sale double);

DROP TABLE IF EXISTS stuff_2;

CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , b.how_many_month_sale + 1 AS how_many_month_sale
FROM stuff_ycc_sales_lichuan0313_201802 a
LEFT OUTER JOIN stuff_lichuan0306_feature_11_how_many_month_sale b
ON a.sale_date - 1 = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

CREATE TABLE stuff_201802
AS
SELECT sale_date, city_id, class_id
    , CASE 
        WHEN sale_quantity IS NULL THEN 0
        ELSE sale_quantity
    END AS sale_quantity
    , CASE 
        WHEN how_many_month_sale IS NULL THEN 1
        ELSE how_many_month_sale
    END AS how_many_month_sale
FROM stuff_2;

DROP TABLE IF EXISTS stuff_lichuan0313_feature_11_how_many_month_sale;

CREATE TABLE stuff_lichuan0313_feature_11_how_many_month_sale
AS
SELECT *
FROM stuff_lichuan0306_feature_11_how_many_month_sale
UNION ALL
SELECT *
FROM stuff_201802;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_11_how_many_month_sale;

CREATE TABLE ycc_sales_lichuan0313_feature_11_how_many_month_sale
AS
SELECT a.sale_date, province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, b.how_many_month_sale
FROM ycc_sales_lichuan0313_feature_10_year_month a
LEFT OUTER JOIN stuff_lichuan0313_feature_11_how_many_month_sale b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_purchase_tax;

CREATE TABLE stuff_ycc_sales_lichuan0313_purchase_tax
AS
SELECT sale_date, year
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale
GROUP BY sale_date ,year;

ALTER TABLE stuff_ycc_sales_lichuan0313_purchase_tax ADD COLUMNS (purchase_tax double);

INSERT OVERWRITE TABLE 
    stuff_ycc_sales_lichuan0313_purchase_tax 
SELECT sale_date,year
    , CASE 
        WHEN (year = 2.012)
            THEN 0.1
        WHEN (year = 2.013)
            THEN 0.1
        WHEN (year = 2.014)
            THEN 0.1
        WHEN (sale_date = '201501')
            THEN 0.1
        WHEN (sale_date = '201502')
            THEN 0.1
        WHEN (sale_date = '201503')
            THEN 0.1
        WHEN (sale_date = '201504')
            THEN 0.1
        WHEN (sale_date = '201505')
            THEN 0.1
        WHEN (sale_date = '201506')
            THEN 0.1    
        WHEN (sale_date = '201507')
            THEN 0.1
        WHEN (sale_date = '201508')
            THEN 0.1
        WHEN (sale_date = '201509')
            THEN 0.1
        WHEN (sale_date = '201510')
            THEN 0.1
        WHEN (sale_date = '201511')
            THEN 0.05
        WHEN (sale_date = '201512')
            THEN 0.05
        WHEN (year = 2.016)
            THEN 0.05
        WHEN (year = 2.017)
            THEN 0.075
        WHEN (sale_date = '201801')
            THEN 0.1
        WHEN (sale_date = '201802')
            THEN 0.1
        ELSE purchase_tax
    END AS purchase_tax
from stuff_ycc_sales_lichuan0313_purchase_tax;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_12_purchase_tax;

CREATE TABLE ycc_sales_lichuan0313_feature_12_purchase_tax
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, a.year, month, a.how_many_month_sale, b.purchase_tax
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_purchase_tax b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS stuff1_sales_lichuan0313_feature_13_time_window;

CREATE TABLE stuff1_sales_lichuan0313_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , b.sale_last2M_sum, b.sale_last3M_sum, b.sale_last6M_sum, b.sale_last12M_sum
FROM ycc_sales_lichuan0313_feature_12_purchase_tax a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_sum_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff2_sales_lichuan0313_feature_13_time_window;

CREATE TABLE stuff2_sales_lichuan0313_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , b.sale_last2M_std, b.sale_last3M_std, b.sale_last6M_std, b.sale_last12M_std
FROM stuff1_sales_lichuan0313_feature_13_time_window a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_std_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff3_sales_lichuan0313_feature_13_time_window;

CREATE TABLE stuff3_sales_lichuan0313_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , b.sale_last2M_avg, b.sale_last3M_avg, b.sale_last6M_avg, b.sale_last12M_avg
FROM stuff2_sales_lichuan0313_feature_13_time_window a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_avg_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

    
DROP TABLE IF EXISTS stuff4_sales_lichuan0313_feature_13_time_window;

CREATE TABLE stuff4_sales_lichuan0313_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , b.max2m, b.max3m, b.max6m, b.max12m
FROM stuff3_sales_lichuan0313_feature_13_time_window a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_max_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_13_time_window;

CREATE TABLE ycc_sales_lichuan0313_feature_13_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , max2m, max3m, max6m, max12m
    , b.min2m, b.min3m, b.min6m, b.min12m
FROM stuff4_sales_lichuan0313_feature_13_time_window a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_min_2m3m6m12m b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0311_produce_quantity;
CREATE TABLE stuff_ycc_sales_lichuan0311_produce_quantity
AS
SELECT produce_date, class_id, SUM(produce_quantity) AS produce_quantity
FROM yc_passenger_car_yields
GROUP BY produce_date, 
    class_id, 
    produce_quantity;
    
drop table if exists stuff_ycc_sales_lichuan0311_produce_1802;

create table stuff_ycc_sales_lichuan0311_produce_1802
as
SELECT
    case
        when produce_date = '201801'
            then '201802'
        else
            produce_date
        end as produce_date
        , class_id, produce_quantity *0.6 as produce_quantity
FROM stuff_ycc_sales_lichuan0311_produce_1801
where produce_date = '201801';

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_produce_quantity_all;

CREATE TABLE stuff_ycc_sales_lichuan0313_produce_quantity_all
AS
SELECT *
FROM stuff_ycc_sales_lichuan0311_produce_quantity_all
UNION ALL
SELECT *
FROM stuff_ycc_sales_lichuan0311_produce_1802;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_produce_quantity_last1m;
CREATE TABLE stuff_ycc_sales_lichuan0313_produce_quantity_last1m
AS
SELECT produce_date, class_id, produce_quantity
    , LAG(produce_quantity, 1) OVER (PARTITION BY class_id ORDER BY produce_date) AS produce_quantity_last1m
FROM stuff_ycc_sales_lichuan0313_produce_quantity_all;

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_produce_quantity_last1m
SELECT produce_date, class_id, produce_quantity
    , CASE 
        WHEN produce_quantity_last1m IS NULL THEN 0
        ELSE produce_quantity_last1m
    END AS produce_quantity_last1m
FROM stuff_ycc_sales_lichuan0313_produce_quantity_last1m;

drop talbe if exists ycc_sales_lichuan0313_feature_15_spring_festival;
create table ycc_sales_lichuan0313_feature_15_spring_festival
as
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , lastyear_MoM, spring_festival
FROM stuff_ycc_sales_lichuan0313_produce_quantity_last1m a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0310_spring_festival b
ON a.sale_date = b.sale_date;


DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_16_produce_quantity;

CREATE TABLE ycc_sales_lichuan0313_feature_16_produce_quantity
AS
SELECT a.sale_date, province_id, city_id, a.class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , spring_festival
    , produce_quantity_last1m
FROM ycc_sales_lichuan0313_feature_15_spring_festival a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_produce_quantity_last1m b
ON a.sale_date = b.produce_date
and a.class_id = b.class_id;

INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_16_produce_quantity
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , spring_festival
    , CASE 
        WHEN produce_quantity_last1m IS NULL THEN 0
        ELSE produce_quantity_last1m
    END AS produce_quantity_last1m
FROM ycc_sales_lichuan0313_feature_16_produce_quantity;

INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_16_produce_quantity
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , spring_festival
    , log(2, produce_quantity_last1m + 1) AS produce_quantity_last1m
FROM prj_tc_231640_123409_4l0qvy.ycc_sales_lichuan0313_feature_16_produce_quantity ;