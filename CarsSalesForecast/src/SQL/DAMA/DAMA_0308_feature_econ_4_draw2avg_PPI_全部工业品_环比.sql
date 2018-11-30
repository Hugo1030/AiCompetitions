-- feature_econ_4_draw2avg_PPI_全部工业品_环比
-- 提取合理数值表
-- <= yc_macro_econ
-- => ycmecon_4_PPI_all_industrial_lrratio_grow
-- => ycmecon_5_PPI_all_industrial_lrratio_grow_avg
-- 
-- 如果存在就嗯哼
DROP TABLE IF EXISTS ycmecon_4_PPI_all_industrial_lrratio_grow;
CREATE TABLE IF NOT EXISTS
    ycmecon_4_PPI_all_industrial_lrratio_grow 
AS SELECT 
    date
    , substring(date,1,6) AS month
    , number
FROM  yc_macro_econ 
WHERE 
    eco_indicator_type='CPI与PPI'
    AND
    eco_indicator='PPI:全部工业品:环比(%)'
    AND
    number IS NOT NULL
DISTRIBUTE BY   date 
SORT BY         date
;
-- 
-- 如果不存在就创建
DROP TABLE IF EXISTS ycmecon_5_PPI_all_industrial_lrratio_grow_avg;
CREATE TABLE IF NOT EXISTS
    ycmecon_5_PPI_all_industrial_lrratio_grow_avg 
AS SELECT 
    month, avg(number) AS avg
FROM ycmecon_4_PPI_all_industrial_lrratio_grow 
GROUP BY
    month
;
SELECT * 
FROM ycmecon_5_PPI_all_industrial_lrratio_grow_avg 
LIMIT 100;
