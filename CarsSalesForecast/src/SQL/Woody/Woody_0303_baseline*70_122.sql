-- 查看全国各月总销量
-- select sale_date,sum(sale_quantity)as sum_quantity from prj_tc_231640_123409_4l0qvy.stuff_woody_0302_cleaned_data group by sale_date
-- 查看全国各月总产量
--select produce_date,sum(produce_quantity) as sum_prod_quantity from prj_tc_231640_123409_4l0qvy.yc_passenger_car_yields group by produce_date

-- 分析发现17年12月全国份销量涨幅很大，猜测可能会是因为某种原因提前把1月的销量提前释放

--
--今年12月感觉超量严重，尝试激进的给出baseline*0.7的系数试，由于命名不能是0.7，就改成70，代表70%
--create table if not exists yc_result_submit_a_baseline_70 as select predict_date,province_id,city_id,class_id,predict_quantity*0.7 as predict_quantity from yc_result_submit_a_baseline

--select * from yc_result_submit_a_baseline_70
--select * from prj_tc_231640_123409_4l0qvy.yc_result_submit_a

--尝试删除一张表后，是否可以再建一张相同的表名的表，答案是可以的
--drop table if exists stuff_woody_test
-- create table if not exists stuff_woody_test as select * from yc_result_submit_a_baseline_70

--删除yc_result_submit_a，再新建一个yc_result_submit_a
--drop table if exists yc_result_submit_a
-- create table if not exists yc_result_submit_a as select * from yc_result_submit_a_baseline_70


-- 知道成绩后登陆成绩
-- create table if not exists yc_result_submit_a_baseline_70_122 as select * from yc_result_submit_a_baseline_70
