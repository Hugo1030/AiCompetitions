# Photovoltaic power station rank60 solution

\~ DataFountain Competition [光伏电站人工智能运维大数据处理分析](http://www.datafountain.cn/competitions/303/details/data-evaluation) 项目入口

## 当前目录

    ./
    |- .gitignore
    |- README.md    ~ 总则和文档变化索引
    +- doc
    |   +- Log*     ~> 各自日志
    |   +- _LogTeamRank ~> 团队成绩索引 (使用 _ 前缀来表明是系统内部行为 ;-)
    |   +- How2*    ~> 各种手册
    |   +- *Idea    ~> 各种策略分析
    |   +- ...
    +- ipynb        ~> 探索和原型收集
    +- raw          ~> 关键原始数据收集(注意,由代码生成的中间数据最好别 push 上来)
    |- requirements.txt ~ 依赖模块自动安装声明
    +- src          ~> 可复用的脚本/模块收集

## 项目指北
- [最终代码](https://github.com/Hugo1030/AiCompetitions/blob/master/PhotovoltaicPowerStation/ipynb/lichuan/lichuan_0809_stacked.ipynb)

### 数据清洗
- 清除所有离群点
    - 电压A > 800 | 电压A < 500
    - 电压B > 800 | 电压B < 500
    - 电压C > 800 | 电压C < 500
    - 现场温度 > 30 | 现场温度 < -30
    - 转换效率A > 100
    - 转换效率B > 100
    - 转换效率C > 100
    - 风向 > 360
    - 风速 > 20
- 发现训练集中有很多 0 值点, 结果为 0.379993053, 那么将测试集所有 0 值点改为此数值
- 大于或小于 2 倍标准差, 使用上下均值填充(因为上下顺序是有规律的渐变点)

### 特征工程
- 为了找到数据之间关系, 使用 PolynomialFeatures 类, 暴力做二项式 features
- 除了原有单因子外, 因子两两之间 x, y 寻找关系
- 生成 (x + y)^3 的二项式系数
- 在使用 SelectFromModel 筛选出相关系数较高的特征.

### 建立模型
- 分别使用 xgboost/gbdt/randomforest/lightgbm 并选择 3 种不同参数, 分别预测最终结果

### 模型融合
- 将 xgboost/gbdt/randomforest/lightgbm 训练出来的每 3 种共 12 个模型, 进行 stacking
- 使用 svr 对 12 个模型进行最终筛选
- 使用 5 Flods 交叉验证
- 得到的 stacking 预测结果再和 lightgbm 单独预测结果进行线性融合, 得到最终结果.