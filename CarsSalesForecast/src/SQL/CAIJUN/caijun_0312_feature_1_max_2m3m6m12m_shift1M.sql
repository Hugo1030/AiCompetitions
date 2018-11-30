-- CHNAGELOH: 
--      18.3.12 caijun init.
--      <= ycc_sales_caijun0312_feature_basewindow_shift1M 
--      => stuff_ycc_sales_caijun0312_feature_max_2m3m6m12m_shift1M
--      所有字段名操作所使用的月份都延迟了一个月

DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_1_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_1_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,

1sub2*sale_last1M+2sub1*sale_last2M as max2m,1sub2*sale_last1M+2sub1*sale_last2M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M
,CASE 
     WHEN sale_last1M - sale_last2M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN sale_last1M - sale_last2M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from ycc_sales_caijun0312_feature_basewindow_shift1M) a;


DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_2_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_2_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m

,1sub2*maxtotal+2sub1*sale_last3M as max3m
,1sub2*maxtotal+2sub1*sale_last3M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m
,CASE 
     WHEN maxtotal - sale_last3M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last3M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_1_max_2m3m6m12m) b ;


DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_3_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_3_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m

--,1sub2*maxtotal+2sub1*sale_last3M as max3m
,1sub2*maxtotal+2sub1*sale_last4M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m
,CASE 
     WHEN maxtotal - sale_last4M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last4M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_2_max_2m3m6m12m) c ;

DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_4_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_4_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m

--,1sub2*maxtotal+2sub1*sale_last3M as max3m
,1sub2*maxtotal+2sub1*sale_last5M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m
,CASE 
     WHEN maxtotal - sale_last5M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last5M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_3_max_2m3m6m12m) d   ;



DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_5_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_5_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m

,1sub2*maxtotal+2sub1*sale_last6M as max6m
,1sub2*maxtotal+2sub1*sale_last6M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m
,CASE 
     WHEN maxtotal - sale_last6M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last6M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_4_max_2m3m6m12m) e ;



DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_6_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_6_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m,max6m

--,1sub2*maxtotal+2sub1*sale_last6M as max6m
,1sub2*maxtotal+2sub1*sale_last7M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m,max6m
,CASE 
     WHEN maxtotal - sale_last7M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last7M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_5_max_2m3m6m12m) f  ;


DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_7_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_7_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m,max6m

--,1sub2*maxtotal+2sub1*sale_last6M as max6m
,1sub2*maxtotal+2sub1*sale_last8M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m,max6m
,CASE 
     WHEN maxtotal - sale_last8M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last8M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_6_max_2m3m6m12m) g ;


DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_8_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_8_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m,max6m

--,1sub2*maxtotal+2sub1*sale_last6M as max6m
,1sub2*maxtotal+2sub1*sale_last9M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m,max6m
,CASE 
     WHEN maxtotal - sale_last9M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last9M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_7_max_2m3m6m12m) h  ;


DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_9_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_9_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m,max6m

--,1sub2*maxtotal+2sub1*sale_last6M as max6m
,1sub2*maxtotal+2sub1*sale_last10M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m,max6m
,CASE 
     WHEN maxtotal - sale_last10M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last10M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_8_max_2m3m6m12m) i   ;



DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_10_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_10_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m,max6m

--,1sub2*maxtotal+2sub1*sale_last6M as max6m
,1sub2*maxtotal+2sub1*sale_last11M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m,max6m
,CASE 
     WHEN maxtotal - sale_last11M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last11M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_9_max_2m3m6m12m) j  ;

DROP TABLE IF EXISTS stuff_ycc_sales_caijun0307_feature_11_max_2m3m6m12m;
CREATE TABLE stuff_ycc_sales_caijun0307_feature_11_max_2m3m6m12m 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,max2m,max3m,max6m

,1sub2*maxtotal+2sub1*sale_last12M as max12m
,1sub2*maxtotal+2sub1*sale_last12M as maxtotal

from
(select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M,sale_last9M,sale_last10M,sale_last11M,sale_last12M,maxtotal,max2m,max3m,max6m
,CASE 
     WHEN maxtotal - sale_last12M >= 0 
         THEN 1
     ELSE 0
 END AS 1sub2
,CASE 
     WHEN maxtotal - sale_last12M >= 0 
         THEN 0
     ELSE 1
 END AS 2sub1
from stuff_ycc_sales_caijun0307_feature_10_max_2m3m6m12m) k   ;

DROP TABLE IF EXISTS stuff_ycc_sales_caijun0312_feature_max_2m3m6m12m_shift1M;
CREATE TABLE stuff_ycc_sales_caijun0312_feature_max_2m3m6m12m_shift1M 
AS
select sale_date,province_id,city_id,class_id,sale_quantity,max2m,max3m,max6m,max12m
from stuff_ycc_sales_caijun0307_feature_11_max_2m3m6m12m;
