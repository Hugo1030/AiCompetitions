-- feature_9_count_classid
-- CHNAGELOH: 
--      18.3.6 Lichuan init.
--      <= ycc_sales_lichuan0305_feature_8_time_window
--      => ycc_sales_lichuan0306_feature_9_count_classid 
-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
-- 复制全表, 去掉 sale_quantity = 0 的行 => stuff_ycc_sales_lichuan0306_time_window
-- 统计当月分省市多少 class_id 在销售 => ycc_sales_lichuan0306_feature_9_count_classid
-- 
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0306_time_window;
CREATE TABLE stuff_ycc_sales_lichuan0306_time_window
AS
SELECT sale_date, province_id, city_id, class_id
FROM ycc_sales_lichuan0305_feature_8_time_window
WHERE sale_quantity != 0;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0307_submit;
CREATE TABLE stuff_ycc_sales_lichuan0307_submit
AS
SELECT predict_date AS sale_date, province_id, city_id, class_id
FROM yc_result_sample_a_original
GROUP BY predict_date, 
    province_id, 
    city_id, 
    class_id;

DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0307_time_window;

CREATE TABLE stuff_ycc_sales_lichuan0307_time_window
AS
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0306_time_window
UNION ALL
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0307_submit;
    

DROP TABLE IF EXISTS ycc_sales_lichuan0306_feature_9_count_classid;

CREATE TABLE ycc_sales_lichuan0306_feature_9_count_classid
AS
SELECT a.sale_date, a.province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , sale_last12M_sum, b.cnt_classid
FROM ycc_sales_lichuan0305_feature_8_time_window a
LEFT OUTER JOIN (
    SELECT sale_date, province_id, city_id, COUNT(class_id) AS cnt_classid
    FROM stuff_ycc_sales_lichuan0307_time_window
    GROUP BY sale_date, 
        province_id, 
        city_id
) b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id;
    
INSERT OVERWRITE TABLE ycc_sales_lichuan0306_feature_9_count_classid
SELECT sale_date, province_id, city_id, class_id, sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , sale_last12M_sum
    , CASE 
        WHEN cnt_classid IS NULL 
            THEN 0
        ELSE cnt_classid
    END AS cnt_classid
FROM ycc_sales_lichuan0306_feature_9_count_classid;