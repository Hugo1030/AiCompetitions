/*
* @Author: Hugo1030
* @Date:   2018-03-15
* @Last Modified by:   Hugo1030
* @Last Modified time: 2018-03-15
*/
-- method3_minus_process
-- CHNAGELOH: 
--      18.3.13 Lichuan init.
--      <= ycc_sales_woody_0313_base_mix_2018_minus 
--      => ycc_sales_lichuan0313_feature_6_oil_price_minus 
--      => ycc_sales_lichuan0313_feature_7_total_sale_minus 
--      => ycc_sales_lichuan0313_feature_8_time_window_minus 
--      => ycc_sales_lichuan0313_feature_9_count_classid_minus 
--      => ycc_sales_lichuan0313_feature_10_year_month_add
--      => ycc_sales_lichuan0313_feature_11_how_many_month_sale_minus 
--      => ycc_sales_lichuan0313_feature_12_purchase_tax_minus 
--      => ycc_sales_lichuan0313_feature_13_time_window_minus 
--      => ycc_sales_lichuan0314_feature_15_spring_festival_minus 
--      => ycc_sales_lichuan0314_feature_16_produce_quantity_minus 
--      
drop table if exists ycc_sales_lichuan0305_feature_6_oil_price_minus;

CREATE TABLE ycc_sales_lichuan0305_feature_6_oil_price_minus
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity_add as sale_quantity
    , oil_price
FROM ycc_sales_woody_0313_base_mix_2018_minus a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_oil_add b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_minus;

CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_minus
AS
SELECT sale_date, province_id, city_id, SUM(sale_quantity) AS total_sale
FROM ycc_sales_lichuan0305_feature_6_oil_price_minus
GROUP BY sale_date, 
    province_id, 
    city_id;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_lsat12M_minus;

CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_minus
AS
SELECT sale_date, province_id, city_id, total_sale
    , LAG(total_sale, 1) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last1M
    , LAG(total_sale, 2) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last2M
    , LAG(total_sale, 3) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last3M
    , LAG(total_sale, 4) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last4M
    , LAG(total_sale, 5) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last5M
    , LAG(total_sale, 6) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last6M
FROM stuff_ycc_sales_lichuan0313_total_sale_minus;

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_minus
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
FROM stuff_ycc_sales_lichuan0313_total_sale_lsat12M_minus;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add_minus;

CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add_minus
AS
SELECT sale_date, province_id, city_id, total_sale_last1M
    , total_sale_last1M + total_sale_last2M + total_sale_last3M + total_sale_last4M + total_sale_last5M + total_sale_last6M AS total_last12M_sum
FROM stuff_ycc_sales_lichuan0313_total_sale_lsat12M_minus;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_7_total_sale_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_7_total_sale_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, class_id, a.sale_quantity
    , oil_price, b.total_sale_last1M, b.total_last12M_sum
FROM ycc_sales_lichuan0305_feature_6_oil_price_minus a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_8_time_window_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_8_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
FROM ycc_sales_lichuan0313_feature_7_total_sale_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_basewindow_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_9_count_classid_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_9_count_classid_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , b.cnt_classid
FROM ycc_sales_lichuan0313_feature_8_time_window_minus a
LEFT OUTER JOIN (
    SELECT sale_date, province_id, city_id, COUNT(class_id) AS cnt_classid
    FROM stuff_ycc_sales_lichuan0313_class_id
    GROUP BY sale_date, 
        province_id, 
        city_id
) b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_9_count_classid_minus
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , CASE 
        WHEN cnt_classid IS NULL 
            THEN 0
        ELSE cnt_classid
    END AS cnt_classid
FROM ycc_sales_lichuan0313_feature_9_count_classid_minus;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_10_year_month_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_10_year_month_minus
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month
FROM ycc_sales_lichuan0313_feature_9_count_classid_minus a
LEFT OUTER JOIN (
    SELECT sale_date, CAST(SUBSTR(sale_date, 1, 4) AS DOUBLE) / 1000 AS year, CAST(SUBSTR(sale_date, 5, 2) AS DOUBLE) AS month
    FROM ycc_sales_lichuan0313_feature_9_count_classid_minus
    GROUP BY sale_date
) b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_11_how_many_month_sale_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_11_how_many_month_sale_minus
AS
SELECT a.sale_date, province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, b.how_many_month_sale
FROM ycc_sales_lichuan0313_feature_10_year_month_minus a
LEFT OUTER JOIN stuff_lichuan0314_feature_11_how_many_month_sale_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_11_how_many_month_sale_minus
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month
    , CASE 
        WHEN how_many_month_sale IS NULL THEN 0
        ELSE how_many_month_sale
    END AS how_many_month_sale
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale_minus;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_12_purchase_tax_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_12_purchase_tax_minus
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, a.year, month, a.how_many_month_sale, b.purchase_tax
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale_minus a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_purchase_tax_add b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS stuff1_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff1_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , b.sale_last2M_sum, b.sale_last3M_sum, b.sale_last6M_sum, b.sale_last12M_sum
FROM ycc_sales_lichuan0313_feature_12_purchase_tax_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_sum_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff2_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff2_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , b.sale_last2M_std, b.sale_last3M_std, b.sale_last6M_std, b.sale_last12M_std
FROM stuff1_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_std_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff3_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff3_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , b.sale_last2M_avg, b.sale_last3M_avg, b.sale_last6M_avg, b.sale_last12M_avg
FROM stuff2_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_avg_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

    
DROP TABLE IF EXISTS stuff4_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff4_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , b.max2m, b.max3m, b.max6m, b.max12m
FROM stuff3_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_max_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , max2m, max3m, max6m, max12m
    , b.min2m, b.min3m, b.min6m, b.min12m
FROM stuff4_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_min_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff1_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff1_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , b.sale_last2M_sum, b.sale_last3M_sum, b.sale_last6M_sum, b.sale_last12M_sum
FROM ycc_sales_lichuan0313_feature_12_purchase_tax_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_sum_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff2_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff2_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , b.sale_last2M_std, b.sale_last3M_std, b.sale_last6M_std, b.sale_last12M_std
FROM stuff1_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_std_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff3_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff3_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , b.sale_last2M_avg, b.sale_last3M_avg, b.sale_last6M_avg, b.sale_last12M_avg
FROM stuff2_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_avg_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

    
DROP TABLE IF EXISTS stuff4_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE stuff4_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , b.max2m, b.max3m, b.max6m, b.max12m
FROM stuff3_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_max_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_13_time_window_minus;

CREATE TABLE ycc_sales_lichuan0313_feature_13_time_window_minus
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , max2m, max3m, max6m, max12m
    , b.min2m, b.min3m, b.min6m, b.min12m
FROM stuff4_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_min_2m3m6m12m_minus b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0314_feature_15_spring_festival_minus;

CREATE TABLE ycc_sales_lichuan0314_feature_15_spring_festival_minus
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , spring_festival
FROM ycc_sales_lichuan0313_feature_13_time_window_minus a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0314_spring_festival_add b
ON a.sale_date = b.sale_date;

CREATE TABLE stuff_ycc_sales_woody_0313_base_produce_mix_2018_minus
AS
SELECT produce_date, class_id, CAST(produce_quantity AS DOUBLE) AS produce_quantity
FROM ycc_sales_woody_0313_base_produce_mix_2018_minus;


INSERT OVERWRITE TABLE stuff_ycc_sales_woody_0313_base_produce_mix_2018_minus
SELECT produce_date, class_id
    , log(2, produce_quantity + 1) AS produce_quantity
FROM stuff_ycc_sales_woody_0313_base_produce_mix_2018_minus;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0314_produce_quantity_last1m_minus;

CREATE TABLE stuff_ycc_sales_lichuan0314_produce_quantity_last1m_minus
AS
SELECT produce_date, class_id, produce_quantity
    , LAG(produce_quantity, 1) OVER (PARTITION BY class_id ORDER BY produce_date) AS produce_quantity_last1m
FROM stuff_ycc_sales_woody_0313_base_produce_mix_2018_minus;

DROP TABLE IF EXISTS ycc_sales_lichuan0314_feature_16_produce_quantity_minus;

CREATE TABLE ycc_sales_lichuan0314_feature_16_produce_quantity_minus
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
FROM ycc_sales_lichuan0314_feature_15_spring_festival_minus a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0314_produce_quantity_last1m_minus b
ON a.sale_date = b.produce_date
and a.class_id = b.class_id;