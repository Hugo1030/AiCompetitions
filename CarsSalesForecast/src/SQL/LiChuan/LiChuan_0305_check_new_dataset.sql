-- 官方新发布数据集, 去掉乱码检测
--      <= yc_passenger_car_sales 元数据集复制 yc_passenger_car_sales_old
--      => yc_passenger_car_sales_old
-- 拉取最新数据集
--      => yc_passenger_car_sales
-- 去掉空值 kill null
--      <= yc_passenger_car_sales
--      => ycc_sales_dama0302_dclean_0_killnull
-- 去掉重复值
--      <= ycc_sales_dama0302_dclean_0_killnull
--      => ycc_sales_dama0302_dclean_8_reorder_fields
-- 复制空表
--      <= ycc_sales_dama0302_dclean_8_reorder_fields
--      => ycc_sales_dama0303_dclean_13_kill_chaos_fields 
-- 找到合适数据行
--      <= ycc_sales_dama0302_dclean_8_reorder_fields
--      => ycc_sales_dama0303_dclean_13_kill_chaos_fields
-- 对原有字符形式进行数值化处理:
--      %-%   <- 平均值
--      %以下 <- 80%值
--      %以上 <- 120%值  
--      <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
--      => ycc_sales_dama0303_dclean_13_kill_chaos_fields   
-- 对数值类特征进行 numerical 编码, 该类型特征有:
-- power, car_length, car_width, car_height
-- , total_quality, equipment_quality, wheelbase, front_track, rear_track
-- price_level   
--      <= ycc_sales_dama0303_dclean_13_kill_chaos_fields
--      => ycc_sales_dama0303_feature_14_numerical
--    
--    
--    
--    
--    
CREATE TABLE yc_passenger_car_sales_old
AS
SELECT *
FROM yc_passenger_car_sales;

DROP TABLE IF EXISTS yc_passenger_car_sales;

CREATE TABLE yc_passenger_car_sales
AS
SELECT *
FROM odps_tc_257100_f673506e024.yc_passenger_car_sales;