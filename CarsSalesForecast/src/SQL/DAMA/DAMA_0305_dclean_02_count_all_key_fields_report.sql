-- dclean_02_count_all_key_fields_report
-- 从最新官方原始数据集中统计核心字段的数量, 以便检验训练集的嗯哼
-- <= _statistics_ycc_sales_class_id
-- <= _statistics_ycc_sales_province_id
-- <= _statistics_ycc_sales_city_id
-- <= _statistics_ycc_sales_sale_date
-- <= _statistics_ycc_sales_class_idpcd
-- => 当前:
--    
--class_id总数,province_id总数,city_id总数,sale_date总数,省市class组合id总数,训练集尺寸_不含1801
--698,31,342,72,195833,14099976
--   
--   
-- 统计汇报所有关键数量
--   

SELECT sum(ci) AS class_id总数 
    , sum(cp) AS province_id总数 
    , sum(cc) AS city_id总数 
    , sum(cd) AS sale_date总数 
    , sum(cipcd) AS 省市class组合id总数 
    , sum(cipcd)*sum(cd) AS 训练集尺寸_不含1801 
FROM (
    SELECT count(1) AS ci ,0 AS cp ,0 AS cc ,0 AS cd ,0 AS cipcd
        FROM _statistics_ycc_sales_class_id
    UNION ALL
    SELECT 0 AS ci ,count(1) AS cp ,0 AS cc ,0 AS cd ,0 AS cipcd
        FROM _statistics_ycc_sales_province_id
    UNION ALL
    SELECT 0 AS ci ,0 AS cp ,count(1) AS cc ,0 AS cd ,0 AS cipcd
        FROM _statistics_ycc_sales_city_id
    UNION ALL
    SELECT 0 AS ci ,0 AS cp ,0 AS cc ,count(1) AS cd ,0 AS cipcd
        FROM _statistics_ycc_sales_sale_date
    UNION ALL
    SELECT 0 AS ci ,0 AS cp ,0 AS cc ,0 AS cd ,count(1) AS cipcd
        FROM _statistics_ycc_sales_class_idpcd
) t;








-- 
-- v18.3.6.2042 DAMA
-- 


