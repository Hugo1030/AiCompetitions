-- feature_econ_1_avg_零售汽车当月同比
-- 提取合理数值表
-- <= ycmecon_0_retail_car_monthly_grow
-- => ycmecon_1_retail_car_monthly_grow_avg
-- 
-- 如果不存在就创建
DROP TABLE IF EXISTS ycmecon_1_retail_car_monthly_grow_avg;

CREATE TABLE IF NOT EXISTS
    ycmecon_1_retail_car_monthly_grow_avg 
AS SELECT 
    month, avg(number) AS avg
FROM ycmecon_0_retail_car_monthly_grow 
GROUP BY
    month
;


