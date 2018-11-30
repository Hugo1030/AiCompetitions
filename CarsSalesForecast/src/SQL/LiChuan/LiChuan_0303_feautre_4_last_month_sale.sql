DROP TABLE IF EXISTS ycc_sales_lichuan0304_feature_4_last_month_sale;

CREATE TABLE ycc_sales_lichuan0304_feature_4_last_month_sale
AS
SELECT  _stuff_ycc_sales_lichuan0304_datetime.sale_date       
        ,_stuff_ycc_sales_lichuan0304_datetime.province_id
        , _stuff_ycc_sales_lichuan0304_datetime.city_id
        , _stuff_ycc_sales_lichuan0304_datetime.class_id
        , _stuff_ycc_sales_lichuan0304_datetime.sale_quantity
        , _stuff_ycc_sales_lichuan0304_month_plusone.last_month_sale_quantity
FROM _stuff_ycc_sales_lichuan0304_datetime
LEFT OUTER JOIN _stuff_ycc_sales_lichuan0304_month_plusone
ON _stuff_ycc_sales_lichuan0304_datetime.sale_date = _stuff_ycc_sales_lichuan0304_month_plusone.sale_date
and stuff_ycc_sales_lichuan0304_datetime.city_id = _stuff_ycc_sales_lichuan0304_month_plusone.city_id
and stuff_ycc_sales_lichuan0304_datetime.class_id = _stuff_ycc_sales_lichuan0304_month_plusone.class_id