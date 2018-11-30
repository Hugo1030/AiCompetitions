-- feature_econ_3_avg_平均汇率_美元兑人民币
-- 提取合理数值表
-- <= ycmecon_2_ex_rate_USD2RMB_grow
-- => ycmecon_3_ex_rate_USD2RMB_grow_avg
-- 
-- 如果不存在就创建
DROP TABLE IF EXISTS ycmecon_3_ex_rate_USD2RMB_grow_avg;

CREATE TABLE IF NOT EXISTS
    ycmecon_3_ex_rate_USD2RMB_grow_avg 
AS SELECT 
    month, avg(number) AS avg
FROM ycmecon_2_ex_rate_USD2RMB_grow 
GROUP BY
    month
;

SELECT * 
FROM ycmecon_3_ex_rate_USD2RMB_grow_avg 
LIMIT 100;
