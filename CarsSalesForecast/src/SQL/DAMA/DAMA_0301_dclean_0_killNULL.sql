-- dclean_0_null_kill
-- 对 NULL 值进行分别合理的充值处理
-- => ycc_sales_dama0302_dclean_0_killnull
-- => Size: 336017568
-- TASK:
-- du4ai / TianChi / issues / #2 - yc_passenger_car_sales 缺值填充 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/2/yc_passenger_car_sales
-- 18.3.2 追加 displacement 的预备处置
-- 首先获得专用数据表

CREATE TABLE 
IF NOT EXISTS ycc_sales_dama0302_dclean_0_killnull 
AS SELECT * FROM yc_passenger_car_sales;

-- 检验目标字段数量:
-- select count(*)  from yc_passenger_car_sales_1_dclean_kill_null 
-- where (emission_standards_id is NULL) 
-- ;

-- 逐一针对补值:

INSERT OVERWRITE TABLE ycc_sales_dama0302_dclean_0_killnull 
SELECT sale_date,province_id,city_id,class_id,sale_quantity
    ,brand_id,compartment,type_id

    ,CASE 
        WHEN level_id is NULL 
            THEN 3
        ELSE level_id
    END AS level_id

    ,CASE 
        WHEN department_id is NULL 
            THEN 1
        ELSE department_id
    END AS department_id

    ,tr,gearbox_type

    ,CASE 
        WHEN displacement is NULL 
            THEN 1.5
        WHEN (displacement LIKE "%L")
            THEN cast(split_part(displacement, 'L', 1) as double)
        WHEN (displacement LIKE "%T")
            THEN cast(split_part(displacement, 'T', 1) as double)*1.33
        ELSE cast(displacement as double)
    END AS displacement

    ,CASE 
        WHEN if_charging is NULL 
            THEN "L"
        ELSE if_charging
    END AS if_charging

    ,CASE 
        WHEN price_level is NULL 
            THEN "35-50"
        ELSE price_level
    END AS price_level

    ,driven_type_id

    ,CASE 
        WHEN fuel_type_id is NULL 
            THEN 1
        ELSE fuel_type_id
    END AS fuel_type_id

    ,CASE 
        WHEN newenergy_type_id is NULL 
            THEN 4
        ELSE newenergy_type_id
    END AS newenergy_type_id

    ,CASE 
        WHEN emission_standards_id is NULL 
            THEN 2
        ELSE emission_standards_id
    END AS emission_standards_id

    ,if_mpv_id,if_luxurious_id

    ,CASE 
        WHEN power is NULL 
            THEN 109
        WHEN (power LIKE "%/%")
            THEN (cast(split_part(power, '/', 1) as double)
                  + cast(split_part(power, '/', 2) as double)
                )/2
        ELSE cast(power as double)
    END AS power

    ,cylinder_number

    ,CASE 
        WHEN car_length is NULL 
            THEN 4514
        ELSE car_length
    END AS car_length

    ,CASE 
        WHEN car_width is NULL 
            THEN 1780
        ELSE car_width
    END AS car_width

    ,CASE 
        WHEN car_height is NULL 
            THEN 1583
        ELSE car_height
    END AS car_height

    ,CASE 
        WHEN total_quality is NULL 
            THEN 1855
        ELSE total_quality
    END AS total_quality

    ,CASE 
        WHEN equipment_quality is NULL 
            THEN 1392
        ELSE equipment_quality
    END AS equipment_quality

    ,CASE 
        WHEN rated_passenger is NULL 
            THEN "5"
        ELSE rated_passenger
    END AS rated_passenger

    ,CASE 
        WHEN wheelbase is NULL 
            THEN 2675
        ELSE wheelbase
    END AS wheelbase


    ,CASE 
        WHEN front_track is NULL 
            THEN 1524
        ELSE front_track
    END AS front_track

    ,CASE 
        WHEN rear_track is NULL 
            THEN 1522
        ELSE rear_track
    END AS rear_track

FROM yc_passenger_car_sales
;



        
        

        
        
