-- feature_3_train_test
-- CHNAGELOH: 
--      18.3.3 Lichuan init.
--      18.3.4 LiChuan update. 重新合并, 做全轮动
--      <= yc_result_submit_a_baseline 
--      <= ycc_sales_lichuan0304_feature_3_train_set
--      => ycc_sales_lichuan0304_feature_4_train_test 合并 训练和测试集, 得到真实全轮动结构, 201801 非完成 class_id, 结构以此为准
-- 
-- du4ai / TianChi / issues / #4 - [TASK] 基础类别特征进行 one-hot 及 数值编码 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/4/task-one-hot
-- 合并合并 训练和测试集, 便于后期处理, 避免 bug
-- Size: 
drop table if exists _stuff_ycc_sales_lichuan0304_train;
CREATE TABLE _stuff_ycc_sales_lichuan0304_train
AS
SELECT sale_date, province_id, city_id, class_id, sale_quantity
FROM ycc_sales_dama0303_dclean_13_kill_chaos_fields;

drop table if exists _stuff_ycc_sales_lichuan0303_test;
CREATE TABLE _stuff_ycc_sales_lichuan0303_test
AS
SELECT predict_date AS sale_date, province_id, city_id, class_id, predict_quantity AS sale_quantity
FROM yc_result_sample_a_original;

DROP TABLE IF EXISTS ycc_sales_lichuan0304_feature_3_train_test;

CREATE TABLE ycc_sales_lichuan0304_feature_3_train_test
AS
SELECT *
FROM (
    SELECT *
    FROM _stuff_ycc_sales_lichuan0304_train
    UNION ALL
    SELECT *
    FROM _stuff_ycc_sales_lichuan0303_test
) t;