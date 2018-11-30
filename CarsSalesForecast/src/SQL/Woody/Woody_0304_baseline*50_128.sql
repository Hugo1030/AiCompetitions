--create table if not exists yc_result_submit_a_baseline_50 as select predict_date,province_id,city_id,class_id,predict_quantity*0.5 as predict_quantity from yc_result_submit_a_baseline

--select * from yc_result_submit_a_baseline_50
--select * from prj_tc_231640_123409_4l0qvy.yc_result_submit_a

--删除yc_result_submit_a，再新建一个yc_result_submit_a
--drop table if exists yc_result_submit_a
-- create table if not exists yc_result_submit_a as select * from yc_result_submit_a_baseline_50
--
--select * from yc_result_submit_a 
