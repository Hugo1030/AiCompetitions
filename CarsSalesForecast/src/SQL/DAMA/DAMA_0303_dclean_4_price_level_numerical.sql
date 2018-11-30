-- dclean_4_price_level_numerical
-- <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
-- => ycc_sales_dama0303_dclean_13_kill_chaos_fields
-- => Size: ?
-- 
-- 已知乱码数据形式: 10��15�� 已识别为重复行, 并清除
-- 对原有字符形式进行数值化处理:
--      %-%   <- 平均值
--      %以下 <- 80%值
--      %以上 <- 120%值
-- 

INSERT OVERWRITE TABLE 
    ycc_sales_dama0303_dclean_13_kill_chaos_fields 
SELECT 
    sale_date, province_id, city_id, class_id, sale_quantity
    ,brand_id, car_height, car_length, car_width, compartment
    , cylinder_number, department_id, displacement, driven_type_id
    , emission_standards_id, equipment_quality, front_track
    , fuel_type_id, gearbox_type, if_charging, if_luxurious_id
    , if_mpv_id, level_id, newenergy_type_id, power

    , CASE 
        WHEN (price_level LIKE "%-%")
            THEN (
                    cast(split_part(price_level, '-', 1) as double)
                  + cast(split_part(price_level, '-', 2) as double)
                )/2

        WHEN (price_level LIKE "%以下")
            THEN cast(split_part(price_level, '以下', 1) as double)*0.8

        WHEN (price_level LIKE "%以上")
            THEN cast(split_part(price_level, '以上', 1) as double)*1.2

        ELSE cast(price_level as double)
    END AS price_level



    , rated_passenger, rear_track, total_quality
    , tr, type_id, wheelbase

FROM ycc_sales_dama0303_dclean_13_kill_chaos_fields
;


