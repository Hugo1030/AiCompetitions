-- dclean_3_fix_price_level_CHAOS_value
-- => ycc_sales_dama0302_dclean_12_kill_chaos_price_level
-- => Size: 135026504
-- 
-- 已知乱码数据形式:
--      10��15��
-- 先可检验
-- 再可处理
-- 
-- 获得对应混乱样本
-- 
-- SELECT class_id, sale_date, province_id, city_id, sale_quantity
--     , price_level AS pll_choas
-- FROM ycc_sales_dama0302_dclean_0_killnull  
-- WHERE 
--     price_level IS NOT NULL
--     AND NOT(price_level LIKE "%-%")
--     AND NOT(price_level LIKE "%以下")
--     AND NOT(price_level LIKE "%以上")
-- LIMIT 10
-- ;
-- 
-- 检验样本是否有重复行
-- 
-- SELECT *
-- FROM ycc_sales_dama0302_dclean_0_killnull  
-- WHERE 
--     class_id = 10180
--     AND sale_date = 201204
--     AND province_id = 16
--     AND city_id = 201
--     AND sale_quantity = 1
-- 
-- LIMIT 10
-- ;
-- 
--  根据经验, 逐一装配合适的数据行
INSERT OVERWRITE TABLE 
        ycc_sales_dama0302_dclean_12_kill_chaos_price_level 
Select * 
FROM    ycc_sales_dama0302_dclean_8_reorder_fields 
WHERE  
    (price_level LIKE "%-%")
    OR (price_level LIKE "%以下")
    OR (price_level LIKE "%以上")
;
