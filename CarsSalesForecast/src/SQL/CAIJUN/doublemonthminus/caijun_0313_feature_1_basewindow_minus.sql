-- feature_1_basewindow
-- CHNAGELOH: 
--      18.3.5 caijun init.
--      <= ycc_sales_woody_0313_base_mix_2018_minus 
--      => ycc_sales_caijun0313_feature_basewindow_minus
--      
--      
--  1.使用lag函数分别生成偏移1、2、3、4、5、6、7、8、9、10、11、12个月的销量列
--  2.将销量列中的NULL数据用0填充prj_tc_231640_123409_4l0qvy.ycc_sales_lichuan0304_feature_4_data_set 
--  
--  
--生成相比当月向前偏移1、2、3、4、5、6、7、8、9、10、11、12个月的销量
DROP TABLE IF EXISTS stuff_ycc_sales_caijun0305_feature_1_windows ;
CREATE TABLE stuff_ycc_sales_caijun0305_feature_1_windows
AS
select sale_date,province_id,city_id,class_id,sale_quantity_minus as sale_quantity,
lag(sale_quantity_minus,1)over(partition by province_id,city_id,class_id order by sale_date) as sale_last1M,
lag(sale_quantity_minus,2)over(partition by province_id,city_id,class_id order by sale_date) as sale_last2M,
lag(sale_quantity_minus,3)over(partition by province_id,city_id,class_id order by sale_date) as sale_last3M,
lag(sale_quantity_minus,4)over(partition by province_id,city_id,class_id order by sale_date) as sale_last4M,
lag(sale_quantity_minus,5)over(partition by province_id,city_id,class_id order by sale_date) as sale_last5M,
lag(sale_quantity_minus,6)over(partition by province_id,city_id,class_id order by sale_date) as sale_last6M,
lag(sale_quantity_minus,7)over(partition by province_id,city_id,class_id order by sale_date) as sale_last7M,
lag(sale_quantity_minus,8)over(partition by province_id,city_id,class_id order by sale_date) as sale_last8M,
lag(sale_quantity_minus,9)over(partition by province_id,city_id,class_id order by sale_date) as sale_last9M,
lag(sale_quantity_minus,10)over(partition by province_id,city_id,class_id order by sale_date) as sale_last10M,
lag(sale_quantity_minus,11)over(partition by province_id,city_id,class_id order by sale_date) as sale_last11M,
lag(sale_quantity_minus,12)over(partition by province_id,city_id,class_id order by sale_date) as sale_last12M
from prj_tc_231640_123409_4l0qvy.ycc_sales_woody_0313_base_mix_2018_minus;


--将NULL填充为0
DROP TABLE IF EXISTS prj_tc_231640_123409_4l0qvy.ycc_sales_caijun0313_feature_basewindow_minus ;
CREATE TABLE prj_tc_231640_123409_4l0qvy.ycc_sales_caijun0313_feature_basewindow_minus 
as
select sale_date,province_id,city_id,class_id,sale_quantity
,CASE 
     WHEN sale_last1M is NULL 
         THEN 0
     ELSE sale_last1M
 END AS sale_last1M

,CASE 
     WHEN sale_last2M is NULL 
         THEN 0
     ELSE sale_last2M
 END AS sale_last2M

,CASE 
     WHEN sale_last3M is NULL 
         THEN 0
     ELSE sale_last3M
 END AS sale_last3M


,CASE 
     WHEN sale_last4M is NULL 
         THEN 0
     ELSE sale_last4M
 END AS sale_last4M


,CASE 
     WHEN sale_last5M is NULL 
         THEN 0
     ELSE sale_last5M
 END AS sale_last5M


,CASE 
     WHEN sale_last6M is NULL 
         THEN 0
     ELSE sale_last6M
 END AS sale_last6M


,CASE 
     WHEN sale_last7M is NULL 
         THEN 0
     ELSE sale_last7M
 END AS sale_last7M


,CASE 
     WHEN sale_last8M is NULL 
         THEN 0
     ELSE sale_last8M
 END AS sale_last8M


,CASE 
     WHEN sale_last9M is NULL 
         THEN 0
     ELSE sale_last9M
 END AS sale_last9M


,CASE 
     WHEN sale_last10M is NULL 
         THEN 0
     ELSE sale_last10M
 END AS sale_last10M


,CASE 
     WHEN sale_last11M is NULL 
         THEN 0
     ELSE sale_last11M
 END AS sale_last11M


,CASE 
     WHEN sale_last12M is NULL 
         THEN 0
     ELSE sale_last12M
 END AS sale_last12M

from prj_tc_231640_123409_4l0qvy.stuff_ycc_sales_caijun0305_feature_1_windows;

