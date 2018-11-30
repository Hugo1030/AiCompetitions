-- feature_11_how_many_month_sale
-- CHNAGELOH: 
--      18.3.7 Lichuan init.
     
--      <= ycc_sales_lichuan0306_feature_10_year_month
--      => ycc_sales_lichuan0307_feature_11_how_many_month_sale 提取分省市 class_id 已经销售了多少个月
--      
--      备份: ycc_sales_lichuan0307_feature_11_how_many_month_sale_copy(以防万一...)
-- du4ai / TianChi / issues / #7 - [TASK] 基础时序销量类特征提取 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/7/task
   
-- 先得到 201201 有销量的 class_id, 销售月份设为 1, 其余为 0 进行初始化 => stuff_lichuan0306_feature_11_how_many_month_sale
-- 先得到一个 201202 的 sale_date, city_id, sale_quantity, 201201的 how_many => stuff_2
-- 在得到一个 201202 的 全正确表 => stuff_2
-- stuff_2 和原始表相加, 得到 201202 正确的表 => stuff_lichuan0306_feature_11_how_many_month_sale
-- 循环上面的做法, 直到 201712
-- 得到 201801 原始表 => stuff_ycc_sales_lichuan0307_time_window
-- 令 201801 表 存在的 class_id 的销量 = 10000 => stuff_1
-- 得到 201801 表销售月数 => stuff_1
-- 将 stuff_201801 并入 销售月数统计表  => stuff_lichuan0306_feature_11_how_many_month_sale
-- 全部销售月数并入 整体数据集 => ycc_sales_lichuan0306_feature_11_how_many_month_sale

-- 201201
DROP TABLE IF EXISTS stuff_lichuan0306_feature_11_how_many_month_sale;
CREATE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
AS
SELECT a.sale_date, a.city_id, a.class_id, sale_quantity, b.how_many_month_sale
FROM ycc_sales_lichuan0306_feature_10_year_month a
LEFT OUTER JOIN (
    SELECT sale_date, city_id, class_id
        , CASE 
            when (sale_date = '201201' and  sale_quantity != 0.0)
                then 1.0
            ELSE 0.0
        END AS how_many_month_sale
    FROM ycc_sales_lichuan0306_feature_10_year_month
) b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
-- 201202 - 201712

DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201202'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201201'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
INSERT OVERWRITE TABLE 
        stuff_2 
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201202' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201203'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201202'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201203' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201204'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201203'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201204' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201205'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201204'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201205' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201206'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201205'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201206' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_7;
CREATE TABLE stuff_7
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201207'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201206'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_7
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_7;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201207' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_7 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_8;
CREATE TABLE stuff_8
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201208'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201207'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_8
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_8;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201208' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_8 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_9;
CREATE TABLE stuff_9
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201209'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201208'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_9
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_9;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201209' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_9 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_10;
CREATE TABLE stuff_10
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201210'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201209'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_10
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_10;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201210' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_10 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_11;
CREATE TABLE stuff_11
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201211'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201210'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_11
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_11;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201211' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_11 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_12;
CREATE TABLE stuff_12
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201212'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201211'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_12
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_12;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201212' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_12 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201301'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201212'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201301' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201302'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201301'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_2
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201302' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201303'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201302'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201303' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201304'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201303'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201304' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201305'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201304'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201305' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201306'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201305'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201306' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_7;
CREATE TABLE stuff_7
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201307'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201306'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_7
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_7;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201307' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_7 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_8;
CREATE TABLE stuff_8
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201308'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201307'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_8
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_8;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201308' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_8 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_9;
CREATE TABLE stuff_9
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201309'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201308'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_9
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_9;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201309' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_9 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_10;
CREATE TABLE stuff_10
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201310'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201309'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_10
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_10;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201310' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_10 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_11;
CREATE TABLE stuff_11
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201311'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201310'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_11
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_11;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201311' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_11 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_12;
CREATE TABLE stuff_12
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201312'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201311'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_12
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_12;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201312' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_12 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201401'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201312'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201401' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201402'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201401'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_2
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201402' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201403'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201402'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201403' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201404'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201403'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201404' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201405'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201404'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201405' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201406'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201405'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201406' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_7;
CREATE TABLE stuff_7
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201407'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201406'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_7
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_7;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201407' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_7 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_8;
CREATE TABLE stuff_8
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201408'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201407'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_8
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_8;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201408' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_8 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_9;
CREATE TABLE stuff_9
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201409'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201408'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_9
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_9;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201409' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_9 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_10;
CREATE TABLE stuff_10
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201410'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201409'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_10
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_10;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201410' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_10 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_11;
CREATE TABLE stuff_11
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201411'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201410'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_11
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_11;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201411' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_11 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_12;
CREATE TABLE stuff_12
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201412'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201411'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_12
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_12;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201412' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_12 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201501'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201412'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201501' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201502'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201501'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_2
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201502' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201503'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201502'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201503' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201504'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201503'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201504' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201505'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201504'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201505' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201506'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201505'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201506' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_7;
CREATE TABLE stuff_7
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201507'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201506'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_7
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_7;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201507' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_7 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_8;
CREATE TABLE stuff_8
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201508'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201507'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_8
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_8;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201508' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_8 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_9;
CREATE TABLE stuff_9
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201509'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201508'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_9
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_9;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201509' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_9 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_10;
CREATE TABLE stuff_10
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201510'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201509'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_10
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_10;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201510' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_10 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_11;
CREATE TABLE stuff_11
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201511'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201510'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_11
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_11;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201511' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_11 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_12;
CREATE TABLE stuff_12
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201512'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201511'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_12
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_12;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201512' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_12 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201601'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201512'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201601' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201602'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201601'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_2
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201602' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201603'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201602'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201603' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201604'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201603'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201604' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201605'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201604'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201605' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201606'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201605'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201606' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_7;
CREATE TABLE stuff_7
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201607'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201606'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_7
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_7;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201607' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_7 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_8;
CREATE TABLE stuff_8
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201608'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201607'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_8
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_8;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201608' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_8 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_9;
CREATE TABLE stuff_9
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201609'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201608'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_9
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_9;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201609' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_9 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_10;
CREATE TABLE stuff_10
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201610'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201609'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_10
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_10;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201610' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_10 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_11;
CREATE TABLE stuff_11
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201611'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201610'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_11
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_11;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201611' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_11 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_12;
CREATE TABLE stuff_12
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201612'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201611'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_12
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_12;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201612' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_12 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201701'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201612'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201701' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_2;
CREATE TABLE stuff_2
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201702'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201701'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_2
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_2;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201702' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_2 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_3;
CREATE TABLE stuff_3
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201703'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201702'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_3
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_3;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201703' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_3 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_4;
CREATE TABLE stuff_4
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201704'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201703'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_4
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_4;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201704' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_4 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_5;
CREATE TABLE stuff_5
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201705'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201704'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_5
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_5;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201705' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_5 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_6;
CREATE TABLE stuff_6
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201706'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201705'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_6
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_6;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201706' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_6 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_7;
CREATE TABLE stuff_7
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201707'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201706'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_7
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_7;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201707' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_7 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_8;
CREATE TABLE stuff_8
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201708'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201707'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_8
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_8;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201708' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_8 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_9;
CREATE TABLE stuff_9
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201709'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201708'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_9
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_9;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201709' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_9 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_10;
CREATE TABLE stuff_10
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201710'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201709'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_10
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_10;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201710' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_10 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_11;
CREATE TABLE stuff_11
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201711'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201710'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_11
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_11;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201711' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_11 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;


DROP TABLE IF EXISTS stuff_12;
CREATE TABLE stuff_12
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201712'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201711'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_12
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_12;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201712' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_12 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
-- 201801
DROP TABLE IF EXISTS stuff_ycc_sales_lichuan0307_time_window;
CREATE TABLE stuff_ycc_sales_lichuan0307_time_window
AS
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0306_time_window
UNION ALL
SELECT sale_date, province_id, city_id, class_id
FROM stuff_ycc_sales_lichuan0307_submit;

ALTER TABLE stuff_ycc_sales_lichuan0307_submit ADD COLUMNS (sale_quantity double)

INSERT OVERWRITE TABLE stuff_ycc_sales_lichuan0307_submit
SELECT sale_date, province_id, city_id, class_id
    , CASE 
        WHEN class_id IS NOT NULL THEN 10000
        ELSE 10000
    END AS sale_quantity
FROM stuff_ycc_sales_lichuan0307_submit;

DROP TABLE IF EXISTS stuff_1;
CREATE TABLE stuff_1
AS
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity, b.how_many_month_sale
FROM (
    SELECT sale_date, city_id, class_id, sale_quantity
    FROM stuff_lichuan0306_feature_11_how_many_month_sale a
    WHERE sale_date = '201801'
) a
LEFT OUTER JOIN (
    SELECT city_id, class_id, how_many_month_sale
    FROM stuff_lichuan0306_feature_11_how_many_month_sale
    WHERE sale_date = '201712'
) b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;
    
INSERT OVERWRITE TABLE 
        stuff_1
Select a.sale_date, a.city_id, a.class_id
    ,case
        when b.sale_quantity = 10000
            then b.sale_quantity
        else 0
    end as sale_quantity
    ,how_many_month_sale
from stuff_1 a
left outer join
    stuff_ycc_sales_lichuan0307_submit b
ON a.city_id = b.city_id
    AND a.class_id = b.class_id;

INSERT OVERWRITE TABLE 
        stuff_1
Select sale_date, city_id, class_id, sale_quantity
    ,case
        when sale_quantity != 0
            then how_many_month_sale + 1
        else how_many_month_sale
    end as how_many_month_sale
from stuff_1;

INSERT OVERWRITE TABLE stuff_lichuan0306_feature_11_how_many_month_sale
SELECT a.sale_date, a.city_id, a.class_id, a.sale_quantity
    , CASE 
        WHEN a.sale_date = '201801' THEN b.how_many_month_sale
        ELSE a.how_many_month_sale
    END AS how_many_month_sale
FROM stuff_lichuan0306_feature_11_how_many_month_sale a
LEFT OUTER JOIN stuff_1 b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;

DROP TABLE IF EXISTS ycc_sales_lichuan0307_feature_11_how_many_month_sale;

CREATE TABLE ycc_sales_lichuan0307_feature_11_how_many_month_sale
AS
SELECT a.sale_date, province_id, a.city_id, a.class_id, a.sale_quantity
    , oil_price, total_sale_last1M, total_last12M_sum, sale_last1M, sale_last12M
    , sale_last12M_sum, cnt_classid, year, month, b.how_many_month_sale
FROM ycc_sales_lichuan0306_feature_10_year_month a
LEFT OUTER JOIN stuff_lichuan0306_feature_11_how_many_month_sale b
ON a.sale_date = b.sale_date
    AND a.city_id = b.city_id
    AND a.class_id = b.class_id;