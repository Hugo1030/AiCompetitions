-- CHNAGELOH: 
--      18.3.12 caijun init.
--      <= ycc_sales_caijun0312_feature_basewindow_shift1M 
--      => ycc_sales_caijun0312_feature_avg_2m3m6m12m_shift1M
--      所有字段名操作所使用的月份都延迟了一个月
DROP TABLE IF EXISTS ycc_sales_caijun0312_feature_avg_2m3m6m12m_shift1M ;
CREATE TABLE ycc_sales_caijun0312_feature_avg_2m3m6m12m_shift1M
as
select sale_date,province_id,city_id,class_id,sale_quantity,

(sale_last1M+sale_last2M)/2
as sale_last2M_avg,

(sale_last1M+sale_last2M+sale_last3M)/3
as sale_last3M_avg, 

(sale_last1M+sale_last2M+sale_last3M+ sale_last4M+ sale_last5M+ sale_last6M)/6
as sale_last6M_avg, 

(sale_last1M+sale_last2M+sale_last3M+ sale_last4M+ sale_last5M+ sale_last6M+ sale_last7M+ sale_last8M+ sale_last9M+ sale_last10M+sale_last11M+ sale_last12M)/12
as sale_last12M_avg 

from prj_tc_231640_123409_4l0qvy.ycc_sales_caijun0312_feature_basewindow_shift1M ;
