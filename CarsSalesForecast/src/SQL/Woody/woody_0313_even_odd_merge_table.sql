

-- 合并销量基础表，思路：日期分成奇数日期和偶数日期表，将奇数日期表和偶数表
-- 通过日期的关系使得相邻的奇偶日期的销量放到一张表
-- 此方法前提是奇数日期表和偶数日期表的行数一样
create table if not exists woody_0313_base_even as select
sale_date,province_id,city_id,class_id,sale_quantity,year,month from ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m
where (sale_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710,201712));

create table if not exists woody_0313_base_odd as select
sale_date,province_id,city_id,class_id ,sale_quantity,year,month from ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m
where (sale_date in (201201,201203,201205,201207,201209,201211,201301,201303,201305,201307,201309,201311,201401,201403,201405,201407,201409,201411,201501,201503,201505,201507,201509,201511,201601,201603,201605,201607,201609,201611,201701,201703,201705,201707,201709,201711));
--合并奇数和偶数表
create table if not exists woody_0313_base_mix as select
a.sale_date,a.province_id,a.city_id,a.class_id,a.sale_quantity as sale_quantity_even ,b.sale_quantity as sale_quantity_odd , b.sale_date as sale_date_odd
from (select * from woody_0313_base_even) a
join (select * from woody_0313_base_odd) b
on (a.year=b.year and a.month=(b.month+1) and a.city_id=b.city_id and a.class_id=b.class_id );

--测试开始，主要测试insert into和case when的用法-------------------------------------
create table if not exists woody_0313_mix_test1  as select * from woody_0313_base_mix limit 100;
create table if not exists woody_0313_2018_test1 as select
sale_date,province_id,city_id,class_id ,sale_quantity sale_quantity_even,sale_quantity sale_quantity_odd from ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m
where (sale_date =201801) limit 20;
select * from woody_0313_2018_test1;
select * from woody_0313_mix_test1;

insert into table woody_0313_mix_test1
select sale_date,province_id,city_id,class_id ,sale_quantity_even,sale_quantity_odd,sale_date
from  woody_0313_2018_test1;
select * from woody_0313_mix_test1;

select * from woody_0313_2018_test1
insert into table woody_0313_mix_test1
select case when (sale_date='201801') then 201802
end as sale_date,province_id,city_id,class_id ,sale_quantity_even,sale_quantity_odd,sale_date
from woody_0313_2018_test1;
select * from woody_0313_mix_test1;

--测试结束----------------------------------------------------------------
-- 备份一张表，毕竟insert to 以防万一
create table if not exists woody_0313_base_mix_2018 as select * from woody_0313_base_mix;
-- 需要把201801的数据和201802合并的数据也放进大表里
create table if not exists woody_0313_2018_1 as select
sale_date,province_id,city_id,class_id ,sale_quantity sale_quantity_even,sale_quantity sale_quantity_odd from ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m
where (sale_date =201801) ;
-- 由于201801和201802数据一样，直接把201801的日期改成201802就行，销量初始都是0
insert into table woody_0313_base_mix_2018
select case when (sale_date='201801') then 201802
end as sale_date,province_id,city_id,class_id ,sale_quantity_even,sale_quantity_odd,sale_date
from woody_0313_2018_1;
-- 注意end as 之后一定要和case when的字段一样

-- 对于除法来说，需要把分母为0的变为非常大的一个数，最后除下来结果约为0，否则报错
create table if not exists woody_0313_base_mix_2018_change_1 as
select case when (sale_quantity_odd=0) then 1000000
else sale_quantity_odd
end as sale_quantity_odd ,sale_date,province_id,city_id,class_id,sale_quantity_even
from woody_0313_base_mix_2018;
-- 创建销量“和差积商”表
create table if not exists ycc_sales_woody_0313_base_mix_2018_add as
select sale_date,province_id,city_id,class_id ,sale_quantity_even+sale_quantity_odd as sale_quantity_add from woody_0313_base_mix_2018;
create table if not exists ycc_sales_woody_0313_base_mix_2018_minus as
select sale_date,province_id,city_id,class_id ,sale_quantity_even-sale_quantity_odd as sale_quantity_minus from woody_0313_base_mix_2018;
create table if not exists ycc_sales_woody_0313_base_mix_2018_mul as
select sale_date,province_id,city_id,class_id ,sale_quantity_even*sale_quantity_odd as sale_quantity_mul from woody_0313_base_mix_2018;
create table if not exists ycc_sales_woody_0313_base_mix_2018_div as
select sale_date,province_id,city_id,class_id ,sale_quantity_even/sale_quantity_odd as sale_quantity_div from woody_0313_base_mix_2018_change_1;
--------------------------------------------------完成销量合并两月日期基础表----------------------------------------

--------------------------------------------------开始产量合并两月日期基础表----------------------------------------
--产量的表的特点就是，奇数日期和偶数日期的class_id 不一定一致，思路是将奇数日期和偶数日期class_id 做成一致的
--也就是取全部class_id,缺省值为0
-- 找到一张有全部日期和class_id 的表，然后和哪张表一匹配，把产量和class_id 带上，就和上面的销量处理方式一样了

select * from yc_passenger_car_yields ;
--找到了一张表，然后按照sale_date ,class_id排序过滤，检查一下，发现可以
select a.count(*) from (select sale_date ,class_id from woody_0313_base_mix_2018 group by sale_date ,class_id) a;
--创建有全class_id 和全日期的表
create table if not exists woody_0313_base_produce_1 as select sale_date ,class_id from ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m group by sale_date ,class_id;
-- 将产量表和刚创建的全class_id表join，并且把日期置改名为产量日期，这样原来的产量日期可以去掉了，因为
-- join之后原来产量日期有null值
create table if not exists woody_0313_base_produce_2 as
select a.sale_date as produce_date,a.class_id ,b.produce_quantity from woody_0313_base_produce_1 a
left outer join yc_passenger_car_yields b
on a.sale_date=b.produce_date and a.class_id =b.class_id ;

--将匹配之后的产量是NULL的值改为0，方便之后的计算
create table if not exists woody_0313_base_produce_3 as
select case when produce_quantity is null
then 0
else produce_quantity
end as produce_quantity, produce_date,class_id
from woody_0313_base_produce_2;

--这之后和销量的方法一样，建一张偶数日期表
create table if not exists woody_0313_base_produce_even as select
produce_date,class_id,produce_quantity from woody_0313_base_produce_3
where (produce_date in (201202,201204,201206,201208,201210,201212,201302,201304,201306,201308,201310,201312,201402,201404,201406,201408,201410,201412,201502,201504,201506,201508,201510,201512,201602,201604,201606,201608,201610,201612,201702,201704,201706,201708,201710,201712));
-- 一张奇数日期表
create table if not exists woody_0313_base_produce_odd as select
produce_date,class_id,produce_quantity from woody_0313_base_produce_3
where (produce_date in (201201,201203,201205,201207,201209,201211,201301,201303,201305,201307,201309,201311,201401,201403,201405,201407,201409,201411,201501,201503,201505,201507,201509,201511,201601,201603,201605,201607,201609,201611,201701,201703,201705,201707,201709,201711));
-- 合并两个表的日期和销量
create table if not exists woody_0313_base_produce_mix as
select
a.produce_date,a.class_id,a.produce_quantity as produce_quantity_even ,b.produce_quantity as produce_quantity_odd , b.produce_date as produce_date_odd
from (select * from woody_0313_base_produce_even) a
join (select * from woody_0313_base_produce_odd) b
on (a.produce_date=b.produce_date+1 and a.class_id=b.class_id );
--备份一张表，因为需要insert
create table if not exists woody_0313_base_produce_mix_2018 as select * from woody_0313_base_produce_mix;
-- 把1801和1802的数据也做进来
create table if not exists woody_0313_2018_produce_1 as select
produce_date,class_id ,produce_quantity as produce_quantity_even, produce_quantity as produce_quantity_odd from woody_0313_base_produce_3
where (produce_date =201801);
select * from woody_0313_2018_produce_1;
-- 将1801日期该为1802
insert into table woody_0313_base_produce_mix_2018
select case when (produce_date='201801') then 201802
end as produce_date,class_id ,produce_quantity_even,produce_quantity_odd,produce_date
from woody_0313_2018_produce_1;

-- 为除法表分母为0的数据处理
create table if not exists woody_0313_base_mix_2018_produce_change_1 as
select case when (produce_quantity_odd=0) then 1000000
else produce_quantity_odd
end as produce_quantity_odd,produce_date,class_id,produce_quantity_even
from woody_0313_base_produce_mix_2018;

-- 创建成功
create table if not exists ycc_sales_woody_0313_base_produce_mix_2018_add as
select produce_date,class_id,produce_quantity_even+produce_quantity_odd as produce_quantity from woody_0313_base_produce_mix_2018;

create table if not exists ycc_sales_woody_0313_base_produce_mix_2018_minus as
select produce_date,class_id,produce_quantity_even-produce_quantity_odd as produce_quantity from woody_0313_base_produce_mix_2018;

create table if not exists ycc_sales_woody_0313_base_produce_mix_2018_mul as
select produce_date,class_id,produce_quantity_even*produce_quantity_odd as produce_quantity from woody_0313_base_produce_mix_2018;

create table if not exists ycc_sales_woody_0313_base_produce_mix_2018_div as
select produce_date,class_id,produce_quantity_even/produce_quantity_odd as produce_quantity  from woody_0313_base_mix_2018_produce_change_1;

-- 交付
--<=yc_passenger_car_yields
--<=ycc_sales_lichuan0312_feature_16_produce_quantity_shift1m
--=>ycc_sales_woody_0313_base_produce_mix_2018_add
--=>ycc_sales_woody_0313_base_produce_mix_2018_minus
--=>ycc_sales_woody_0313_base_produce_mix_2018_mul
--=>ycc_sales_woody_0313_base_produce_mix_2018_div
------------------------------完成产量日期合并任务-------------------------------------

------合并两种日期相邻，但city_id+class_id 不同的的表，而且不能有没有出现的class_id----------------------------
---说白了就是求并集的过程---------------
----用到UNION ALL方式，DataWorks貌似没有提供UNION 方法，以下tmp不能省略
SELECT * FROM (SELECT * FROM A UNION ALL SELECT * FROM B) tmp
-------------测试UNION ALL-----------------------------
create table if not exists woody_0313_0801_test as select * from yc_result_sample_a limit 200;
create table if not exists woody_0313_0802_test as select * from yc_result_sample_b limit 200;

select count(distinct class_id) from  woody_0313_0801_test;
select count(distinct class_id) from  woody_0313_0802_test;
----------建表取得并集，并且是-------
create table if not exists  woody_0313_0801_test_union as
SELECT province_id,city_id,class_id FROM (SELECT * FROM woody_0313_0801_test UNION ALL SELECT * FROM woody_0313_0802_test) tmp group by province_id,city_id,class_id ;
--测试改增加列
ALTER TABLE table_name ADD COLUMNS (col_name1 type1, col_name2 type2...)
alter table woody_0313_0801_test_union add columns (sale_date string ,sale_quantity bigint );
--将新增列sale_date 改为201802----------------------
select case when sale_date is null
then 201802
else sale_date
end as sale_date,province_id,city_id,class_id,sale_quantity
from woody_0313_0801_test_union;
--------------------测试完成-------------------------------------

--------------------一次性创建-------------------------------
create table if not exists  woody_0313_1801_1802_union_temp as
SELECT province_id,city_id,class_id FROM (SELECT * FROM yc_result_sample_a limit UNION ALL SELECT * FROM yc_result_sample_b ) tmp group by province_id,city_id,class_id ;

alter table woody_0313_1801_1802_union_temp add columns (sale_date string ,sale_quantity bigint );

create table if not exists woody_0313_1801_1802_union as
select case when sale_date is null
then 201802
else sale_date
end as sale_date,province_id,city_id,class_id,sale_quantity
from woody_0313_1801_1802_union_temp;
select count(*) from woody_0313_1801_1802_union;
select * from woody_0313_1801_1802_union;
