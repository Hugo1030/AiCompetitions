## S2b榜算法陈述
## 时间窗口特征
### why
本次比赛需要预测的销量数据,和时间具备很强的关联系,下面举几个例子

- 一辆车的当月销量肯定会受前几个月销量的影响,前几个月热卖的车型和销售清淡的车型相比,当月销量更多的概率会大一些,但是具体和前面哪几个月销量更相关,不得而知,需要模型自行学习探索

- 通过分析初赛盐城销量的数据,在一年内,销量也会呈现一些规律,比如到了年末,销售量都会大涨,这可能和年末大家都陆续拿到了年终奖,手头有更多可用资金买车有关系

- 春节期间的销量一般都会是一年的销售低谷,这和过年前的销售旺季以及春节长假都有关系

### what
为了让模型学会上述的时间规律以及更多未知的时间规律,我们提取了以下时间窗口特征

- 上1个月,上2个月,上3个月... 上12个月的单月销量sale_last1m,sale_last2m,sale_last3m,sale_last4m,sale_last5m,sale_last6m,sale_last7m,sale_last8m,sale_last8m,sale_last10m,sale_last11m,sale_last12m

- 上2个月,上3个月,上6个月和上12个月的销量和sale_last2m_sum,sale_last3m_sum,sale_last6m_sum,sale_last12m_sum

- 上2个月,上3个月,上6个月和上12个月的平均销量sale_last2m_avg,sale_last3m_avg,sale_last6m_avg,sale_last12m_avg

- 上2个月,上3个月,上6个月和上12个月销量的标准差sale_last2m_std,sale_last3m_std,sale_last6m_std,sale_last12m_std

- 上2个月,上3个月,上6个月和上12个月销量的最大值sale_last2m_max,sale_last3m_max,sale_last6m_max,sale_last12m_max

- 上2个月,上3个月,上6个月和上12个月销量的最小值sale_last2m_min,sale_last3m_min,sale_last6m_min,sale_last12m_min


### how
以下为时间窗口特征的代码执行流,流格式为

> sql文件    
> <= 输入表    
> =>输出表    

> 上1个月,上2个月,上3个月... 上12个月的单月销量caijun_0313_feature_1_basewindow.sql    
> <= ycc_sales_lichuan0313_traintest_method1     
> => ycc_sales_caijun0313_feature_basewindow    
>     
> 上2个月,上3个月,上6个月和上12个月的的平均销量    
> caijun_0313_feature_1_avg_2m3m6m12m.sql    
> <= ycc_sales_caijun0313_feature_basewindow     
> => ycc_sales_caijun0313_feature_avg_2m3m6m12m    
>     
> 上2个月,上3个月,上6个月和上12个月销量的标准差    
> caijun_0313_feature_1_std_2m3m6m12m.sql    
> <= ycc_sales_caijun0313_feature_basewindow     
> => ycc_sales_caijun0313_feature_std_2m3m6m12m    
>     
> 上2个月,上3个月,上6个月和上12个月的销量和    
> caijun_0313_feature_1_sum_2m3m6m12m.sql    
> <= ycc_sales_caijun0313_feature_basewindow     
> => ycc_sales_caijun0313_feature_sum_2m3m6m12m    
>     
> 上2个月,上3个月,上6个月和上12个月销量的最小值caijun_0313_feature_1_min_2m3m6m12m.sql    
> <= ycc_sales_caijun0313_feature_basewindow     
> => stuff_ycc_sales_caijun0313_feature_min_2m3m6m12m    
>     
> 上2个月,上3个月,上6个月和上12个月销量的最大值caijun_0313_feature_1_max_2m3m6m12m.sql    
> <= ycc_sales_caijun0313_feature_basewindow     
> => stuff_ycc_sales_caijun0313_feature_max_2m3m6m12m    

### where 

时间窗口特征sql文件存储在脚本文件/CAIJUN/time_window文件内

![](https://ws3.sinaimg.cn/large/006tNbRwgy1fpdngyzw7ej30e00d5myj.jpg)

### result

通过gbdt模型分析特征重要性,可以看到sale__last12m_sum,max12m和sale_last6m_sum等时间窗口特征权重都非常高

![](https://ws2.sinaimg.cn/large/006tNbRwgy1fpdtr9531rj30f20g0q53.jpg)

### 时间窗口特征提取注意点

#### 如何获得所有车型上n个月的销量
获取所有车型上n个月的销量,使用SQL语言最方便的实现方式是调用lag偏移函数
```
lag(sale_quantity,1)over(partition by province_id,city_id,class_id order by sale_date) as sale_last1M

```

#### 按照时间顺序补全训练集
使用lag函数的前提,是所有车型按照时间顺序排列,但是实际数据集存在非常多的空值,无法直接使用lag,所以需要按照sale_date/province_id/city_id/class_id 轮转的方式将训练集补齐

