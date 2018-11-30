--第一个数据集是通过groupby province_id = 1 and city_id = 7 and class_id = 10043  得到，只取前3个数据
--第二个数据集，用销售日期sale_date 针对province_id = 1 and city_id = 7 and class_id = 10043 填充，所有的销售数据为0，取前10个数据
--将两个数据集用UNION合并，就可以得到最终填充后的表，但是奇怪，销售日期的顺序改变了，还不清楚如何解决

select sale_date,province_id,city_id,class_id,sum(sale_quantity_sum) as sale_quantity_sum from
(select sale_date,province_id,city_id,class_id,sum(sale_quantity) as sale_quantity_sum
from  prj_tc_231640_123409_4l0qvy.stuff_caijun0303_sale 
where (province_id = 1 and city_id = 7 and class_id = 10043)
group by sale_date,province_id,city_id,class_id  limit 3
UNION
select sale_date,province_id,city_id,class_id, province_id + city_id - 8 as sale_quantity_sum
from  prj_tc_231640_123409_4l0qvy.stuff_caijun0303_sale 
where (province_id = 1 and city_id = 7 and class_id = 10043)
group by sale_date,province_id,city_id,class_id  limit 10) a 
group by sale_date,province_id,city_id,class_id;