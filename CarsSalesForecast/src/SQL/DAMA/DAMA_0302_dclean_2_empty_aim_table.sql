-- dclean_2_empty_aim_table
-- 完成 dclean_1_reorder_fields 后
-- 复制结构, 以便接受合理的数据行
-- => ycc_sales_dama0302_dclean_12_kill_chaos_price_level
-- => Size: 0 
-- 

CREATE TABLE IF NOT EXISTS
    ycc_sales_dama0302_dclean_12_kill_chaos_price_level 
LIKE ycc_sales_dama0302_dclean_8_reorder_fields
;
