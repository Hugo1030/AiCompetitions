/*
* @Author: Hugo1030
* @Date:   2018-03-15
* @Last Modified by:   Hugo1030
* @Last Modified time: 2018-03-15
*/
-- method3_add_process
-- CHNAGELOH: 
--      18.3.13 Lichuan init.
--      <= ycc_sales_woody_0313_base_mix_2018_add 
--      => ycc_sales_lichuan0313_feature_6_oil_price_add
--      => ycc_sales_lichuan0313_feature_7_total_sale_add
--      => ycc_sales_lichuan0313_feature_8_time_window_add
--      => ycc_sales_lichuan0313_feature_9_count_classid_add
--      => ycc_sales_lichuan0313_feature_10_year_month_add
--      => ycc_sales_lichuan0313_feature_11_how_many_month_sale_add
--      => ycc_sales_lichuan0313_feature_12_purchase_tax_add
--      => ycc_sales_lichuan0313_feature_13_time_window_add
--      => ycc_sales_lichuan0314_feature_15_spring_festival_add
--      => ycc_sales_lichuan0314_feature_16_produce_quantity_add
--      
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_oil_add;

CREATE TABLE stuff_ycc_sales_lichuan0313_oil_add
AS
SELECT sale_date
FROM ycc_sales_woody_0313_base_mix_2018_add
GROUP BY sale_date;

ALTER TABLE stuff_ycc_sales_lichuan0313_oil_add
    ADD COLUMNS (oil_price DOUBLE);
    
--
INSERT OVERWRITE TABLE 
    stuff_ycc_sales_lichuan0313_oil_add 
SELECT 
    sale_date
    , CASE 
        WHEN (sale_date = '201202')
            THEN 7.85
        WHEN (sale_date = '201204')
            THEN 8.33
        WHEN (sale_date = '201206')
            THEN 8.07*0.3 + 7.64*0.7    
        WHEN (sale_date = '201208')
            THEN 7.31*0.3 + 7.62*0.7
        WHEN (sale_date = '201210')
            THEN 8.06   
        WHEN (sale_date = '201212')
            THEN 7.81   
        WHEN (sale_date = '201302')
            THEN 7.81
        WHEN (sale_date = '201304')
            THEN 7.80
        WHEN (sale_date = '201306')
            THEN 7.49   
        WHEN (sale_date = '201308')
            THEN 7.75
        WHEN (sale_date = '201310')
            THEN 7.83   
        WHEN (sale_date = '201312')
            THEN 7.81*0.5 + 7.86*0.5
        WHEN (sale_date = '201402')
            THEN 7.65
        WHEN (sale_date = '201404')
            THEN 7.71
        WHEN (sale_date = '201406')
            THEN 7.85   
        WHEN (sale_date = '201408')
            THEN 7.78*0.6 + 7.63*0.4
        WHEN (sale_date = '201410')
            THEN 7.36*0.5 + 7.11*0.5        
        WHEN (sale_date = '201412')
            THEN 6.76*0.5 + 6.63*0.5
        WHEN (sale_date = '201502')
            THEN 5.77*0.3 + 6.01*0.7
        WHEN (sale_date = '201504')
            THEN 6.13*0.3 + 6.22*0.7
        WHEN (sale_date = '201506')
            THEN 6.58   
        WHEN (sale_date = '201508')
            THEN 6.11
        WHEN (sale_date = '201510')
            THEN 5.92*0.6 + 5.96*0.4    
        WHEN (sale_date = '201512')
            THEN 5.67
        WHEN (sale_date = '201602')
            THEN 5.56
        WHEN (sale_date = '201604')
            THEN 5.56
        WHEN (sale_date = '201606')
            THEN 5.96   
        WHEN (sale_date = '201608')
            THEN 5.75*0.6 + 5.89*0.4
        WHEN (sale_date = '201610')
            THEN 5.93*0.6 + 6.21*0.4        
        WHEN (sale_date = '201612')
            THEN 6.06*0.5 + 6.41*0.5
        WHEN (sale_date = '201702')
            THEN 6.49*0.5 + 6.53*0.5
        WHEN (sale_date = '201704')
            THEN 6.28*0.5 + 6.44*0.5
        WHEN (sale_date = '201706')
            THEN 6.35*0.3 + 6.20*0.7    
        WHEN (sale_date = '201708')
            THEN 6.20
        WHEN (sale_date = '201710')
            THEN 6.45   
        WHEN (sale_date = '201712')
            THEN 6.78
        WHEN (sale_date = '201802')
            THEN 6.95
        ELSE oil_price
    END AS oil_price
from stuff_ycc_sales_lichuan0313_oil_add;

drop table if exists ycc_sales_lichuan0305_feature_6_oil_price_add;

CREATE TABLE ycc_sales_lichuan0305_feature_6_oil_price_add
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity_add as sale_quantity
    , oil_price
FROM ycc_sales_woody_0313_base_mix_2018_add a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_oil_add b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_add;

CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_add
AS
SELECT sale_date, province_id, city_id, SUM(sale_quantity) AS total_sale
FROM ycc_sales_lichuan0305_feature_6_oil_price_add
GROUP BY sale_date, 
    province_id, 
    city_id;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add;

CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add
AS
SELECT sale_date, province_id, city_id, total_sale
    , LAG(total_sale, 1) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last1M
    , LAG(total_sale, 2) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last2M
    , LAG(total_sale, 3) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last3M
    , LAG(total_sale, 4) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last4M
    , LAG(total_sale, 5) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last5M
    , LAG(total_sale, 6) OVER (PARTITION BY province_id, city_id ORDER BY sale_date) AS total_sale_last6M
FROM stuff_ycc_sales_lichuan0313_total_sale_add;

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add
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
FROM stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add_sum;

CREATE TABLE stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add_sum
AS
SELECT sale_date, province_id, city_id, total_sale_last1M
    , total_sale_last1M + total_sale_last2M + total_sale_last3M + total_sale_last4M + total_sale_last5M + total_sale_last6M AS total_last12M_sum
FROM stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_7_total_sale_add;

CREATE TABLE ycc_sales_lichuan0313_feature_7_total_sale_add
AS
SELECT a.sale_date, a.province_id, a.city_id, class_id, a.sale_quantity
    , oil_price, b.total_sale_last1M, b.total_last12M_sum
FROM ycc_sales_lichuan0305_feature_6_oil_price_add a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_total_sale_lsat12M_add_sum b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_8_time_window_add;

CREATE TABLE ycc_sales_lichuan0313_feature_8_time_window_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
FROM ycc_sales_lichuan0313_feature_7_total_sale_add a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_basewindow_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_time_window_add;

CREATE TABLE stuff_ycc_sales_lichuan0313_time_window_add
AS
SELECT sale_date, province_id, city_id, class_id
FROM ycc_sales_lichuan0313_feature_8_time_window_add
WHERE sale_quantity != 0;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_time_window_add;
CREATE TABLE stuff_ycc_sales_lichuan0313_time_window_add
AS
SELECT sale_date, province_id, city_id, class_id
FROM ycc_sales_lichuan0313_feature_8_time_window_add
WHERE sale_quantity != 0;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_1802;

CREATE TABLE stuff_ycc_sales_lichuan0313_1802
AS
SELECT sale_date, province_id, city_id, class_id
FROM woody_0313_1801_1802_union
GROUP BY sale_date, 
    province_id, 
    city_id, 
    class_id;
--  
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_class_id;

CREATE TABLE stuff_ycc_sales_lichuan0313_class_id
AS
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0313_time_window_add
UNION ALL
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0313_1802;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_9_count_classid_add;

CREATE TABLE ycc_sales_lichuan0313_feature_9_count_classid_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , b.cnt_classid
FROM ycc_sales_lichuan0313_feature_8_time_window_add a
LEFT OUTER JOIN (
    SELECT sale_date, province_id, city_id, COUNT(class_id) AS cnt_classid
    FROM stuff_ycc_sales_lichuan0313_class_id
    GROUP BY sale_date, 
        province_id, 
        city_id
) b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_9_count_classid_add
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , CASE 
        WHEN cnt_classid IS NULL 
            THEN 0
        ELSE cnt_classid
    END AS cnt_classid
FROM ycc_sales_lichuan0313_feature_9_count_classid_add;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_10_year_month_add;

CREATE TABLE ycc_sales_lichuan0313_feature_10_year_month_add
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month
FROM ycc_sales_lichuan0313_feature_9_count_classid_add a
LEFT OUTER JOIN (
    SELECT sale_date, CAST(SUBSTR(sale_date, 1, 4) AS DOUBLE) / 1000 AS year, CAST(SUBSTR(sale_date, 5, 2) AS DOUBLE) AS month
    FROM ycc_sales_lichuan0313_feature_9_count_classid_add
    GROUP BY sale_date
) b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS stuff_lichuan0313_feature_11_how_many_month_sale_add;

CREATE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
AS
SELECT a.sale_date, a.city_id, a.class_id, sale_quantity, b.how_many_month_sale
FROM ycc_sales_lichuan0313_feature_10_year_month_add a
LEFT OUTER JOIN (
    SELECT sale_date, city_id, class_id
        , CASE 
            when (sale_date = '201202' and  sale_quantity != 0.0)
                then 1.0
            ELSE 0.0
        END AS how_many_month_sale
    FROM ycc_sales_lichuan0313_feature_10_year_month_add
) b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201204'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201202'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201204' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201206'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201204'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201206' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201208'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201206'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201208' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201210'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201208'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201210' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201212'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201210'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201212' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201302'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201212'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201302' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201304'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201302'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201304' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201306'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201304'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201306' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201308'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201306'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201308' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201310'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201308'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201310' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201312'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201310'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201312' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201402'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201312'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201402' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201404'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201402'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201404' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201406'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201404'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201406' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201408'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201406'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201408' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201410'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201408'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201410' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201412'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201410'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201412' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201502'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201412'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201502' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201504'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201502'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201504' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201506'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201504'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201506' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201508'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201506'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201508' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201510'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201508'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201510' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201512'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201510'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201512' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201602'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201512'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201602' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201604'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201602'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201604' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201606'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201604'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201606' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201608'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201606'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201608' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201610'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201608'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201610' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201612'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201610'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201612' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201702'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201612'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201702' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201704'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201702'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201704' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201706'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201704'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201706' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201708'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201706'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201708' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201710'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201708'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201710' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
    WHERE sale_date = '201712'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
    WHERE sale_date = '201710'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0313_feature_11_how_many_month_sale_add
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201712' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
ALTER TABLE woody_0313_1801_1802_union ADD COLUMNS (how_many_month_sale double);

DROP TABLE IF EXISTS stuff_add_201802;
CREATE TABLE stuff_add_201802
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , b.how_many_month_sale + 1 AS how_many_month_sale
FROM woody_0313_1801_1802_union a
LEFT OUTER JOIN stuff_lichuan0313_feature_11_how_many_month_sale_add b
ON a.sale_date - 90 = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
CREATE TABLE stuff_201802_add
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
FROM stuff_add_201802;


DROP TABLE IF EXISTS stuff_lichuan0314_feature_11_how_many_month_sale_add;
CREATE TABLE stuff_lichuan0314_feature_11_how_many_month_sale_add
AS
SELECT *
FROM stuff_lichuan0313_feature_11_how_many_month_sale_add
where sale_date != '201802'
UNION ALL
SELECT *
FROM stuff_add_201802;


INSERT OVERWRITE TABLE stuff_lichuan0314_feature_11_how_many_month_sale_add
SELECT sale_date, city_id, class_id
    , CASE 
        WHEN sale_quantity IS NULL THEN 0
        ELSE sale_quantity
    END AS sale_quantity
    , CASE 
        WHEN how_many_month_sale IS NULL THEN 1
        ELSE how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0314_feature_11_how_many_month_sale_add;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_11_how_many_month_sale_add;

CREATE TABLE ycc_sales_lichuan0313_feature_11_how_many_month_sale_add
AS
SELECT a.sale_date, province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, b.how_many_month_sale
FROM ycc_sales_lichuan0313_feature_10_year_month_add a
LEFT OUTER JOIN stuff_lichuan0314_feature_11_how_many_month_sale_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE ycc_sales_lichuan0313_feature_11_how_many_month_sale_add
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month
    , CASE 
        WHEN how_many_month_sale IS NULL THEN 0
        ELSE how_many_month_sale
    END AS how_many_month_sale
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale_add;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0313_purchase_tax_add;

CREATE TABLE stuff_ycc_sales_lichuan0313_purchase_tax_add
AS
SELECT sale_date, year
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale_add
GROUP BY sale_date ,year;

ALTER TABLE stuff_ycc_sales_lichuan0313_purchase_tax_add ADD COLUMNS (purchase_tax double);

INSERT OVERWRITE TABLE 
    stuff_ycc_sales_lichuan0313_purchase_tax_add 
SELECT sale_date,year
    , CASE 
        WHEN (year = 2.012)
            THEN 0.1
        WHEN (year = 2.013)
            THEN 0.1
        WHEN (year = 2.014)
            THEN 0.1
        WHEN (sale_date = '201502')
            THEN 0.1
        WHEN (sale_date = '201504')
            THEN 0.1
        WHEN (sale_date = '201506')
            THEN 0.1    
        WHEN (sale_date = '201508')
            THEN 0.1
        WHEN (sale_date = '201510')
            THEN 0.1
        WHEN (sale_date = '201512')
            THEN 0.05
        WHEN (year = 2.016)
            THEN 0.05
        WHEN (year = 2.017)
            THEN 0.075
        WHEN (sale_date = '201802')
            THEN 0.1
        ELSE purchase_tax
    END AS purchase_tax
from stuff_ycc_sales_lichuan0313_purchase_tax_add;

DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_12_purchase_tax_add;

CREATE TABLE ycc_sales_lichuan0313_feature_12_purchase_tax_add
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, a.year, month, a.how_many_month_sale, b.purchase_tax
FROM ycc_sales_lichuan0313_feature_11_how_many_month_sale_add a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0313_purchase_tax_add b
ON a.sale_date = b.sale_date;

DROP TABLE IF EXISTS stuff1_sales_lichuan0313_feature_13_time_window_add;

CREATE TABLE stuff1_sales_lichuan0313_feature_13_time_window_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , b.sale_last2M_sum, b.sale_last3M_sum, b.sale_last6M_sum, b.sale_last12M_sum
FROM ycc_sales_lichuan0313_feature_12_purchase_tax_add a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_sum_2m3m6m12m_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff2_sales_lichuan0313_feature_13_time_window_add;

CREATE TABLE stuff2_sales_lichuan0313_feature_13_time_window_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , b.sale_last2M_std, b.sale_last3M_std, b.sale_last6M_std, b.sale_last12M_std
FROM stuff1_sales_lichuan0313_feature_13_time_window_add a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_std_2m3m6m12m_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff3_sales_lichuan0313_feature_13_time_window_add;

CREATE TABLE stuff3_sales_lichuan0313_feature_13_time_window_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , b.sale_last2M_avg, b.sale_last3M_avg, b.sale_last6M_avg, b.sale_last12M_avg
FROM stuff2_sales_lichuan0313_feature_13_time_window_add a
LEFT OUTER JOIN ycc_sales_caijun0313_feature_avg_2m3m6m12m_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

    
DROP TABLE IF EXISTS stuff4_sales_lichuan0313_feature_13_time_window_add;

CREATE TABLE stuff4_sales_lichuan0313_feature_13_time_window_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , b.max2m, b.max3m, b.max6m, b.max12m
FROM stuff3_sales_lichuan0313_feature_13_time_window_add a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_max_2m3m6m12m_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS ycc_sales_lichuan0313_feature_13_time_window_add;

CREATE TABLE ycc_sales_lichuan0313_feature_13_time_window_add
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum
    , sale_last2M_std, sale_last3M_std, sale_last6M_std, sale_last12M_std
    , sale_last2M_avg, sale_last3M_avg, sale_last6M_avg, sale_last12M_avg
    , max2m, max3m, max6m, max12m
    , b.min2m, b.min3m, b.min6m, b.min12m
FROM stuff4_sales_lichuan0313_feature_13_time_window_add a
LEFT OUTER JOIN stuff_ycc_sales_caijun0313_feature_min_2m3m6m12m_add b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0314_spring_festival_add;
CREATE TABLE stuff_ycc_sales_lichuan0314_spring_festival_add
AS
SELECT sale_date
FROM ycc_sales_lichuan0313_feature_13_time_window_add
GROUP BY sale_date;

ALTER TABLE stuff_ycc_sales_lichuan0314_spring_festival_add ADD COLUMNS (spring_festival double);

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0314_spring_festival_add
SELECT sale_date
    , CASE 
        WHEN sale_date = '201202' THEN 1
        WHEN sale_date = '201302' THEN 1
        WHEN sale_date = '201402' THEN 1
        WHEN sale_date = '201502' THEN 1
        WHEN sale_date = '201602' THEN 1
        WHEN sale_date = '201702' THEN 1
        when sale_date = '201802' then 1
        ELSE 0
    END AS spring_festival
FROM stuff_ycc_sales_lichuan0314_spring_festival_add;
-- 
DROP TABLE IF EXISTS ycc_sales_lichuan0314_feature_15_spring_festival_add;

CREATE TABLE ycc_sales_lichuan0314_feature_15_spring_festival_add
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , spring_festival
FROM ycc_sales_lichuan0313_feature_13_time_window_add a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0314_spring_festival_add b
ON a.sale_date = b.sale_date;

CREATE TABLE stuff_ycc_sales_woody_0313_base_produce_mix_2018_add
AS
SELECT produce_date, class_id, CAST(produce_quantity AS DOUBLE) AS produce_quantity
FROM ycc_sales_woody_0313_base_produce_mix_2018_add;


INSERT OVERWRITE TABLE stuff_ycc_sales_woody_0313_base_produce_mix_2018_add
SELECT produce_date, class_id
    , log(2, produce_quantity + 1) AS produce_quantity
FROM stuff_ycc_sales_woody_0313_base_produce_mix_2018_add;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0314_produce_quantity_last1m_add;

CREATE TABLE stuff_ycc_sales_lichuan0314_produce_quantity_last1m_add
AS
SELECT produce_date, class_id, produce_quantity
    , LAG(produce_quantity, 1) OVER (PARTITION BY class_id ORDER BY produce_date) AS produce_quantity_last1m
FROM stuff_ycc_sales_lichuan0314_produce_quantity_add;

DROP TABLE IF EXISTS ycc_sales_lichuan0314_feature_16_produce_quantity_add;

CREATE TABLE ycc_sales_lichuan0314_feature_16_produce_quantity_add
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
FROM ycc_sales_lichuan0314_feature_15_spring_festival_add a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0314_produce_quantity_last1m_add b
ON a.sale_date = b.produce_date
and a.class_id = b.class_id;