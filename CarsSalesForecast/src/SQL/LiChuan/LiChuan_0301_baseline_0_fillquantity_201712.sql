-- 得到唯一 201712 分省市 class_id 的销量和
CREATE TABLE IF NOT EXISTS stuff_lichuan_301_sale_quantity_december
AS
SELECT prj_tc_231640_123409_4l0qvy.yc_result_sample_a, SUM(sale_quantity)
FROM stuff_lichuan_301_sale_feature_base
WHERE sale_date = '201712'
GROUP BY sale_date, 
    province_id, 
    city_id, 
    class_id;

-- 发现 201712 分省市有 105610 条数据, 而 201801 只有 96785 条数据, 那么表明有部分车型, 在 201712 销售, 但未在 201801 销售
-- 现在考虑将上面的销量数据, 根据 201801 的分省市车型 等于 201712 同样省市车型的销量
-- 201712 返回一个 201801 分省市车型销量 存在的数据集
-- 再进行 merge 操作, left join
CREATE TABLE yc_result_submit_a
AS
SELECT yc_result_sample_a_original.predict_date, yc_result_sample_a_original.province_id, yc_result_sample_a_original.city_id, yc_result_sample_a_original.class_id, stuff_lichuan_301_sale_quantity_december._c4
FROM yc_result_sample_a_original
LEFT OUTER JOIN stuff_lichuan_301_sale_quantity_december
ON yc_result_sample_a_original.city_id = stuff_lichuan_301_sale_quantity_december.city_id
    AND yc_result_sample_a_original.class_id = stuff_lichuan_301_sale_quantity_december.class_id;

ALTER TABLE yc_result_submit_a
    CHANGE COLUMN _c4 RENAME TO predict_quantity;

-- 对 yc_result_sample_a 的 predict_quantity 中的 null 填充 0
INSERT OVERWRITE TABLE yc_result_submit_a
SELECT predict_date, province_id, city_id, class_id
    , CASE 
        WHEN predict_quantity IS NULL THEN 0
        ELSE predict_quantity
    END AS predict_quantity
FROM yc_result_submit_a;