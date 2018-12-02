# FasionAI rank39/2950 solution
\~ 天池大赛 [FasionAI 全球挑战赛](https://tianchi.aliyun.com/competition/introduction.htm?spm=5176.100066.0.0.6acd33aft1JqW3&raceId=231649) 项目入口

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
    +- raw          ~> 关键原始数据收集(数十 G 图片未上传)


## 项目指北
- [S1 策略说明 + Code](https://github.com/Hugo1030/AiCompetitions/tree/master/fashionai/ipynb/S1_Attribute%2BRank79%2BDu4AI)
- [S2 策略说明 + Code](https://github.com/Hugo1030/AiCompetitions/tree/master/fashionai/ipynb/S2_Attribute%2Brank39%2BDu4AI)
- [基于 SSD 的领口裁剪](https://github.com/Hugo1030/AiCompetitions/tree/master/fashionai/ipynb/S2_Attribute%2Brank39%2BDu4AI/collar_crop)
    - 第一步: 检测人脸
    - 第二步: 定位领口部位
    - 第三步: 进行裁剪