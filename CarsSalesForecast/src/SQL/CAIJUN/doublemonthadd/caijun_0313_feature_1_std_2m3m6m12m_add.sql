-- CHNAGELOH: 
--      18.3.6 caijun init.
--      <= ycc_sales_caijun0313_feature_basewindow_add 
--      => ycc_sales_caijun0313_feature_std_2m3m6m12m_add
--      1.计算标准差所需的平均值
--      2.计算标准差
--计算平均值
DROP TABLE IF EXISTS stuff_ycc_sales_caijun0306_feature_avg_2m3m6m12m ;
CREATE TABLE stuff_ycc_sales_caijun0306_feature_avg_2m3m6m12m
as
select sale_date,province_id,city_id,class_id,sale_quantity,
sale_last1M,sale_last2M,sale_last3M,sale_last4M,sale_last5M,sale_last6M,
sale_last7M,sale_last8M, sale_last9M,sale_last10M,sale_last11M,sale_last12M,
(sale_last1M+sale_last2M)/2
as sale_last2M_avg,

(sale_last1M+sale_last2M+sale_last3M)/3
as sale_last3M_avg, 

(sale_last1M+sale_last2M+sale_last3M+ sale_last4M+ sale_last5M+ sale_last6M)/6
as sale_last6M_avg, 

(sale_last1M+sale_last2M+sale_last3M+ sale_last4M+ sale_last5M+ sale_last6M+ sale_last7M+ sale_last8M+ sale_last9M+ sale_last10M+sale_last11M+ sale_last12M)/12
as sale_last12M_avg 

from prj_tc_231640_123409_4l0qvy.ycc_sales_caijun0313_feature_basewindow_add ;



--计算标准差
DROP TABLE IF EXISTS ycc_sales_caijun0313_feature_std_2m3m6m12m_add ;
CREATE TABLE ycc_sales_caijun0313_feature_std_2m3m6m12m_add
as
select sale_date,province_id,city_id,class_id,sale_quantity,

sqrt((pow(sale_last1M-sale_last2M_avg,2)+pow(sale_last2M-sale_last2M_avg,2))/2) 
as sale_last2M_std,

sqrt((pow(sale_last1M-sale_last3M_avg,2)+pow(sale_last2M-sale_last3M_avg,2)+pow(sale_last3M-sale_last3M_avg,2))/3) 
as sale_last3M_std,

sqrt((pow(sale_last1M-sale_last6M_avg,2)+pow(sale_last2M-sale_last6M_avg,2)+pow(sale_last3M-sale_last6M_avg,2)+pow(sale_last4M-sale_last6M_avg,2)+pow(sale_last5M-sale_last6M_avg,2)+pow(sale_last6M-sale_last6M_avg,2))/6) 
as sale_last6M_std,

sqrt((pow(sale_last1M-sale_last12M_avg,2)+pow(sale_last2M-sale_last12M_avg,2)+pow(sale_last3M-sale_last12M_avg,2)+pow(sale_last4M-sale_last12M_avg,2)+pow(sale_last5M-sale_last12M_avg,2)+pow(sale_last6M-sale_last12M_avg,2)+pow(sale_last7M-sale_last12M_avg,2)+pow(sale_last8M-sale_last12M_avg,2)+pow(sale_last9M-sale_last12M_avg,2)+pow(sale_last10M-sale_last12M_avg,2)+pow(sale_last11M-sale_last12M_avg,2)+pow(sale_last12M-sale_last12M_avg,2))/12) 
as sale_last12M_std

from stuff_ycc_sales_caijun0306_feature_avg_2m3m6m12m
