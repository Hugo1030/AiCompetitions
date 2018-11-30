-- feature_econ_0_draw_零售汽车当月同比
-- 提取合理数值表
-- <= yc_macro_econ
-- => ycmecon_0_retail_car_monthly_grow
-- 
-- 如果存在就嗯哼
DROP TABLE IF EXISTS ycmecon_0_retail_car_monthly_grow;

CREATE TABLE IF NOT EXISTS
    ycmecon_0_retail_car_monthly_grow 
AS SELECT 
    date
    , substring(date,1,6) AS month
    , number
FROM  yc_macro_econ 
WHERE 
    eco_indicator_type='社会消费品零售总额'
    AND
    eco_indicator='零售额:汽车类:当月同比(%)'
    AND
    number IS NOT NULL

DISTRIBUTE BY   date 
SORT BY         date
;
