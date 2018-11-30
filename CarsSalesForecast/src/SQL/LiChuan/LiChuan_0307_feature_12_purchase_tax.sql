-- feature_12_purchase_tax
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
--      <= ycc_sales_lichuan0307_feature_11_how_many_month_sale 
--      => ycc_sales_lichuan0307_feature_12_purchase_tax 购置税特征
     

-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
   
-- 1.6T 以下购置税减免特征
--      201201-201510 10%
--      201511-201612 5%
--      201701-201712 7.5%
--      201801-...    10%
--      
drop table if exists stuff_ycc_sales_lichuan0307_purchase_tax;

CREATE TABLE stuff_ycc_sales_lichuan0307_purchase_tax
AS
SELECT sale_date, year
FROM ycc_sales_lichuan0307_feature_11_how_many_month_sale
GROUP BY sale_date ,year;
ALTER TABLE stuff_ycc_sales_lichuan0307_purchase_tax ADD COLUMNS (purchase_tax double);

INSERT OVERWRITE TABLE 
    stuff_ycc_sales_lichuan0307_purchase_tax 
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
        ELSE purchase_tax
    END AS purchase_tax
from stuff_ycc_sales_lichuan0307_purchase_tax;

DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_12_purchase_tax;

CREATE TABLE ycc_sales_lichuan0307_feature_12_purchase_tax
AS
SELECT a.sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , sale_last12M_sum, cnt_classid, a.year, month, a.how_many_month_sale, b.purchase_tax
FROM ycc_sales_lichuan0307_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0307_purchase_tax b
ON a.sale_date = b.sale_date;