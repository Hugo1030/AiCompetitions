-- chk_price_level_value_CHOAS
-- 数值化检验
-- 
-- price_level 的值形式已知有:
--      null
--      20-25
--      5以下
--      20以上
--      10��15��
--      ...?
------------------------------------
-- 所以: 先评估数量级别
-- 注意: 针对洁净数据集, 得追加统计 浮点形式的嗯哼
------------------------------------

SELECT 
    COUNT(price_level) AS pll_all
    , SUM(CASE 
        WHEN price_level is NULL  
            THEN 1 
            ELSE 0 
        END) AS pll_null
    , SUM(CASE 
        WHEN (price_level LIKE "%-%")
            THEN 1 
            ELSE 0 
        END) AS pll_dash
    , SUM(CASE 
        WHEN (price_level LIKE "%以下")
            THEN 1 
            ELSE 0 
        END) AS pll_low
    , SUM(CASE 
        WHEN (price_level LIKE "%以上")
            THEN 1 
            ELSE 0 
        END) AS pll_up
    , SUM(CASE 
        WHEN (price_level LIKE "%\.%")
            THEN 1 
            ELSE 0 
        END) AS pll_numerical

    , (COUNT(price_level)
       - SUM(CASE 
            WHEN price_level is NULL  
                THEN 1 
                ELSE 0 
            END) 
       - SUM(CASE 
            WHEN (price_level LIKE "%-%")
                THEN 1 
                ELSE 0 
            END)
       - SUM(CASE 
            WHEN (price_level LIKE "%以下")
                THEN 1 
                ELSE 0 
            END)
       - SUM(CASE 
            WHEN (price_level LIKE "%以上")
                THEN 1 
                ELSE 0 
            END)
       - SUM(CASE 
            WHEN (price_level LIKE "%\.%")
                THEN 1 
                ELSE 0 
            END)
       ) AS pll_chaos

-- 原始去空
-- FROM ycc_sales_dama0302_dclean_0_killnull  
-- 最新杀重
FROM ycc_sales_dama0302_dclean_12_kill_chaos_price_level 
;

