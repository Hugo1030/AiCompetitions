-- dclean_1_reorder_fields
-- 构建去重目标数据表:
-- => ycc_sales_dama0302_dclean_8_reorder_fields
-- => Size: 142916304 

CREATE TABLE IF NOT EXISTS 
    ycc_sales_dama0302_dclean_8_reorder_fields
AS SELECT
    sale_date, province_id, city_id, class_id, sale_quantity
    ,brand_id, car_height, car_length, car_width, compartment
    , cylinder_number, department_id, displacement, driven_type_id
    , emission_standards_id, equipment_quality, front_track
    , fuel_type_id, gearbox_type, if_charging, if_luxurious_id
    , if_mpv_id, level_id, newenergy_type_id, power
    , price_level, rated_passenger, rear_track, total_quality
    , tr, type_id, wheelbase
    
FROM ycc_sales_dama0302_dclean_0_killnull
DISTRIBUTE BY   class_id 
SORT BY         class_id

;
