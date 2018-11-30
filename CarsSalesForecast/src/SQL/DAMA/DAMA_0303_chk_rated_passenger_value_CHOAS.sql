-- chk_rated_passenger_value_CHOAS
-- 数值化检验
-- 
-- rated_passenger 的值形式已知有:
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
    COUNT(rated_passenger) AS rp_all
    , SUM(CASE 
        WHEN rated_passenger is NULL  
            THEN 1 
            ELSE 0 
        END) AS rp_null
    , SUM(CASE 
        WHEN (rated_passenger LIKE "%-%")
            THEN 1 
            ELSE 0 
        END) AS rp_dash
    , SUM(CASE 
        WHEN (length(rated_passenger) = 1
                OR
                length(rated_passenger) = 2
            )
            THEN 1 
            ELSE 0 
        END) AS rp_num
    , SUM(CASE 
        WHEN (rated_passenger LIKE "%\.%")
            THEN 1 
            ELSE 0 
        END) AS rp_numerical

    , (COUNT(rated_passenger)
       - SUM(CASE 
            WHEN rated_passenger is NULL  
                THEN 1 
                ELSE 0 
            END) 
       - SUM(CASE 
            WHEN (rated_passenger LIKE "%-%")
                THEN 1 
                ELSE 0 
            END)
       - SUM(CASE 
            WHEN (length(rated_passenger) = 1
                    OR
                    length(rated_passenger) = 2
                )
                THEN 1 
                ELSE 0 
            END)
       - SUM(CASE 
            WHEN (rated_passenger LIKE "%\.%")
                THEN 1 
                ELSE 0 
            END)
       ) AS rp_chaos

-- 原始去空
-- FROM ycc_sales_dama0302_dclean_0_killnull  
-- 最新杀重
FROM ycc_sales_dama0302_dclean_12_kill_chaos_price_level 
;

