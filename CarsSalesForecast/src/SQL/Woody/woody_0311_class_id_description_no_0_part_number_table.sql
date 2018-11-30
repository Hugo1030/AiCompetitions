
--create table if not exists  stuff_woody_0311_part_num   as select * from ycc_sales_lichuan0309_traintest_2_max_min;
--训练集分别201301-201709，201302-201710，201303-201711
-- stuff_woody_0311_part_num_1301_1709_train
-- stuff_woody_0311_part_num_1302_1710_train
-- stuff_woody_0311_part_num_1303_1711_train
-- stuff_woody_0311_part_num_1301_1713_train
-- 测试集合分别是201710，201711，201713
-- stuff_woody_0311_part_num_1710_test
-- stuff_woody_0311_part_num_1711_test
-- stuff_woody_0311_part_num_1713_test
-- 预测集
-- stuff_woody_0311_part_num_1801_predict

create table if not exists stuff_woody_0311_part_num_1301_1709_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201712,201711,201710,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_part_num_1302_1710_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201712,201711,201301,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212) );

create table if not exists stuff_woody_0311_part_num_1303_1711_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201712,201302,201301,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_part_num_1301_1712_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201201,201202,201203,201204,201205,201206,201207,201208,201209,201210,201211,201212));

create table if not exists stuff_woody_0311_part_num_1201_1709_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201712,201711,201710));
create table if not exists stuff_woody_0311_part_num_1202_1710_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201712,201711,201201));
create table if not exists stuff_woody_0311_part_num_1203_1711_train
as select * from stuff_woody_0311_part_num
where (sale_date not in (201801,201712,201202,201201));
create table if not exists stuff_woody_0311_part_num_1201_1712_train
as select * from stuff_woody_0311_part_num
where (sale_date !=201801);

create table if not exists stuff_woody_0311_part_num_1710_test
as select * from stuff_woody_0311_part_num
where (sale_date=201710);

create table if not exists stuff_woody_0311_part_num_1711_test
as select * from stuff_woody_0311_part_num
where (sale_date=201711);

create table if not exists stuff_woody_0311_part_num_1712_test
as select * from stuff_woody_0311_part_num
where (sale_date=201712);

create table if not exists stuff_woody_0311_part_num_1801_predict
as select * from stuff_woody_0311_part_num
where (sale_date=201801);
