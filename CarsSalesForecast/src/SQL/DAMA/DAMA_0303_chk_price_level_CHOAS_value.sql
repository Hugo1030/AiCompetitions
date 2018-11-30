-- chk_price_level_CHOAS_value
-- 
-- price_level 的值形式已知有:
--      null
--      20-25
--      5以下
--      20以上
--      10��15��
--      ...?
------------------------------------
-- 抽取样本数据行
-- 正浮点数     "^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$"　　/

------------------------------------

SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , price_level AS pll_chaos
FROM ycc_sales_dama0302_dclean_12_kill_chaos_price_level 
WHERE 
    NOT(price_level LIKE "%-%")
    AND NOT(price_level LIKE "%以下")
    AND NOT(price_level LIKE "%以上")
    AND NOT(price_level LIKE "%\.%")
LIMIT 10
;

