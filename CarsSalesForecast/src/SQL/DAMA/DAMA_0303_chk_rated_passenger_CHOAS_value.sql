-- chk_rated_passenger_CHOAS_value
-- 
-- price_level 的值形式已知有:
--      null
--      20-25
--      5以下
--      20以上
--      10��15��
--      ...?
-- SELECT rated_passenger FROM ycc_sales_dama0302_dclean_12_kill_chaos_price_level
-- group by rated_passenger
-- ;
------------------------------------
-- 抽取样本数据行
-- SELECT * 
-- FROM ycc_sales_dama0302_dclean_12_kill_chaos_price_level
-- WHERE
--   sale_date=201512
--   AND province_id=10
--   AND city_id=193
--   AND class_id=10057
--   AND sale_quantity = 57
-- ;
------------------------------------
SELECT rated_passenger,length(rated_passenger) as lan_rp 
FROM ycc_sales_dama0303_dclean_13_kill_chaos_fields
group by rated_passenger;

-- SELECT sale_date, province_id, city_id, class_id, sale_quantity
--     , rated_passenger AS rated_passenger
-- FROM ycc_sales_dama0303_dclean_13_kill_chaos_fields 
-- WHERE 
--     NOT(rated_passenger LIKE "%-%")
--     AND NOT(rated_passenger LIKE "%\.%")
--     AND NOT(length(rated_passenger) = 1
--         OR
--         length(rated_passenger) = 2)
-- LIMIT 10
-- ;

