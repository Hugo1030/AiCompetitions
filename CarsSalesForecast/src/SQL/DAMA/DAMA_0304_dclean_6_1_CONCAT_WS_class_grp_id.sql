-- dclean_6_1_CONCAT_WS_class_grp_id
-- 用 CONCAT_WS() 组成出 class 最终 id
-- <= _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd
-- => _stuff_ycc_sales_dama0304_dclean_21_class_pccd
-- => Size: 676312 
-- 
CREATE TABLE IF NOT EXISTS
    _stuff_ycc_sales_dama0304_dclean_21_class_pccd 
AS SELECT 
    class_id,province_id,city_id 
    ,CONCAT_WS('_'
        , cast(class_id as string) 
        , cast(province_id as string) 
        , cast(city_id as string) 
        ) AS class_idpc
FROM  _stuff_ycc_sales_dama0304_dclean_20_grp_id4class_pccd
GROUP BY class_id,province_id,city_id 
--ORDER BY class_id
;


