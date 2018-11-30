-- feature_econ_2_draw_平均汇率_美元兑人民币
-- 提取合理数值表
-- <= yc_macro_econ
-- => ycmecon_2_ex_rate_USD2RMB_grow
-- 
-- 如果存在就嗯哼
DROP TABLE IF EXISTS ycmecon_2_ex_rate_USD2RMB_grow;

CREATE TABLE IF NOT EXISTS
    ycmecon_2_ex_rate_USD2RMB_grow 
AS SELECT 
    date
    , substring(date,1,6) AS month
    , number
FROM  yc_macro_econ 
WHERE 
    eco_indicator_type='利率汇率'
    AND
    eco_indicator='平均汇率:美元兑人民币'
    AND
    number IS NOT NULL

DISTRIBUTE BY   date 
SORT BY         date
;
