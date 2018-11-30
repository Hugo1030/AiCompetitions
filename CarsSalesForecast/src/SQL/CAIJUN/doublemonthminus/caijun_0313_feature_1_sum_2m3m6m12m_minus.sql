-- CHNAGELOH: 
--      18.3.6 caijun init.
--      <= ycc_sales_caijun0313_feature_basewindow_minus 
--      => ycc_sales_caijun0313_feature_sum_2m3m6m12m_minus
--  

DROP TABLE IF EXISTS ycc_sales_caijun0313_feature_sum_2m3m6m12m_minus ;
CREATE TABLE ycc_sales_caijun0313_feature_sum_2m3m6m12m_minus
as
select sale_date,province_id,city_id,class_id,sale_quantity,

sale_last1M+sale_last2M
as sale_last2M_sum,

sale_last1M+sale_last2M+sale_last3M
as sale_last3M_sum, 

sale_last1M+sale_last2M+sale_last3M+ sale_last4M+ sale_last5M+ sale_last6M
as sale_last6M_sum,

sale_last1M+sale_last2M+sale_last3M+ sale_last4M+ sale_last5M+ sale_last6M+ sale_last7M+ sale_last8M+ sale_last9M+ sale_last10M+sale_last11M+ sale_last12M
as sale_last12M_sum 

from prj_tc_231640_123409_4l0qvy.ycc_sales_caijun0313_feature_basewindow_minus ;
