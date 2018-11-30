-- feature_8_time_window
-- CHNAGELOH: 
--      18.3.5 Lichuan init.
--      <= ycc_sales_lichuan0305_feature_7_total_sale
--      <= stuff_ycc_sales_caijun0305_feature_1M_12M_12Msum
--      => ycc_sales_lichuan0305_feature_8_time_window 
--      
-- 
-- du4ai / TianChi / issues / #8 - [TASK] 时间窗口类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
--
-- 并入上 1/12 月销量及12月销量和
DROP TABLE IF EXISTS ycc_sales_lichuan0305_feature_8_time_window;

CREATE TABLE ycc_sales_lichuan0305_feature_8_time_window
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , sale_last12M_sum
FROM ycc_sales_lichuan0305_feature_7_total_sale a
LEFT OUTER JOIN stuff_ycc_sales_caijun0305_feature_1M_12M_12Msum b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;