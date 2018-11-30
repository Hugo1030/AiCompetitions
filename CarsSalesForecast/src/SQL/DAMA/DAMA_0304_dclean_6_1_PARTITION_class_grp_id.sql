-- dclean_6_1_PARTITION_class_grp_id
-- 用 PARTITION 来切分数据空间, 针对 class组ID 进行时序研究
-- <= ycc_sales_dama0304_dclean_20_grp_id4class_pccd
-- => ycc_sales_dama0304_dclean_20_grp_id4class_pccd
-- => Size: ??
-- 
SELECT * FROM 
    _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd AS PCCD
WHERE 
    PCCD.class_id = '10043' 
    AND PCCD.province_id = '30'
    AND PCCD.city_id = '194'
LIMIT 5
;

-- ALTER TABLE _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd 
-- ADD PARTITION(
--     class_id='10043'
--     , province_id='30'
--     , city_id='194'
-- )
-- ;
-- 
-- DESC _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd;