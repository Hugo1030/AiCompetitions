-- feature_16_produce_quantity
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
--      <= ycc_sales_lichuan0307_feature_15_spring_festival 
--      => ycc_sales_lichuan0307_feature_16_produce_quantity 分车型上月产量特征
-- du4ai / TianChi / issues / #10 - [TASK] 产量数据特征提取 
--    https://bitbucket.org/du4ai/tianchi/issues/10/task

-- 产量表去重 => stuff_ycc_sales_lichuan0311_produce_quantity
-- 按比例, 添加 18.01 产量, 17.12产量 * 0.9 => stuff_ycc_sales_lichuan0311_produce_1801
-- 合并整体产量表 => stuff_ycc_sales_lichuan0311_produce_quantity_all
-- 得到上月产量数据 => stuff_ycc_sales_lichuan0311_produce_quantity_last1m
-- 并入数据集 => ycc_sales_lichuan0307_feature_16_produce_quantity
-- NULL 值填 0 => ycc_sales_lichuan0307_feature_16_produce_quantity
-- log 变换 => ycc_sales_lichuan0307_feature_16_produce_quantity

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0311_produce_quantity;
CREATE TABLE stuff_ycc_sales_lichuan0311_produce_quantity
AS
SELECT produce_date, class_id, SUM(produce_quantity) AS produce_quantity
FROM yc_passenger_car_yields
GROUP BY produce_date, 
    class_id, 
    produce_quantity;
    
drop table if exists stuff_ycc_sales_lichuan0311_produce_1801;

create table stuff_ycc_sales_lichuan0311_produce_1801
as
SELECT
    case
        when produce_date = '201712'
            then '201801'
        else
            produce_date
        end as produce_date
        , class_id, produce_quantity *0.9 as produce_quantity
FROM stuff_ycc_sales_lichuan0311_produce_quantity
where produce_date = '201712';

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0311_produce_quantity_all;

CREATE TABLE stuff_ycc_sales_lichuan0311_produce_quantity_all
AS
SELECT *
FROM stuff_ycc_sales_lichuan0311_produce_quantity
UNION ALL
SELECT *
FROM stuff_ycc_sales_lichuan0311_produce_1801;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0311_produce_quantity_last1m;
CREATE TABLE stuff_ycc_sales_lichuan0311_produce_quantity_last1m
AS
SELECT produce_date, class_id, produce_quantity
    , LAG(produce_quantity, 1) OVER (PARTITION BY class_id ORDER BY produce_date) AS produce_quantity_last1m
FROM stuff_ycc_sales_lichuan0311_produce_quantity_all;

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0311_produce_quantity_last1m
SELECT produce_date, class_id, produce_quantity
    , CASE 
        WHEN produce_quantity_last1m IS NULL THEN 0
        ELSE produce_quantity_last1m
    END AS produce_quantity_last1m
FROM stuff_ycc_sales_lichuan0311_produce_quantity_last1m;

DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_16_produce_quantity;

CREATE TABLE ycc_sales_lichuan0307_feature_16_produce_quantity
AS
SELECT a.sale_date, province_id, city_id, a.class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , lastyear_MoM, spring_festival
    , produce_quantity_last1m
FROM ycc_sales_lichuan0307_feature_15_spring_festival a
LEFT OUTER JOIN stuff_ycc_sales_lichuan0311_produce_quantity_last1m b
ON a.sale_date = b.produce_date
and a.class_id = b.class_id;

INSERT OVERWRITE TABLE ycc_sales_lichuan0307_feature_16_produce_quantity
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , lastyear_MoM, spring_festival
    , CASE 
        WHEN produce_quantity_last1m IS NULL THEN 0
        ELSE produce_quantity_last1m
    END AS produce_quantity_last1m
FROM ycc_sales_lichuan0307_feature_16_produce_quantity;

INSERT OVERWRITE TABLE ycc_sales_lichuan0307_feature_16_produce_quantity
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , cnt_classid, year, month, how_many_month_sale, purchase_tax
    , sale_last2M_sum, sale_last3M_sum, sale_last6M_sum, sale_last12M_sum, sale_last2M_std
    , sale_last3M_std, sale_last6M_std, sale_last12M_std, sale_last2M_avg, sale_last3M_avg
    , sale_last6M_avg, sale_last12M_avg, max2m, max3m, max6m
    , max12m, min2m, min3m, min6m, min12m
    , lastyear_MoM, spring_festival
    , log(2, produce_quantity_last1m + 1) AS produce_quantity_last1m
FROM ycc_sales_lichuan0307_feature_16_produce_quantity;
-- 