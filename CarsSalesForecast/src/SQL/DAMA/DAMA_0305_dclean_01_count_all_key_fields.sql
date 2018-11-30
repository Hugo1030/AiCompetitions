-- dclean_01_count_all_key_fields
-- 从最新官方原始数据集中统计核心字段的数量, 以便检验训练集的嗯哼
-- => yc_passenger_car_sales
-- => _statistics_ycc_sales_class_id
-- => _statistics_ycc_sales_province_id
-- => _statistics_ycc_sales_city_id
-- => _statistics_ycc_sales_sale_date
--      => _statistics_ycc_sales_class_idpcd
-- <= 当前:
--    
--class_id总数,province_id总数,city_id总数,sale_date总数,省市class组合id总数,训练集尺寸_不含1801
--698,31,342,72,195833,14099976
-- 如果不存在就创建
-- => _statistics_ycc_sales_class_id
CREATE TABLE IF NOT EXISTS
    _statistics_ycc_sales_class_id( 
        class_id STRING
        , count BIGINT
        )
;
-- 如果已经有,则清空
TRUNCATE TABLE _statistics_ycc_sales_class_id;
--  根据经验, 逐一装配合适的数据行
INSERT OVERWRITE TABLE 
        _statistics_ycc_sales_class_id 
Select class_id,count(class_id) 
FROM    yc_passenger_car_sales 
GROUP BY
    class_id
;
DESC _statistics_ycc_sales_class_id;
--
--    
-- 如果不存在就创建
-- => _statistics_ycc_sales_province_id
CREATE TABLE IF NOT EXISTS
    _statistics_ycc_sales_province_id( 
        province_id STRING
        , count BIGINT
        )
;
-- 如果已经有,则清空
TRUNCATE TABLE _statistics_ycc_sales_province_id;
--  根据经验, 逐一装配合适的数据行
INSERT OVERWRITE TABLE 
        _statistics_ycc_sales_province_id 
Select province_id,count(province_id) 
FROM    yc_passenger_car_sales 
GROUP BY
    province_id
;

DESC _statistics_ycc_sales_province_id;
--   
--    
-- 如果不存在就创建
-- => _statistics_ycc_sales_city_id
CREATE TABLE IF NOT EXISTS
    _statistics_ycc_sales_city_id( 
        city_id STRING
        , count BIGINT
        )
;
-- 如果已经有,则清空
TRUNCATE TABLE _statistics_ycc_sales_city_id;
--  根据经验, 逐一装配合适的数据行
INSERT OVERWRITE TABLE 
        _statistics_ycc_sales_city_id 
Select city_id,count(city_id) 
FROM    yc_passenger_car_sales 
GROUP BY
    city_id
;
DESC _statistics_ycc_sales_city_id;
--   
--   
-- 如果不存在就创建
-- => _statistics_ycc_sales_sale_date
CREATE TABLE IF NOT EXISTS
    _statistics_ycc_sales_sale_date( 
        sale_date STRING
        , count BIGINT
        )
;
-- 如果已经有,则清空
TRUNCATE TABLE _statistics_ycc_sales_sale_date;
--  根据经验, 逐一装配合适的数据行
INSERT OVERWRITE TABLE 
        _statistics_ycc_sales_sale_date 
Select sale_date,count(sale_date) 
FROM    yc_passenger_car_sales 
GROUP BY
    sale_date
;
DESC _statistics_ycc_sales_sale_date;
--   
--   
-- 如果不存在就创建
--      => _statistics_ycc_sales_class_idpcd
CREATE TABLE IF NOT EXISTS
    _statistics_ycc_sales_class_idpcd( 
        class_idpcd STRING
        , count BIGINT
        )
;
-- 如果已经有,则清空
TRUNCATE TABLE _statistics_ycc_sales_class_idpcd;
--  根据经验, 逐一装配合适的数据行
INSERT OVERWRITE TABLE 
        _statistics_ycc_sales_class_idpcd 
Select CONCAT_WS('_'
        , cast(class_id as string) 
        , cast(province_id as string) 
        , cast(city_id as string) 
        )
    ,count(CONCAT_WS('_'
        , cast(class_id as string) 
        , cast(province_id as string) 
        , cast(city_id as string) 
        )) 
FROM    yc_passenger_car_sales 
GROUP BY class_id,province_id,city_id
;
DESC _statistics_ycc_sales_class_idpcd;




-- 
-- v18.3.5.2142 DAMA
-- 


