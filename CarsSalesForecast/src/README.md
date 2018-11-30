# 复用代码收集入口 
~ 积累可独立运行/引用的常用处置/能力...


## src 收录原则:

0. 凡是追加模块/脚本进入 src 目录, 一定要增补 README 文档
1. 固定的作者前缀, 比如 zq_*.py 
2. 单一的功能内容, 每个模块/脚本 只完成一件常用数据处理, 并在文件名上有确切的体现
3. modules 收集功能模块, src 根目录收集业务处理脚本,vendors 收集其它第3方模块, api配合static 发布内部网站(当前没必要使用) 


## 目录说明:

```
/
|- README.md                    本文
+- _yancheng4lichuan            沥川 yancheng 竞赛脚本
+- api                          可以的接口网站
+- modules                      自制模块入口
+- static                       可能的静态资源 图片/CSS ..
\- vendors                      依赖的第三方模块
```


## 盐城比赛:
> DAMA's flow

数据清理+基础特征:

    ༄  python YCa0dclean_features.py ../raw/CarsSaleForecast/ ../raw/ZQ/dclean0224features.csv
    [DEBUG]17:36:11:__main__(35): load LOG level
    [DEBUG]17:36:12:modules.FeatureDraw(33): load LOG level
    v18.2.24.1542
    ...


         归化:cylinder_number
         归化:rated_passenger
    输出为:../raw/ZQ/dclean0224features.csv

销量特征+特征集滚装:

    ༄  python YCa1trainsets_gen.py 
    生成统一训练集
            Usage:
    $ YCa1trainsets_gen.py path/2/原始数据目录 path/2/清洁数据集 [新数据集前缀 zq225]
        e.g
    $ YCa1trainsets_gen.py ../raw/CarsSaleForecast/ ../raw/ZQ/dclean0224features.csv ZQ225

    ༄  python YCa1trainsets_gen.py ../raw/CarsSaleForecast/ ../raw/ZQ/dclean0225features.csv ZQ225
    [DEBUG]16:55:16:__main__(36): load LOG level
    v18.2.25.1642

    ...

     安装 2013~17 销售量
    训练集尺寸:(5587, 5)
    特征集尺寸:(140, 175)
    输出训练集:../raw/ZQ/ZQ225_train_sets.csv
    输出特征集:../raw/ZQ/ZQ225_features.csv


特征集时间窗口追滚:


    ༄  python YCa2timewin_sets.py
    v18.2.25.2442
    追加时间窗口训练集
            Usage:
    $ YCa2timewin_sets.py path/2/目标训练集 path/2/特征增强数据集 [新数据集前缀 zq225]
        e.g
    $ YCa2timewin_sets.py ../raw/CarsSaleForecast/ ../raw/ZQ/train0224features.csv ZQ225

    ༄  python YCa2timewin_sets.py ../raw/ZQ/train0224sets.csv ../raw/ZQ/ZQ225_features.csv ZQ225
    [DEBUG]00:41:43:__main__(36): load LOG level
    [DEBUG]00:41:44:modules.FeatureDraw(33): load LOG level
    v18.2.24.2442
    [INFO]00:41:44:__main__(84): ../raw/ZQ/LCh1_trainSaleDatetest.csv
    [DEBUG]00:41:44:__main__(90): ../raw/ZQ/train0224twin.csv
    之前训练集尺寸 :   (9800, 165)
    之前特征集尺寸 :   (140, 178)
    有效月度累计:71月
    进入训练集尺寸 :   (9940, 184)
    range(0, 2)
         时窗 轮算尺寸:2月
    sale_cal_mix 滚次:69
    *
    (140, 8)
     *
    (280, 8)
      *
    (420, 8)
       *
    ...

    安装特征集尺寸 :   (8260, 8)
    当前训练集尺寸 :   (9800, 189)
         Duration:169.068s
    输出训练集:../raw/ZQ/zq225_timewin.csv
    输出训练集:../raw/ZQ/zq225_timewin_decay.csv
         Duration:172.330s

其中在前述基础训练集上:

- 追加 2/3/6/12月窗口的 sum/max/min/mean/median/std 数据:
    + ../raw/ZQ/train0224twin.csv
- 追加 2/3/6/12月窗口的 sum/max/min/mean/median/std 数据,逐月 90% 累加减少:
    + ../raw/ZQ/train0224twin_decay.csv


..
> LiChuan's flow

### 18.2.24 DAMA review

复制并修订对应路径

> 运行: 
$ python LCh1saledata.py

获得:

- raw/ZQ/
    + LCh1_test_featuretest.csv
    + LCh1_trainSaleDatetest.csv

其中: LCh1_trainSaleDatetest.csv
检测:

_tmp = train.loc[:,['class_id','sale_date','sale_quantity']]
print(_tmp[_tmp.class_id == 2])

...


      class_id  sale_date  sale_quantity
119        2.0        0.0            0.0
259        2.0        0.0            0.0
399        2.0        0.0            0.0
539        2.0        0.0            0.0
679        2.0        0.0            0.0
...

明确有 class_id 为 2 的数据项...

--> ipynb/caijun/caijun0225bugfix.ipynb 追查明确,
并升级对应代码



