-- feature_1_num_normal
-- CHNAGELOH: 
--      18.3.6 Lichuan init.
--      <= ycc_sales_dama0303_feature_14_numerical
--      <= ycc_sales_lichuan0306_feature_15_numerical
      
        

-- du4ai / TianChi / issues / #4 - [TASK] 基础类别特征进行 one-hot 及 数值编码 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/4/task-one-hot

-- 数值特征进行归一化处理
-- 
DROP TABLE IF EXISTS ycc_sales_lichuan0306_feature_15_numerical;

CREATE TABLE ycc_sales_lichuan0306_feature_15_numerical
AS
SELECT class_id, power_max / 100 AS power_max, power_min / 100 AS power_min
    , power_avg / 100 AS power_avg, car_length_max / 1000 AS car_length_max
    , car_length_min / 1000 AS car_length_min, car_length_avg / 1000 AS car_length_avg
    , car_width_max / 1000 AS car_width_max, car_width_min / 1000 AS car_width_min
    , car_width_avg / 1000 AS car_width_avg, car_height_max / 1000 AS car_height_max
    , car_height_min / 1000 AS car_height_min, car_height_avg / 1000 AS car_height_avg
    , total_quality_max / 1000 AS total_quality_max, total_quality_min / 1000 AS total_quality_min
    , total_quality_avg / 1000 AS total_quality_avg, equipment_quality_max / 1000 AS equipment_quality_max
    , equipment_quality_min / 1000 AS equipment_quality_min, equipment_quality_avg / 1000 AS equipment_quality_avg
    , wheelbase_max / 1000 AS wheelbase_max, wheelbase_min / 1000 AS wheelbase_min
    , wheelbase_avg / 1000 AS wheelbase_avg, front_track_max / 1000 AS front_track_max
    , front_track_min / 1000 AS front_track_min, front_track_avg / 1000 AS front_track_avg
    , rear_track_max / 1000 AS rear_track_max, rear_track_min / 1000 AS rear_track_min
    , rear_track_avg / 1000 AS rear_track_avg, price_level_max / 10 AS price_level_max
    , price_level_min / 10 AS price_level_min, price_level_avg / 10 AS price_level_avg
    , displacement_max, displacement_min, displacement_avg, rated_passenger_max, rated_passenger_min
    , rated_passenger_avg
FROM ycc_sales_dama0303_feature_14_numerical;