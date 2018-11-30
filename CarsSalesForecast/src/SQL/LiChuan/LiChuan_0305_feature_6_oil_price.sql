-- feature_6_oil_price
-- CHNAGELOH: 
--      18.3.5 Lichuan init.
--      <= ycc_sales_lichuan0304_feature_5_log_sale 
--      => ycc_sales_lichuan0304_feature_6_oil_price
--      
-- 
-- du4ai / TianChi / issues / #11 - [TAKE] 全国历史油价特征提取 
--    https://bitbucket.org/du4ai/tianchi/issues/12/take
-- 获取时间排序临时 table 
--      <= ycc_sales_lichuan0304_feature_4_data_set
--      => stuff_ycc_sales_lichuan0305_oil 
-- 增加 oil_price 列
--      <= stuff_ycc_sales_lichuan0305_oil
--      => stuff_ycc_sales_lichuan0305_oil
-- 添加 oil_price 数值
--      <= stuff_ycc_sales_lichuan0305_oil
--      <= http://data.eastmoney.com/OilPrice/oil_city.aspx?city=beijing
--      <= http://ny.gold600.com/beijing.html
--      => stuff_ycc_sales_lichuan0305_oil
-- 合并特征集
--      <= ycc_sales_lichuan0304_feature_5_log_sale
--      <= stuff_ycc_sales_lichuan0305_oil
--      => ycc_sales_lichuan0304_feature_6_oil_price 得到油价特征(北京 93#)
--
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0305_oil;

CREATE TABLE stuff_ycc_sales_lichuan0305_oil
AS
SELECT sale_date
FROM ycc_sales_lichuan0304_feature_4_data_set
GROUP BY sale_date;

ALTER TABLE stuff_ycc_sales_lichuan0305_oil
    ADD COLUMNS (oil_price DOUBLE);
    
--
INSERT OVERWRITE TABLE 
    stuff_ycc_sales_lichuan0305_oil 
SELECT 
    sale_date
    , CASE 
        WHEN (sale_date = '201201')
            THEN 7.63
        WHEN (sale_date = '201202')
            THEN 7.85
        WHEN (sale_date = '201203')
            THEN 7.85*0.6 + 8.33*0.4
        WHEN (sale_date = '201204')
            THEN 8.33
        WHEN (sale_date = '201205')
            THEN 8.33*0.3 + 8.07*0.7
        WHEN (sale_date = '201206')
            THEN 8.07*0.3 + 7.64*0.7    
        WHEN (sale_date = '201207')
            THEN 7.64*0.3 + 7.31*0.7
        WHEN (sale_date = '201208')
            THEN 7.31*0.3 + 7.62*0.7
        WHEN (sale_date = '201209')
            THEN 7.62*0.4 + 8.06*0.6
        WHEN (sale_date = '201210')
            THEN 8.06   
        WHEN (sale_date = '201211')
            THEN 8.06*0.5 + 7.81*0.5    
        WHEN (sale_date = '201212')
            THEN 7.81   
        WHEN (sale_date = '201301')
            THEN 7.81
        WHEN (sale_date = '201302')
            THEN 7.81
        WHEN (sale_date = '201303')
            THEN 8.05
        WHEN (sale_date = '201304')
            THEN 7.80
        WHEN (sale_date = '201305')
            THEN 7.56
        WHEN (sale_date = '201306')
            THEN 7.49   
        WHEN (sale_date = '201307')
            THEN 7.50
        WHEN (sale_date = '201308')
            THEN 7.75
        WHEN (sale_date = '201309')
            THEN 7.95*0.5 + 8.03*0.5
        WHEN (sale_date = '201310')
            THEN 7.83   
        WHEN (sale_date = '201311')
            THEN 7.81*0.5 + 7.68*0.5    
        WHEN (sale_date = '201312')
            THEN 7.81*0.5 + 7.86*0.5
        WHEN (sale_date = '201401')
            THEN 7.76
        WHEN (sale_date = '201402')
            THEN 7.65
        WHEN (sale_date = '201403')
            THEN 7.82
        WHEN (sale_date = '201404')
            THEN 7.71
        WHEN (sale_date = '201405')
            THEN 7.79
        WHEN (sale_date = '201406')
            THEN 7.85   
        WHEN (sale_date = '201407')
            THEN 7.98
        WHEN (sale_date = '201408')
            THEN 7.78*0.6 + 7.63*0.4
        WHEN (sale_date = '201409')
            THEN 7.55*0.5 + 7.44*0.5
        WHEN (sale_date = '201410')
            THEN 7.36*0.5 + 7.11*0.5    
        WHEN (sale_date = '201411')
            THEN 6.92*0.5 + 6.76*0.5    
        WHEN (sale_date = '201412')
            THEN 6.76*0.5 + 6.63*0.5
        WHEN (sale_date = '201501')
            THEN 6.21*0.5 + 6.07*0.5
        WHEN (sale_date = '201502')
            THEN 5.77*0.3 + 6.01*0.7
        WHEN (sale_date = '201503')
            THEN 6.32
        WHEN (sale_date = '201504')
            THEN 6.13*0.3 + 6.22*0.7
        WHEN (sale_date = '201505')
            THEN 6.46*0.3 + 6.67*0.7
        WHEN (sale_date = '201506')
            THEN 6.58   
        WHEN (sale_date = '201507')
            THEN 6.50
        WHEN (sale_date = '201508')
            THEN 6.11
        WHEN (sale_date = '201509')
            THEN 5.85*0.5 + 5.92*0.5
        WHEN (sale_date = '201510')
            THEN 5.92*0.6 + 5.96*0.4    
        WHEN (sale_date = '201511')
            THEN 5.86*0.5 + 5.79*0.5    
        WHEN (sale_date = '201512')
            THEN 5.67
        WHEN (sale_date = '201601')
            THEN 5.67*0.5 + 5.56*0.5
        WHEN (sale_date = '201602')
            THEN 5.56
        WHEN (sale_date = '201603')
            THEN 5.56
        WHEN (sale_date = '201604')
            THEN 5.56
        WHEN (sale_date = '201605')
            THEN 5.69*0.5 + 5.79*0.5
        WHEN (sale_date = '201606')
            THEN 5.96   
        WHEN (sale_date = '201607')
            THEN 5.96
        WHEN (sale_date = '201608')
            THEN 5.75*0.6 + 5.89*0.4
        WHEN (sale_date = '201609')
            THEN 6.05*0.6 + 5.93*0.4
        WHEN (sale_date = '201610')
            THEN 5.93*0.6 + 6.21*0.4    
        WHEN (sale_date = '201611')
            THEN 6.21*0.6 + 5.92*0.4    
        WHEN (sale_date = '201612')
            THEN 6.06*0.5 + 6.41*0.5
        WHEN (sale_date = '201701')
            THEN 6.49*0.5 + 6.54*0.5
        WHEN (sale_date = '201702')
            THEN 6.49*0.5 + 6.53*0.5
        WHEN (sale_date = '201703')
            THEN 6.53*0.5 + 6.46*0.5
        WHEN (sale_date = '201704')
            THEN 6.28*0.5 + 6.44*0.5
        WHEN (sale_date = '201705')
            THEN 6.44*0.5 + 6.44*0.5
        WHEN (sale_date = '201706')
            THEN 6.35*0.3 + 6.20*0.7    
        WHEN (sale_date = '201707')
            THEN 6.00*0.6 + 6.06*0.4
        WHEN (sale_date = '201708')
            THEN 6.20
        WHEN (sale_date = '201709')
            THEN 6.20*0.5 + 6.28*0.5
        WHEN (sale_date = '201710')
            THEN 6.45   
        WHEN (sale_date = '201711')
            THEN 6.57*0.5 + 6.78*0.5    
        WHEN (sale_date = '201712')
            THEN 6.78
        WHEN (sale_date = '201801')
            THEN 6.98
        ELSE oil_price
    END AS oil_price
from stuff_ycc_sales_lichuan0305_oil;

drop table if exists ycc_sales_lichuan0305_feature_6_oil_price;
CREATE TABLE ycc_sales_lichuan0305_feature_6_oil_price
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price
FROM ycc_sales_lichuan0304_feature_5_log_sale a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0305_oil b
ON a.sale_date = b.sale_date;