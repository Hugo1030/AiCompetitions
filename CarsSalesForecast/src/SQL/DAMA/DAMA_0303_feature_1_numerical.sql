-- feature_1_numerical
-- CHNAGELOH: 
--      18.3.2 DAMA init.
--      18.3.3 DAMA ++ displacement rated_passenger
-- <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
-- => ycc_sales_dama0303_feature_14_numerical
-- => Size: ??
-- 
-- du4ai / TianChi / issues / #4 - [TASK] 基础类别特征进行 one-hot 及 数值编码 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/4/task-one-hot
-- 对数值类特征进行 numerical 编码, 该类型特征有:
-- power, car_length, car_width, car_height
-- , total_quality, equipment_quality, wheelbase, front_track, rear_track
-- price_level
-- 
-- 简单的说, 要找到合理的统一处理 SQL 形式/函式
-- 

CREATE TABLE 
IF NOT EXISTS ycc_sales_dama0303_feature_14_numerical

AS SELECT class_id
    ,MAX(power) AS power_max
    ,MIN(power) AS power_min
    ,AVG(power) AS power_avg

    ,MAX(car_length) AS car_length_max
    ,MIN(car_length) AS car_length_min
    ,AVG(car_length) AS car_length_avg

    ,MAX(car_width) AS car_width_max
    ,MIN(car_width) AS car_width_min
    ,AVG(car_width) AS car_width_avg

    ,MAX(car_height) AS car_height_max
    ,MIN(car_height) AS car_height_min
    ,AVG(car_height) AS car_height_avg

    ,MAX(total_quality) AS total_quality_max
    ,MIN(total_quality) AS total_quality_min
    ,AVG(total_quality) AS total_quality_avg

    ,MAX(equipment_quality) AS equipment_quality_max
    ,MIN(equipment_quality) AS equipment_quality_min
    ,AVG(equipment_quality) AS equipment_quality_avg

    ,MAX(wheelbase) AS wheelbase_max
    ,MIN(wheelbase) AS wheelbase_min
    ,AVG(wheelbase) AS wheelbase_avg

    ,MAX(front_track) AS front_track_max
    ,MIN(front_track) AS front_track_min
    ,AVG(front_track) AS front_track_avg

    ,MAX(rear_track) AS rear_track_max
    ,MIN(rear_track) AS rear_track_min
    ,AVG(rear_track) AS rear_track_avg

    ,MAX(price_level) AS price_level_max
    ,MIN(price_level) AS price_level_min
    ,AVG(price_level) AS price_level_avg

    ,MAX(displacement) AS displacement_max
    ,MIN(displacement) AS displacement_min
    ,AVG(displacement) AS displacement_avg

    ,MAX(rated_passenger) AS rated_passenger_max
    ,MIN(rated_passenger) AS rated_passenger_min
    ,AVG(rated_passenger) AS rated_passenger_avg

FROM ycc_sales_dama0303_dclean_13_kill_chaos_fields

GROUP BY        class_id
DISTRIBUTE BY   class_id 
SORT BY         class_id
;



