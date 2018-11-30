-- dclean_6_0_class_grp_id
-- 复制数据表来进行尝试
-- <= ycc_sales_dama0302_dclean_8_reorder_fields
-- => ycc_sales_dama0304_dclean_20_grp_id4class_pccd
-- => Size: ??
-- 
-- 如果存在先删除
DROP TABLE IF EXISTS _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd;
 
-- 如果不存在就创建
CREATE TABLE IF NOT EXISTS
    _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd 
AS SELECT * 
FROM  ycc_sales_dama0302_dclean_8_reorder_fields
;
-- 如果已经有,则清空
-- TRUNCATE TABLE ycc_sales_dama0303_dclean_13_kill_chaos_fields;
