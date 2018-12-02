# LiChuan
> S16E51

## DONE
- [x] [FashionAI 天池竞赛](https://github.com/DebugUself/du4proto/tree/DU4ai)

## Planning
- 放弃继续参加天池竞赛, 转向 Kaggle 比赛, 原因:
    - 国内比赛, 交流/开放氛围很差, 多数团队不会开放自己代码, 很难从别人的身上学习
    - 组委会会对参赛选手更多限制, 比如复赛阶段, 使用某种平台和某种语言, 并且要求提交代码和模型等等, 不利于跨平台经验积累与复用
    - Kaggle 交流讨论氛围更开放/友善, 能够快速吸收别人的经验快速提高.
    - 如果想要拿大厂 offer, 国内比赛好的成绩将会更有帮助
    - 如果想要找到学习的乐趣, 迅速提高能力, 交流和大时间周期做一件事, Kaggle 是更好的选择
- [Home Credit Default Risk](https://www.kaggle.com/c/home-credit-default-risk#description) 竞赛流程
    - [x] 仔细阅读赛题描述和数据说明, 以及评价指标(Auc)
    - [x] 拿出一个屎版 Baseline, 自己做
    - [x] 浏览全部 Kernel 及 Discuss 了解现有阶段, 大家的进展情况
    - [ ] 寻找近期类似比赛, 及优胜解决方案
    - [x] 阅读相关论文, 确认自己没有错过最新进展
        - [x] LightGBM 论文
        - [x] XGBoost 论文
    - [x] 数据分析, 和划分准确的线下验证集(val_set)
    - [x] 数据预处理, 特征工程, 训练模型
        - [x]热力图相关性研究
        - [x]贝叶斯超参数选取研究
    - [ ] 结果分析, 错误分析, 及 [hard example](https://zhidao.baidu.com/question/715345609253300085.html) 将错误放入负例
    - [ ] 根据结果分析从新设计模型, 解决问题
    - [x] 模型融合
        - [x] xgb 和 lightgbm 融合一波

## Reference
- [6次Kaggle计算机视觉类比赛赛后感](https://zhuanlan.zhihu.com/p/37663895)
- [Profiling Top Kagglers: Bestfitting, Currently #1 in the World](http://blog.kaggle.com/2018/05/07/profiling-top-kagglers-bestfitting-currently-1-in-the-world/)
- [LightGBM_with_Simple_Features](https://www.kaggle.com/ogrellier/fork-lightgbm-with-simple-features/code)
- [Home Credit Default Risk Extensive EDA](https://www.kaggle.com/gpreda/home-credit-default-risk-extensive-eda)
- [29.6. contextlib — Utilities for with-statement contexts](https://docs.python.org/3/library/contextlib.html)
- [Python装饰器学习（九步入门）](http://www.cnblogs.com/rhcad/archive/2011/12/21/2295507.html)
- [pandas.get_dummies](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.get_dummies.html)
- [LightGBM_with_Simple_Features](https://www.kaggle.com/ogrellier/fork-lightgbm-with-simple-features/code)
- [LightGBM: A Highly Efficient Gradient Boosting
Decision Tree](https://papers.nips.cc/paper/6907-lightgbm-a-highly-efficient-gradient-boosting-decision-tree.pdf)
- [XGBoost: A Scalable Tree Boosting System](https://arxiv.org/abs/1603.02754)

## Changelog
- 18.7.14
    - 想要知道是否放贷, 需要知道用户的哪些信息, 哪些信息更加重要
    - 数据是关键, 而不是算法.
- 18.7.10
    - 2.3 Shrinkage and Column Subsampling
        - 两种技术来防止过拟合
        - 第一种是收缩
        - 收缩减少了每棵树的影响, 为未来的树木留下了空间来改善空间
        - 第二种方法是 column subsampling, 在随机森林算法中运用到
- 18.7.9
    - 2.1 Regularized Learning Objective
        - 直观地, 正则化目标将倾向于选择一个使用简单和预测函数的模型
        - 当正则化参数设置为零时, 目标返回到传统的梯度树增强。
    - 2.2 Gradient Tree Boosting
- 18.7.8
    - - [XGBoost: A Scalable Tree Boosting System](https://arxiv.org/abs/1603.02754)
    - ABSTRACT
        - 树提升是一个广泛使用且有效的机器学习方法.
        - XGBoost 是一种可伸缩的树提升系统
        - 关键词 Large-scale Machine Learning
    - 1. INTRODUCTION
        - 机器学习和数据驱动在很多地方都变得非常重要.
        - 有两个重要的原因让 ML 更好用: 一个是算法的提升, 一个是大数据的运用
        - 树提升的一些运用, 还有 XGBoost 取得的一些成绩
        - XGBoost 成功背后最重要的因素是它在所有场景中的可伸缩性
        - 一些新技术包括
            - 一种新的树学习算法, 用于处理稀疏数据;
            - 并行计算
            - 允许数据科学家处理大数据
        - 这篇论文主要贡献
            - 我们设计和构建了一个高度可伸缩的端到端树提升系统
            - 提出一种权重计算草图
            - 介绍了一种新的基于稀疏感知的并行树学习算法。
            - 提出一个有效的缓存块结构.
    - 2. TREE BOOSTING IN A NUTSHELL
        - 
- 18.7.7
    - 3.2 Theoretical Analysis
        - 首先, 我们根据他们的梯度的绝对值在降序排列训练事例
        - 其次, 我们保持顶部-一个 x 100% 实例与更大的渐变和得到一个实例子集 a
        - 然后, 对于剩余的集合 A^c 组成 (1 − A) x 100% 实例以更小的梯度, 我们进一步随机抽样的子集 b 与大小 b x |A^c |;
        - 最后, 我们根据估计方差增益˜V (d) 在子集 A ∪ B 上分割实例
    - 4 Exclusive Feature Bundling
        - 高维数据通常非常稀疏。
        - 在稀疏特征空间中, 许多特征是互斥的
        - 它们从不同时取非零值。
        - 我们可以将独占功能安全地捆绑到一个功能中 feautre => bundle
    - 5 Experiments
        - 速度比 xgb 快 10 倍
        - AUC 比 xgb 多一点点
- 18.7.6
    - zoe
    ```
    说到这个其实我上信息分析课也有这感觉，
    如果只是跟着课程走，其实就是它说什么你做什么，那很简单，作业一下就做完了。
    但是如果不学课程直接开做，回头才会真正发现课程里到底有什么讲的好的地方。
    好多编程课也类似，跟着教程一步步的，他说什么你做什么，做个项目下来感觉很简单。
    但是自己先做，再对比他做的思路，就会发现自己好多没想到的点。
    之前觉得项目简单那都是幻觉，只是因为别人给自己搭好了脚手架而已。
    ```
    - 不管不顾自己试着做一个 baseline 出来, 然后再看别人的东西很重要.
    - 2.1 GBDT and Its Complexity Analysis
        - GBDT 是决策树的融合模型
        - 每次迭代中, GBDT 通过拟合负梯度来学习决策树
        - GBDT 最大成本在学习决策树, 而决策树最大的成本在找到最佳分支点.
        - 使用 pre-sorted algorithm 来找可能的分支点, 问题是训练速度和存储资源效率太低.
        - 另外一种算法是 histogram-based algorithm, 效率比上面的算法更高, 我们就是基于这个算法上面的优化.
        - histogram-based algorithm 是在 data/feature 两个层面上面的复杂度, 如果我们可以减少这两个方面, 就可以提高效率.
    - 2.2 Related Work
        - 目前, XGBoost 是基于 GBDT 最好的应用
        - 因此, 我们选择 XGBoost 作为 baseline 来进行对比.
        - 减少训练集的数据量大小, 普遍的做法是做下采样.
    - 3 Gradient-based One-Side Sampling
        - 如果一个实例有很小的梯度, 那么说明这个实例的错误很小而且已经训练好了
        - GOSS 使所有实例具有较大的渐变, 并对具有小渐变的实例执行随机抽样。
        - GOSS 为具有小渐变的数据实例引入常量乘数
        - 先对实例按照梯度排序, 选择 top a * 100% 的实例, 同时对剩下的 b * 100% 进行随机下采样
        - 在计算增益的时候, GOSS 放大了小梯度的实例 (1 - a)/b
- 18.7.5
    - GBDT 是常用的 ML 算法, 但是近年来, 在多特征/大数据 问题的兴起, 在效率/准确性上提出了更高的要求
    - 需要对所有数据进行检测才能进行某种程度的增益, 这是此类方法的问题所在.
    - 提出了两种新技术 
        - Gradient-based One-Side Sampling (GOSS) 一种采样手法, 不是随机均匀采样, 而是保持贡献更大梯度的实例, 同时随机丢弃对梯度贡献更小的实例
        - Exclusive Feature Bundling (EFB). 用一种几乎无损的方式来, 减少 feature 的数量.
- 18.7.4
    - [LightGBM: A Highly Efficient Gradient Boosting
Decision Tree](https://papers.nips.cc/paper/6907-lightgbm-a-highly-efficient-gradient-boosting-decision-tree.pdf)
        - 尽管有不少的工程优化 (XGBoost/GBDT/GBRT), 但是在大数据集上, 效率和可伸缩性依旧不好
        - 一个主要原因是, 对于每个特征, 他们需要扫描所有的数据实例, 以估计所有可能的分割点的信息增益, 这是非常耗时的.
        - 为了解决这个问题, 使用了两种新技术 Gradient-based One-Side Sampling (GOSS) and Exclusive Feature Bundling (EFB). 
        - GOSS 可以通过更小的数据量得到相当准确的信息增益估计
        - 使用 EFB 来减少特征数量
        - 达到同样的精确度, 比常规的 GBDT 快 20 倍
- 18.7.3
    - baseline 成绩
        - ![](https://files.slack.com/files-pri/T4TA15GER-FBHT9KDEE/image.png)
        - ![](https://files.slack.com/files-pri/T4TA15GER-FBHTBH718/image.png)
    - display_importances
        - ![](https://files.slack.com/files-pri/T4TA15GER-FBHLR7QKE/image.png)
    - 取出 trainset 和 testset
        ```
        train_df = df[df['TARGET'].notnull()]
        test_df = df[df['TARGET'].isnull()]

        Starting LightGBM. Train shape: (307507, 866), test shape: (48744, 866)
        ```
    - `StratifiedKFold()` 与 `KFold` 区别
        - 采样的方法不同, StratifiedKFold 是分层采样
    - `feats = [f for f in train_df.columns if f not in ['TARGET','SK_ID_CURR','SK_ID_BUREAU','SK_ID_PREV','index']]`
        这样选则出自己想要的 feature, 很方便
- 18.7.2
    - 处理 previous_applications 表格
        - `Previous applications df shape: (338857, 280)`
    - 单独处理 POS_CASH_balance 表格
        - `Pos-cash balance df shape: (337252, 19)`
    - 重复上面的行为, 修正 bug , 然后跑完全部 features
        - 保存到 df.to_csv('./data/train_feature_baseline.csv', index=False)
- 18.7.1
    - 拆开处理完了 bureau and bureau_balance 的表格, 修改一下函数, 测试一下
    - 跑的过程中出现 `ValueError: columns overlap but no suffix specified: Index(['SK_ID_CURR'], dtype='object')`
        - 估计是 Join 出的问题
        - 改成 `df = pd.merge(df, bureau, how='left', on='SK_ID_CURR')` 后正常运转
    - 将处理完毕的表格保存起来?
        - 看到处理整张表格, 只需要 36s, 还是算了, 不要保存太多的中间表格.
    - 将所有 Main() joinerror 全部处理了
    - bureau_balance 表格的关键是 `NEW_RATIO_BURO_` 它是 ACTIVE_ / CLOSED_ 得到的
- 18.6.30
    - `keyerror` 的问题找到了, 原来是 `SK_ID_CURR` 这个不是列, 没办法直接调用
        - `active_agg.columns = pd.Index(['ACTIVE_' + e[0] + "_" + e[1].upper() for e in active_agg.columns.tolist()])` 那么是这句的时候出了问题
        - 细致排查了以后, 发现不是这句的问题, 而是 `active_agg = active.groupby('SK_ID_CURR').agg(num_aggregations)` 这句的时候, SK_ID_CURR 的 key 就消失了
        - [Pandas之容易让人混淆的行选择和列选择](https://www.cnblogs.com/kylinlin/p/5231404.html)
        - 选择多列 `w = fandango[list(range(5))]` 发现在本例无法使用, 继续寻找有没有其他方法?
        - 回想乘用车比赛当中, 如何处理这个问题的, 翻看过去的代码发现, 只用增加一个 `active_agg.reset_index()`就能解决这个问题了
    - `ValueError: columns overlap but no suffix specified: Index(['SK_ID_CURR'], dtype='object')`
        - 合并的时候又出现问题, 说是 Index 重叠
        - join 使用起来不简明, 回看过去代码, 全是用 Merge 来实现, 其实就相当于 SQL 里面的 joinleft
        - 不用 Join 用 merge 更方便 `pd.merge(bureau_agg, active_agg, how='left', on='SK_ID_CURR')`
- 18.6.29
    - 记录的是帮自己未来回忆的东西, 代码只有在整体代码中才有用
    - `df['NEW_INC_PER_CHLD'] = df['AMT_INCOME_TOTAL'] / (1 + df['CNT_CHILDREN'])`
        - 每个孩子的总收入
    - `df['NEW_INC_BY_ORG'] = df['ORGANIZATION_TYPE'].map(inc_by_org)`
        - 使用 map 结合 groupby, 很容易对某些类型进行数值替换
        - 让我想到 titanic 中, 对 Mr/Mrs./Miss 等 title 的替换, 可以用 Map 的方式
        - 非常值得学习.
    - `df['NEW_EMPLOY_TO_BIRTH_RATIO'] = df['DAYS_EMPLOYED'] / df['DAYS_BIRTH']`
        - 上班天数/出生天数的比率, 很巧妙的 Feature, 学到了
    - `pd.factorize(df[bin_feature])` 这个其实针对的是二值编码, 既编码为 0/1, 很好
        - [pandas.factorize](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.factorize.html)
        - 将对象编码成枚举类型
        - 返回值 labels : ndarray | uniques : ndarray, Index, or Categorical
        - 可以用这个直接对 类别型进行编码, 而不需要手动处理
        - 比如 df['FLAG_OWN_CAR'].replace('N', 0, inplace=True) 后面人家果然已经处理了
        - 说明以后自己要全部看完, 才能说别人错了, 才能说改进, 很多时候是自以为是
        - 特别是公开代码, 其他人都没提到, 很有可能是自己的问题, 需要再三核实!
    - 其实并没有针对原始 feature 进行删除操作, 有可能是因为 Lightgbm 或者 XGBoost 有自动选择 feature 的能力!
    - 为什么 `dummy_na= nan_as_category` train/test 不把 nan 作为一个类别, 而其他的要作为一个类别呢?
        - 原因未知, 先等等看
    - 是不是有可能出现内存不足的情况, 如果内存不足, 可以试着使用 Kaggle 的 Kernel.
    - bureau_and_balance
        - `bureau, bureau_cat = one_hot_encoder(bureau, True)`
            - 这里把 Nan 处理成了一个类别
        - `bb_agg = bb.groupby('SK_ID_BUREAU').agg(bb_aggregations)`
            - 现将需要处理的方式做成字典 `bb_aggregations = {'MONTHS_BALANCE': ['min', 'max', 'size']}`
            - 然后使用 agg() 直接进行处理, 太方便了
        - `{**num_aggregations, **cat_aggregations}`
            - 直接将两个 {} 进行合并, 很方便
            - 参考 [Python优雅的合并两个Dict](https://segmentfault.com/a/1190000010567015)
        - `pd.Index()`
            - [pandas.Index](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.Index.html)
            - 直接用来改变 feature 的名称, 非常的方便, 比之前的手动修改方式, 代码减少茫茫多, code 更加简洁优美.
- 18.6.28
    - `docs = [_f for _f in df.columns if 'FLAG_DOC' in _f]`
        -  找到所有 FLAG_DOCUMENT 开头的 feature , 例如: FLAG_DOCUMENT_10
    - `live = [_f for _f in df.columns if ('FLAG_' in _f) & ('FLAG_DOC' not in _f) & ('_FLAG_' not in _f)]`
        - 找到所有已 FLAG_ 开头, 又不是 DOC, 例如: FLAG_CONT_MOBILE
    - `df['DAYS_EMPLOYED'].replace(365243, np.nan, inplace=True)`
        - 将 365243 => nan
    - `inc_by_org = df[['AMT_INCOME_TOTAL', 'ORGANIZATION_TYPE']].groupby('ORGANIZATION_TYPE').median()['AMT_INCOME_TOTAL']`
        - 按照机构类别, 求取总体收入的平均数
    - `df['NEW_DOC_IND_KURT'] = df[docs].kurtosis(axis=1)`
        - 参考 [pandas.DataFrame.kurtosis](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.kurtosis.html)
        - [峰度 Kurtosis](https://en.wikipedia.org/wiki/Kurtosis)
        - FALG_DOCUMENT 的峰度特征
    - 发现 `df[live].sum(axis=1)` 当中 `FLAG_OWN_CAR` 和 `FLAG_OWN_REALTY` 的值是 `Y` 和 `N`, 其余是 0 和 1, 不能直接加总, 所以, 先把 N => 0 | Y => 1
        ```
        df['FLAG_OWN_CAR'].replace('N', 0, inplace=True)
        df['FLAG_OWN_CAR'].replace('Y', 1, inplace=True)
        df['FLAG_OWN_REALTY'].replace('N', 0, inplace=True)
        df['FLAG_OWN_REALTY'].replace('Y', 1, inplace=True)
        ```
        - 这行代码是将 live 的 Feature 进行加总.
    - 
- 18.6.27
    - `KeyError SK_ID_CURR`是什么原因, 需要仔细探索一下, 看样子是在合并的时候找不到 Key 的情况
    - `num_rows = 10000 if debug else None`
        - 当 debug = True 的时候读入 10000 行, 进行小范围验证
        - 当 debug = False 的时候全部读入 `nrows=None`, 很巧妙
    - `df = df.append(test_df).reset_index()`
        - 将 test set 并入 train set 一并进行处理, 且reset index
    - `df = df[df['CODE_GENDER'] != 'XNA']`
        - 去掉 4 个性别未知的数据
    - 参考 [读了 20 年书，才明白什么叫做真正的高效阅读](https://mp.weixin.qq.com/s/G9tdUjQTAisRglCRyBLb_g) 和 [这才是心理学（第9版）](https://book.douban.com/subject/26287453/)
        - 先快速建立一个心里表征, 完成一个 baseline
        - 一点点往前推进, 效率太低了
        - 先运行处一个结果再说
    - 迅速建立心理表征, 用最小成本验证
- 18.6.26
    - 所有的 feature 大致分为两类, 其中一类是类别型, 比如性别/是否拥有车/是否有房产..
    - 另外一类是数值类型, 其余的全是数值类型
    - 首先针对类别型, 进行 one-hot 编码, 这里把 Nan 变成一个类别.
        - 使用 `nan_as_category = True` 来作为参数控制
        - 控制代码, 在 `df = pd.get_dummies(df, columns=categorical_columns, dummy_na=nan_as_category)`
        - 参考 [pandas.get_dummies](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.get_dummies.html)
- 18.6.25
    - 今天开始攻 Baseline, 参考: [LightGBM_with_Simple_Features](https://www.kaggle.com/ogrellier/fork-lightgbm-with-simple-features/code)
    - `@contextlib.contextmanager` 的用法 [29.6. contextlib — Utilities for with-statement contexts](https://docs.python.org/3/library/contextlib.html)
        - 先练习一下装饰器的用法: [Python装饰器学习（九步入门）](http://www.cnblogs.com/rhcad/archive/2011/12/21/2295507.html)
        - 返回一个迭代器, 使用 `with timer(title):`调用, 很方便统计时间, 在 Jupyter notebook 里面, 可以用 %time 代替
        - 很巧妙, 装饰器返回的是函数, 而 @contextmanager 返回的是迭代器
        - 不过装饰器不影响函数名, @contextmanager 需要用 with 来调用类似函数
        - 这个地方写个装饰器其实也是可以的, 可能目的是在使用 `with`, 这样确定了作用域, 显得更加清晰.
        - 似乎和装饰器作用相通, 而且更加灵活
    - 感觉没必要跑偏了, 类装饰器可以以后再了解, 继续回到 baseline 上面来.
- 18.6.24
    - 这个比赛的关键并不在模型上, 在特征工程上
    - 模型的重点可能是参数的选择.
    - 线下验证集, 比较合适的是 KFold
    - 下一步学习现有版本 LB: 0.792
    - 整一个 baseline 出来, 使用 simple feature
    - NAME_CLIENT_TYPE
        - 大部分用户类型是 Reapter, 其他的比较少
        - 不还钱的概率都差不多, 从7%-8.5%
        ![](https://ws4.sinaimg.cn/large/006tNc79ly1fsmgg51tegj30kp0a8t9k.jpg)
    - NAME_PAYMENT_TYPE
        - 主要是通过银行汇款
        - 概率无法区分, 大约全部都是 8% 左右.
        ![](https://ws3.sinaimg.cn/large/006tNc79ly1fsmgbgkxb3j30kj0fzmy6.jpg)
    - NAME_CONTRACT_STATUS
        - 最多是同意, 其次是取消或拒绝
        - 比率最高的是拒绝, 其次是取消, 最少是同意.
        ![](https://ws2.sinaimg.cn/large/006tNc79ly1fsmg6gytbij30kj0brjs9.jpg)
    - NAME_CASH_LOAN_PURPOSE
        - 有好些不可命名的项目, 除开这些, 比较多的是维修, 紧急使用, 买二手车..
        - 不还款概率比较高的是, 不想明确说用途, 业务爱好和汽车维修
        ![](https://ws2.sinaimg.cn/large/006tNc79ly1fsm9kibs6aj30kj0endi2.jpg)
    - NAME_CONTRACT_TYPE_y
        - 现金贷款和消费贷款人数差不多 600K, 循环贷款 150K
        - 其中不还款概率, 循环 10%, 现金 9.5%, 消费贷 8%
        ![](https://ws3.sinaimg.cn/large/006tNc79ly1fsm9dbsexfj30kl0a80to.jpg) 
    - 'DAYS_CREDIT','CREDIT_DAY_OVERDUE','AMT_CREDIT_SUM','AMT_CREDIT_SUM_LIMIT'
        ![](https://ws1.sinaimg.cn/large/006tNc79ly1fsm1zcfvbcj30kp0jg40w.jpg)
        - TARGET = 1 的分布类似, 但是波动比 = 0 的情况大得多
    - AMT_CREDIT_SUM
        - 因为大量离群点(outlier), 所以完全无法很好的展示分布情况
        ![](https://ws4.sinaimg.cn/large/006tNc79ly1fsm18i6qy1j30ky0crdga.jpg)
        - 所以使用阈值(threshold) 来控制显示图形, 大于阈值的 outlier 不展示出来
        ![](https://ws1.sinaimg.cn/large/006tNc79ly1fsm1c0yl6uj30ls0cwgmz.jpg)
        - 使用新函数后, 可以看到信用额度基本在 20000 以下, 不过还有一些峰值.
    - AMT_CREDIT_SUM_LIMIT
        - ![](https://ws1.sinaimg.cn/large/006tNc79ly1fsm1r5sdxyj30hb0ao3z6.jpg)
        - 可以看到有很多离群点需要处理 
- 18.6.23
    - Credit overdue
        - 大部分贷款都是 0 天或者接近 0 天逾期, 最久的贷款逾期是 3000 天.
    ![](https://ws1.sinaimg.cn/large/006tNc79ly1fsks4k8np8j30k00d3jrx.jpg)
    - ipic 无法上传图片了, 有可能是图床空间占满了.
    - 因为时间有限, 如果想要赢得比赛, 需要打造有战斗力的班子.
    - Duration of credit
        - 信贷持续时间全部少于 3000 天, 持续时间越短频率越高, 峰值在 300 天左右.
        ![](https://ws2.sinaimg.cn/large/006tKfTcly1fskqlzrrixj30kd0ca75c.jpg)
- 18.6.22 
    - Credit type
        - 绝大多数是 Consumer credit, 接着是 Credit card. 其他的人数都比较少
        - 不还款最多的类型是: 为购置设备的贷款 20%, 小额贷款 20%, 现金周转 12%
        ![](https://ws3.sinaimg.cn/large/006tKfTcly1fskqmrzco7j30ov0inq5c.jpg)
    - Credit currency
        - 绝大多数是 currency_1
        - 不还钱的比率各不相同, 很有区分度, 最多是 currency_3, 最少是 currency_4 几乎为 0
        ![](https://ws2.sinaimg.cn/large/006tKfTcly1fskqnk947ij30pa0eawfi.jpg)
    - CREDIT_ACTIVE
        - 绝大多数是 Closed, 其次是 Active, Sold/Bad debt 很少
        - 不还款中, Bad debt 占比 20%, 其余大约 10% 左右, 有明显区分度
        ![](https://ws2.sinaimg.cn/large/006tKfTcly1fskqnk947ij30pa0eawfi.jpg)
    - Bureau 数据和 train/test 数据共同的 key 是 SK_ID_CURR, 所以先将这两个表进行合并
    `application_bureau_train = application_train.merge(bureau, left_on='SK_ID_CURR', right_on='SK_ID_CURR', how='inner')`
- 18.6.21
    - REG_CITY_NOT_LIVE/WORK_CITY: 大部分人都在自己住的或工作的城市注册, 其中住的城市注册的比率更好, 如果不在自己住的/工作的城市注册的人, 不还款的概率更高
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqodnhkjj30my0c73z6.jpg)
    ![](https://ws1.sinaimg.cn/large/006tKfTcly1fskqoi4mvrj30n80cnjs1.jpg)
    - REG_REGION_NOT_LIVE_REGION and REG_REGION_NOT_WORK_REGION: 只有很少的人不是用住址和工作地址进行注册, 总体而言, 不用住址/工作地址 注册的不还款的概率会高一点点
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqp9ntuxj30mv0boaar.jpg)
    ![](https://ws2.sinaimg.cn/large/006tKfTcly1fskqozsoc9j30n60c33z8.jpg)
    - 查看 target = 0/1 的分布对比图
        - AMT_ANNUITY 分布几乎相同
        - AMT_GOODS_PRICE 分布类似
        ![](https://ws1.sinaimg.cn/large/006tKfTcly1fskqq5yxepj30n80antau.jpg)
        - DAYS_EMPLOYED 分布类似, 但是 target = 0 的峰值高于 target = 1
        - DAYS_REGISTRATION 分布类似, target=0 的波动性更强
        ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqqawj1wj30ni0arjtg.jpg)
        - DAYS_BIRTH target=0 的平均年龄更小
        - DAYS_ID_PUBLISH target=1 的注册时间更长
        ![](https://ws3.sinaimg.cn/large/006tKfTcly1fskqqfdp49j30nb0azwhf.jpg)
    - 这个比赛 feature 太多了, 而且很多 feature 的区分度不高, 后期训练模型的时候, 筛选特征可能要花大量时间, 那么划分好的线下验证集就很重要了
- 18.6.20
    - DAYS_ID_PUBLISH: 申请贷款的 多少天之前更换了身份证件, 中位数是 -3254天
    ![](https://ws2.sinaimg.cn/large/006tKfTcly1fskqs22iafj30k70c9gmo.jpg)
    - DAYS_REGISTRATION: 注册时间中位数是 -1213天, 但是还有 -17912天的, 不是很懂这个是怎么统计出来的, 要注意.
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqscxcbsj30k40cnab4.jpg)
    - DAYS_EMPLOYED: 贷款人大多数都是没有工作的(值为负数), 还有一部分 100 年, 所以做这个 feature 要特别注意, <=0 处理成一个, 100年的应该是错误数据. 
    ![](https://ws1.sinaimg.cn/large/006tKfTcly1fskqsm4humj30jw0c70to.jpg)
    - DAYS_BIRTH: 贷款人大多数在 20-68 岁.
    ![](https://ws1.sinaimg.cn/large/006tKfTcly1fskqsvwnt2j30k10cpmyb.jpg)
    - AMT_GOODS_PRICE: 对于消费贷款, 消费品价格, 中位数 45W, 平均数 53W
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqt7d7wjj30jr0cdq42.jpg)
    - AMT_ANNUITY: 年金保险合同, 基本都符合长尾分布, 中位数在 2w5, 平均数在 2w7 左右
    ![](https://ws3.sinaimg.cn/large/006tKfTcly1fskqtm4stej30hi0asgm2.jpg)
    - AMT_INCOME_TOTAL: 贷款人的总收入, 平均 168797 大多数 10W+, 还有少量的 1000W 左右, 造成分布极度不均衡, 可能需要考虑离群点, 收入过高, 造成的不平衡状态.
    ![](https://ws1.sinaimg.cn/large/006tKfTcly1fskqueme4nj30gd0asglw.jpg)
    - AMT_CREDIT: 贷款信用额, 大多数在 25W-50W 之间
    ![](https://ws1.sinaimg.cn/large/006tKfTcly1fskqtvudihj30ho0asgm5.jpg)
    - NAME_EDUCATION_TYPE: 借款人数最多的是中学教育程度, 其次是高等教育程度. 欠钱不还最多的是初中学历
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqwiievsj30mx0gu0u0.jpg)
    - NAME_HOUSING_TYPE: 绝大多数借款人, 是有自己的房子或者公寓, 欠钱不还大多数是租用公寓和与父母同住.
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqw4mec8j30n50fjq48.jpg)
- 18.6.19
    - OCCUPATION_TYPE: 大部分借款人是 Laborers, 其次 Sales staff, 最低是 IT staff; 不还钱概率最高是 Low-skill Laborers, Drivers 等技术越低还钱概率越低
    ![](https://ws3.sinaimg.cn/large/006tKfTcly1fskqxdj1amj30kj0p6ac4.jpg)
    - ORGANIZATION_TYPE: 不还钱最高的是 Transport/Industry/Restaurant
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqx1mkzaj30kj0pegp7.jpg)
- 18.6.18
    - CNT_FAM_MEMBERS: 有 1 个家人(伴侣)借款人数最多, 其次是单身或者有2个家人(孩子);不还款最多的是有 11/13 个家人(100%), 基本上是家人越多还款概率越低, 与 cnt_children 类似
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqydt2qjj30kq0asgmi.jpg)
    - NAME_INCOME_TYPE: 有工作的借款人数最多, 其次是商业合作伙伴/领退休金; 离职孕妇/无工作的不还款概率最高.
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqy2j5jzj30kq0midh9.jpg)
- 18.6.17
    - 把这个项目放到怼圈来吧, 但是发现要切换分支不美, 那就算了, 说不定后面还要协作, 等全部完了再迁过来..
    - NAME_CONTRACT_TYPE
        - 循环贷款占 10% 左右, 其余是现金贷款, 其中现金贷款不还概率(8%) 大于循环贷款 (5%)
        ![](https://ws1.sinaimg.cn/large/006tNc79ly1fsm22sd8usj30kq0afdgh.jpg)
    - Client Gender: 女性客户比男性多 1 倍, 但无法还贷的性别中, 男性 (~10%) 多于 女性 (~7%)
    ![](https://ws3.sinaimg.cn/large/006tNc79ly1fsm22fd4kdj30kq0afjs0.jpg)
    - Own car/estate: 没车的客户比有车的客户多 1 倍
    ![](https://ws2.sinaimg.cn/large/006tNc79ly1fsm24r3jtgj30kq0afdgh.jpg)
    - Family status: 最多是已婚, 但是不还贷的里面最多是 Civil marriage 和单身/未婚, 很有意思
    ![](https://ws4.sinaimg.cn/large/006tNc79ly1fsm2585wx6j30kq0af0te.jpg)
    - Cnt_children: 更愿意贷款给没有孩子或者孩子很少的家庭, 9/11 个孩子家庭不还款概率是 100%, 一般而言, 孩子越多, 还款概率越低.
    ![](https://ws4.sinaimg.cn/large/006tKfTcly1fskqydt2qjj30kq0asgmi.jpg)
- 18.6.16
    - 类别型 feature 打印出来
        - 分成两类, 一类是全部数据的分布情况打印
        - 第二类是, 当 target = 1 时候的分布情况
    - 数值型 feature 打印出来
        - 同样分两类, 一是全数据, 二是 target = 1 的分布
    - 发现最终目标其实是是否完成还款, 更关键的是 target = 1 的情况, 未完成还款任务.
    - 在整体数据中, revolving loans 只占非常小的比率 10%, 但是在 unrepaid 情况中, revolving 的占比很高 
    ![](https://ws2.sinaimg.cn/large/006tNc79ly1fsm21hq5jnj30bf0arq37.jpg)
    - 删除 paperspace 上的 fashionai 服务器
- 18.6.15
    - 查看全部基础特征描述 `HomeCredit_columns_description`
        - 发现把这个 csv 文件读取到 pandas 报错, 想了想, 还是直接用 subl 看比较方便(￣▽￣)
    - 再看看 target 的平衡性 (unbalance), target = 1 是那些还款有问题的, `HomeCredit_columns_description` 这个表就像是用户手册一样, 有疑惑的特征可以去查查看, 什么意思, 自己臆测是有问题的...(先前以为1是放款成功没问题的)
    - 为了避免事后麻烦, 一定要在事先思考好, 按照规矩来走
- 18.6.14
    - 查看表格全部 column `application_train.columns.values`
    - 了解表格内每个 feature 的含义
    - 查看缺失值 
    ```
    def missing_data(data):
    total = data.isnull().sum().sort_values(ascending = False)
    percent = (data.isnull().sum()/data.isnull().count()*100).sort_values(ascending = False)
    return pd.concat([total, percent], axis=1, keys=['Total', 'Percent'])
    ```

- 18.6.11
    - 读取所有文件
    - 显示每个表格的行列数 `print("application_train -  rows:",application_train.shape[0]," columns:", application_train.shape[1])`
- 18.6.9
    - 在 bitbukcet 建立私库 `https://bitbucket.org/du4ai/homecredit/src/master/`, 并且完成项目架构
    ```
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
    ```
    - 建立 .gitignore 文件, 避免推送大文件入仓库
    - 将原始数据文件放入仓库 => /raw/xx
    - 研究如何给项目版本号进行命名 [如何高效地对软件版本号进行命名?](https://www.zhihu.com/question/19879216)
        - 采用 window 版本
        ```
        Windows 风格的版本号命名格式:  主版本号 . 子版本号 [ 修正版本号 [ . 编译版本号 ] ] 英文对照:  Major_Version_Number . Minor_Version_Number [ Revision_Number [ . Build_Number ] ]  示例: 1.21， 2.0
        ```
    - 了解现有 kernel, 看看大家进展情况, 特别注意标签有 `beginner/tutorial/eda etc.` 或者得分高的 code
    - 搜索方式 `Most votes` and `Best Score`
        - [Home Credit : Complete EDA + Feature Importance ✓✓
    ](https://www.kaggle.com/codename007/home-credit-complete-eda-feature-importance)
        - [Home Credit Default Risk Extensive EDA
](https://www.kaggle.com/gpreda/home-credit-default-risk-extensive-eda)
        - [sbanHomeCreditRisk: Extensive EDA + Baseline [0.772]
](https://www.kaggle.com/shivamb/homecreditrisk-extensive-eda-baseline-0-772)
- 18.6.8
    - [Kaggle API](https://github.com/Kaggle/kaggle-api)
        - 过去是逐个下载每一张表, 当表格比较多的时候, 重复劳动, 很麻烦, 发现可以使用 Kaggle API 将该比赛的所有文件一次性全部下载.
        - Installation
            - 使用 pip 直接安装 `pip3 install kaggle`
            - `Successfully installed kaggle-1.3.8`
            - 去 kaggle 官网个人账号主页 `https://www.kaggle.com/hugo1030/account` 点击 `Create new API Token` 下载 `kaggle.json` 文件, 并放入地址 `~/.kaggle/kaggle.json`
                - 发现并没有 `~/.kaggle/` 这个文件夹, 故新建该文件夹, 然后将 kaggle.json 文件放入
            - 为了防止其他用户登陆我的账户, 使用 `chmod 600 ~/.kaggle/kaggle.json` 进行安全设置
                - `chmod 600` Linux 系统设置权限: 拥有者可读写, 其他用户不可读写
            - `kaggle competitions download -c home-credit-default-risk` 进行下载全部比赛文件
                - 文件下载到 `/Users/hugo/.kaggle/competitions/home-credit-default-risk` 文件夹内了
    - Timeline:
        - August 22, 2018 报名及组队截止日期
        - August 29, 2018 最终截止日期
    - 赛题目标:
        - input: SK_ID_CURR - 用户 ID
        - output: TARGET - 是否提供贷款, 概率
    - 赛题数据描述分析
        - application_{train|test}.csv
            - 这是主表, train_set 包含 label, test_set 不包含 label
            - 所有的静态数据, 一行代表一个贷款金额, 申请时间, 申请是否通过
        - bureau.csv
            - 客户之前的信用记录, 由其他征信机构提供
            - 在申请日之前, 客户的信用信息
        - bureau_balance.csv
            - 信用每月结余信息
            - 之前记录的月报告
        - POS_CASH_balance.csv
            - POS 和 现金的月计表
        - credit_card_balance.csv
            - 信用卡的月计表
        - previous_application.csv
            - 客户之前申请的信息
        - installments_payments.csv
            - 之前的贷款支付历史
            - a) 是已支付 b) 是错过还款
            - 每一行是一个分期付款
        - **HomeCredit_columns_description.csv**
            - 包含各种数据文件中列的说明
- 18.6.7
    - 评价指标 ROC/AUC 
        - 首先找到 wiki 百科 [Receiver operating characteristic](https://en.wikipedia.org/wiki/Receiver_operating_characteristic) 的解释, 但是因为全英文, 读起来吃力, 于是又用 Google 搜索了中文解释, 发现中文解释 [ROC和AUC介绍以及如何计算AUC](http://alexkong.net/2013/06/introduction-to-auc-and-roc/) 中, 并没有针对每个术语进行外链解释, 比如: true positive rate（TPR) 于是又回到 wiki 百科, 发现所谓 TRP 即是召回率 Recall [Sensitivity and specificity](https://en.wikipedia.org/wiki/Sensitivity_and_specificity)
        - 如果想对一个问题和相关知识有全面细致了解, Wiki Pedia 这种蜘蛛网式的超链接形式是获取信息更权威/更重要的渠道.
        - 重要的是, 知道了每种术语的别名, 比如 Sensitivity = TPR = Recall 这个在 wiki pedia 里面详细说明了, 而其他渠道没有.
        - 可是 wiki 里面没有如何求取 auc 的例子, 只有数学公式, 理解很不直观, 于是还是看了中文例子, 终于理解清楚如何计算
        - 看来 wiki 和中文解释都得结合起来看看, 才能不漏掉或者错过重要信息!
        - 如何求取 auc [Area under the curve](https://en.wikipedia.org/wiki/Receiver_operating_characteristic#Area_under_the_curve) 可以调用 sklearn 函数 [sklearn.metrics.roc_auc_score](http://scikit-learn.org/stable/modules/generated/sklearn.metrics.roc_auc_score.html#sklearn.metrics.roc_auc_score)
- 18.6.6
    - 赛前理清思路, 预先设计好路线图, 安排步骤
    - 仔细阅读赛题描述和数据说明
        - 信贷历史信息不足或不存在
        - 无法从银行获取贷款, 提供服务, 类似 p2p
        - 利用电信和交易信息(而非传统信贷信息), 建立 ML 模型, 来预测还款能力
- 18.6.5
    - 创建 S16E51 log
