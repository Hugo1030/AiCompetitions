## models
### 第二版
- collar
    - v2 collar.best0601a_InceptionResNetV2_comb.h5 209M => collar_0601b_InceptionResNetV2.csv 4 种 tta
    - xception collar.best0531a_Xception.h5 80M => collar_0601a_Xception.csv 4 种 tta
- neckline
    - v2 neckline.best0601a_InceptionResNetV2_comb.h5 209M => neckline_0601b_InceptionResNetV2.csv 4 种 tta
    - xception neckline.best0531a_Xception.h5 80M => neckline_0601a_Xception.csv 4 种 tta
- skirt
    - v2 skirt.best0601a_InceptionResNetV2_comb.h5 209M => skirt_0601b_InceptionResNetV2.csv 4 种 tta
    - xception skirt.best0530a_Xception.h5 239M => skirt_0601a_Xception.csv 4 种 tta
- sleeve
    - v2 sleeve.best0601a_InceptionResNetV2_comb.h5 209M => sleeve_0601b_InceptionResNetV2.csv 4 种 tta
    - xception sleeve.best0531a_Xception.h5 80M => sleeve_0601a_Xception.csv 4 种 tta
 
### 第一版
- collar
    - v2 collar.best0531a_InceptionResNetV2.h5 209M => collar_0601a_InceptionResNetV2.csv 3 种 tta
    - xception collar.best0531a_Xception.h5 80M => collar_0601a_Xception.csv 3 种 tta
- neckline
    - v2 neckline.best0531a_InceptionResNetV2.h5 209M => neckline_0601a_InceptionResNetV2.csv 3 种 tta
    - xception neckline.best0531a_Xception.h5 80M => neckline_0601a_Xception.csv 3 种 tta
- skirt
    - v2 skirt.best0529b_InceptionResNetV2.h5 209M => skirt_0601a_InceptionResNetV2.csv 3 种 tta
    - xception skirt.best0530a_Xception.h5 239M => skirt_0601a_Xception.csv 3 种 tta
- sleeve
    - v2 sleeve.best0531a_InceptionResNetV2.h5 209M => sleeve_0601a_InceptionResNetV2.csv 3 种 tta
    - xception sleeve.best0531a_Xception.h5 80M => sleeve_0601a_Xception.csv 3 种 tta
 
## 进展
>>> 18.6.1
- 用已经训练好的模型, 做 3 种 tta, 提交一版
- linux 解压 `tar xvf`
- 找到两张重复图片的 id, 在csv 里面进行查找
- 伪标签法时, collar 是训练集 4 种预处理 + 测试集 4 种预处理
- neckline 是训练集 3 种预处理 + 测试集 4 种预处理
- 测试 lr = 0.00001, skirt 30% 伪标签
- 用 test 数据, 测试 val_acc
- testset : trainset
    - collar 0.3414
    - neckline 0.3324
    - skirt 0.3342
    - sleeve 0.3382
- 本地好好测一个
    - 划分 0.25 数据集出来, 训练 3 个 epoch
- 用之前训练好的模型, 

>>> 18.5.31
- round1 padding+flips+flip hist+constract 2epoch
- round2 
    - padding+flips+flip hist+constract lr = 0.001 crop => 0.01 ssd face
    - padding+flips+flip constract + hist lr = 0.0001
- tta(pad+flip+constract)
- 明天 12 点 - 后天 12 点: 5 次测试机会(每小时1次)
- 密码, 解压
- 第一版: 
    - collar/neckline: round1/2 
    - coat/skirt round1/2
- 5G, train set 8G
- 伪标签, 3W 121类, 30/40 图片 train set 2:1 伪标签, 0.02
- 1W7 8类 1-2K 2-3k 图片 6:1, 
- test set 8:5, 鲁棒性
- 第二版: 伪标签 => 预测 label / 图片 合并 train set 里面, 在训练 => model test set, dropout 0.5 => dropout 0.3 , 欠你和 L2
- 全数据 / 切分(0.1) => 0.9 , 好 0.01 , 0.03
- 2 epoch lr=0.001 lr = 0.0001, 1 epoch 0.0001 => 伪标签 差不多 过拟合 4种预处理 1/3 - 2/3
- 3 epoch lr = 0.0001
- 第三版: sleeve 加旋转, 姿势多, 鲁棒性, 测试集
- 硬盘读, 内存, 6-7w, 8w-9w memory error 0.942 0.956 0.14 => 5G 鲁棒性/不合规 fc/ 10/ 参数 cnn 共享参数, fc 不共享 不允许
- tta 12crop => 5crop
- 预处理多, 合适, 60% 预处理图片, 形状(重点, 去掉背景干扰, 突出目标重点)/颜色, mask_rcnn 准确率 80%+, 自己训练 92-95%, keypoint 3%
- 模型结构改, trible (半监督学习, 聚类) collar 不给任何标签, 5 label, 监督学习+半监督学习, 综合考虑 0.96
- sleeve train_acc 0.8
- coat/pant label-smooth

>>> 18.5.30
- 全数据模糊边界 sleeve
- 全数据+round2 v2 
- 如果要对环境做改变的时候, 注意备份
- 测试 resnet
- 全数据到底有没有用? 有 0.01 的作用
- 有没有能够直接测试的模型? 
- 测试 skirt
    - padding+flips+flip hist+constract lr = 0.001
    - padding+rotat20°+rotate20°+flip constract lr = 0.0001
    - tta(pad+flip+constract)

>>> 18.5.29
- 测试 model 大小 `save_weights_only` = True
- 测试重训练 round1 对 round2 的影响
- 尽量还是不要用全数据, 这样让模型变得不可比较
- 一定要控制变量, 不能由全数据编程切分, 又用 label smooth
- 统计每个标签, 有多少模糊边界
    - collar=0
    - neckline = 291
    - skirt = 966 少
    - sleeve = 2688 多 0.0005 线上
    - neck = 0
    - coat = 2133 m 0.1
    - lapel = 0 
    - pant = 1441    

>>> 18.5.28
- 使用 nasnet 全部读入内存的方式, 资源不足
    - 稍后使用从本地读取的方法
- 测试 label_smooth ,
    - 令每个 m = 0.1; 效果很不错, 但是不能排除是 round1 的作用
    - 令 y = 0.9 , 其余均分 0.1

>>> 18.5.27
- 用初赛 B 榜数据, 来做 round1 的验证集
    - 成绩均有大幅度提高


>>> 18.5.26
- 裁剪作为维度放入, 5 种预处理
- 添加 crop 作为特征放入, 且减少一种预处理, 防止过拟合, 4 种预处理
- Triplet 结构
- 多任务
- Faster-rcnn
- 目前最优: 两轮 + crop + pad + flip + hist + tta + 全数据
- resnet, nasnet
- 明天一边处理 round1 图片, 一边训练 round2 的全数据 v2
- 然后重新训练 round1 的 Xception, 在训练 round2 的 xception
- 融合看看效果怎么样
- 第一轮可以测试, 全数据的效果

>>> 18.5.25
- 测试:
    - 不裁剪效果如何? val_acc 下降了
    - 裁剪作为一个维度效果如何? 
    - 按阿虎的方式裁剪效果如何? 
    - round1 训练得更好对结果有影响吗?
    - 改变 batch_size 有影响吗? 有(改成 64 , 系统资源会不够, 只能测试 16, 时间并不是 2 倍, 而是多了 20%)
- Q 博士查中国知网的论文

>>> 18.5.24
- 测试不变形的 sleeve , 直觉这个会不一样
- lr 变成 0.0005 是因为做 4 种预处理, 处理的数据更多了, 为了减少过拟合
- sleeve 改变填充方式后, 收敛的更快了
- 测试:
    - lr 减小有没有效果? 误差范围以内, 效果差不多
    - 边缘填充有没有效果? 有
    - finetune有没有效果? 没有
    - 全数据有没有效果? 有或不明显
    - skirt/sleeve 裁剪有没有效果? 反效果
    - collar/neckline 裁剪有没有效果? 有疑问, 测一下 4 种预处理 Pad
    - 4 种预处理是否比 3 种要好? 是的  
    - early stop 有没有效果?  opencv 预处理情况, 2 个 epoch, 欠拟合/过拟合, steps_per_epoch = size / 32/16/64,  bestmodel, valset
    - 两轮有没有效果? 有 0.004, 
    - keras 还是 Opencv? opencv 0.88+,  tta 0.98+/=> keras 旋转+水平翻转 => 0.86+ 线上/线下
    - tta 有没有效果? 有 label 4个 0.001 - 0.002
    - 伪标签有没有效果? 略微负面效果 trainset 图片数量很少 320 / 几十张 测试集 1/3 - 2/3, testset 并不少, 几十张, trainset 过拟合, 比较好的表现, 不管怎么数据增强, 1w7 张训练集, 2K5 1/4, collar/sleeve, -0.001
    - 改变 batch_size 有什么影响? 16, 效果更好, 32 => 16/64
    - triplet 结构有没有效果?
    - fast-rcnn 有没有效果?
- 线上测试 skirt, pad + 4 种预处理, 不要 crop, pad + resize + flip + flip+直方均衡 + 对比拉伸, 目前效果最好
- 线上测试 collar, neckline , face_crop, pad + resize + flip + 直方均衡 + 对比拉伸, 目前效果最好
- 31 a 榜, 7天, 模型融合, 0.96+=>0.98+, 4个模型0.02, 2个模型, 0.02+, 0.92+ => 0.94+ 0.93+ , 0.01
- xception/desnet/...
- 0.95+ 7名, sdd
- label_smooth/batch_size/l2/多尺度训练 multi-scale training/多标签/把原图放入 crop 进行训练/5 crop


>>> 18.5.23
- 阿虎实测, 简单裁剪和水平翻转效果就很好, 同时我又发现多预处理很容易过拟合, 所以, 有可能是 bestmodel 的方法让效果提高
- 使用 keras 可以得到刚好过拟合之前的版本
- 不使用 keras 处理, 要不欠拟合, 要不过拟合
- 似乎也可以通过 steps_per_epoch 这个参数来控制
- 测试这种情况下的 tta, 只做水平翻转
- 测试不做 tta 直接预测结果的情况如何
- 使用 crop 方式成绩低的原因是, 前者使用全数据, 后者使用切割数据, 中间有 0.003 的差距
- `rm -rf .DS_Store`

>>> 18.5.22
- 使用 face_crop 进行裁剪
    - 报错 `error: /io/opencv/modules/imgproc/src/resize.cpp:4044: error: (-215) ssize.width > 0 && ssize.height > 0 in function resize`
- linux 显示10个文件 `ls -1 | sort -u | head -10`

>>> 18.5.21
- 对高斯噪声的图片, 也进行翻转 => 对 sleeve 有所提升, 对 skirt 无效
- 结果测试改变, 也要做 tta
- 想 collar/lapel 这样的标签, 是否和 sleeve/pant 这样的标签不同?
- 一个做高斯噪声比较好/一个做直方均衡?
- paperspace 无法登陆
- 在测量袖长, 裙长等指标的时候, 特别注意不要改变图片比例
- 而在领口形状上面, 似乎并不重要
- 对领口图片进行裁剪, 边界
- 使用 Yolo 进行精确裁剪
- dropout 是否可以改变, 因为 underfitting

>>> 18.5.20
- 冻结+2轮 => 改变了模式
- 如果要用 tta, 那么 valid 的时候也要 tta, 做不做预处理, 对 val_acc 是有影响的
- 可以选择直接加载 model, 调用 evaluate 函数进行预测, 比较两种方式的优劣, 看不出哪种形式更优秀, 似乎在某种程度上是随机的
- 伪标签似乎也没有什么作用
- 测试结果应该用 tta.

>>> 18.5.19
- 测试直方均衡图 => 比高斯噪声效果还差一点
- 对 index 进行 One-hot 编码
- 先测试伪标签是否有效, 然后再想如何更合理的来做
    - 效果是第一轮好, 还是第二轮好?
- 不使用伪标签 collar => val_loss: 0.4660 - val_acc: 0.8510
- 再使用伪标签 collar => val_loss: 0.7908 - val_acc: 0.8532
- 使用高斯噪声测试 skirt => val_loss: 0.7220 - val_acc: 0.7357
- 使用直方均衡测试 skirt => val_loss: 0.7318 - val_acc: 0.7269
- 测试的时候需要控制变量
- 明天测试, 原先的 label, 冻结+训练2轮, 看看结果如何
- 再测试 valid 做数据增强, 再错伪代码


>>> 18.5.18
- 测试两阶段 finetune 法 => acc 提升一点, map 差不多
- 测试两阶段全数据训练法 => 并没有好多少
- 测试伪标签法 => 并不好
- 测试直方图 => 变差了
- 测试 label smoothing
- 直接在 round2 开始测试
- 使用 `np.concatenate() ` 进行合并 => `X_comb = np.concatenate((X_train, X_valid), axis=0)`

>>> 18.5.17
- 直方均衡图做预处理还不错
- 从 paperspace 上传模型到 `./dropbox_uploader.sh upload /home/paperspace/fashionai/models/collar.best0516b_InceptionResNetV2_round2.h5 /models`- 
    - paperspace 上传速度很快
    - 然后从 dorpbox 下载到本地速度很多
- 找出预测错误的图片和 valid 文件, 放入 valid_error 文件夹, 做 error boost
- 每个 model 的文件已经超过 600M 了, 后面还要想办法进行压缩, 压缩成 zip 可以变成 500M
    - 显示本地文件大小 `du -ah`
- np.argmax() 返回沿轴axis最大值的索引
- round3 训练太多, 严重过拟合了, 对 round2 结果影响太大,  调小 lr 进行微调


- TTA > 直接预测, 线上测试集 test set + 0.03+, 初赛 v2 model1/model2 => result1/result2 result | model/test set => set1 / set2 / set3 => result1/result2/result3 => result
- 三轮 > 一轮 0.02+
- opencv 预处理 > keras, 0.04+, 0.68 => 0.72 1/4
- label smoothing
    - 去掉模糊边界 m 下降
    - y 0.6 m 0.4 下降 
    - 论文
    - heatmap mask-rcnn 0.9+ 有代码, v2 collar/skirt/sleeve 8 label v2: - softmax (heatmap) 
    - yolo/ssd 
    - finetune v2 xception/ 代码/论文 / opencv [x x x x x] [y y y y y] 不过拟合, 拟合不足 numpy/rncrop/insert, 速度快 3 倍
    - keras => [x x y x y] random [x y x x x] 过拟合
        - fn lr大
        - 放开所有 lr小
        - 表 lr 大/ 底 lr 小
    - <= image => heatmap
    - crop, 不影响裁剪关键数据- 海康威视 +0.02
    - 生成伪标签, 测试


>>> 18.5.16
- 训练步骤:
    1. 利用 round1 训练数据 + testA + testB, 做三种预处理, 得到模型1
    2. 在模型1 的基础上, 利用 round2 的数据做三种预处理, 继续训练, 得到模型2
    3. 将 round2 训练集分类错误图片 + 验证集图片, 收集起来放入 valid_error 文件夹
    4. 对 valid_error 图片做前面3种预处理之外, 再做旋转+裁剪 2种进一步预处理, 继续训练模型, 得到模型3
    5. 对 round2 的测试集做 5 种预处理, 分别预测结果, 加权平均, 得到最终单模成绩
- 先测试只利用 round1 训练数据分两阶段训练模型, 看看效果是否有提升
- 一开始选用较大的 Lr , loss 收敛的速度更快, 这种方式是目前为止, 收敛最快的, 第 2 个 epoch 收敛得也好快,
- 如果第二轮不是减小50倍, 而是减小10倍呢? lr 太小即使在训练集上, 收敛得也太慢了, 测试一下吧, 在训练集上收敛得更快了, 但是验证集如何呢
- val_loss 提高了, 但是 val_acc 也提高了


>>> 18.5.15
- 清理 crestle 里面的文件, 5.15占用硬盘 disk 40.08G, 明天再看变成 7.99 GB了
- validate_error_boost 了解一下
- label smoothing
- 得到预测结果, 然后得到预测 label 输出, 看下之前的代码应该可以获取
- 先让它过拟合, 考虑在预测错误的基础上, 重新训练模型, error boost
- 训练样本类别平衡


>>> 18.5.14
- 数据增强还有很多空间可以挖, 需要深入思考和理解
- 比赛关键在: 图像预处理和模糊边界处理
- 做了颜色抖动, 结果变差, 再训练一个 epoch 试试, 训练了 2 个 epoch 还是上不去
- 删除 ubuntu 回收站所有文件 `sudo rm -fr $HOME/.local/share/Trash/files/`
- `./dropbox_uploader.sh download sleeve_length_labels.zip /home/paperspace/fashionai/data/base/Images/sleeve_length_labels.zip`
- python的img库做的水平翻转,处理后，图片被压缩了,cv2的水平翻转，不会压缩图片
- 增加一些预处理, 准确率和只做水平翻转没有区别: 实际区别不大, 水平翻转效果稍好一点
    - 不做任何预处理, 直接训练, 会比做增强的情况差不少, 会出现明显过拟合
- Label Smoothing 和 knowledge transfer 的方法
- 还有就是对 m 也标注 1 会如何?
- 咱们的比赛, 不应该做成 One-hot 编码, 因为每个标签之间不是相互完全独立的
- 每个临近标签之间存在-- 模糊边界, 他们之间距离应该比远距离标签更加接近才对
- 咱们 label 学习目标的设计不能忽视这一点
- L2 正则化试试
- lr 如何选取更加好, 第二个 epoch 用 lr = 0.0001 好还是 lr = 0.00002 好, 没什么区别
- 发现如果用二阶段训练法, 预处理和 keras 情况是一样的, 都是val_acc 都是 0.8400, keras 时间更长, 效果更差
- 海康威视的文章再研究一下
```

label: sleeve
Keras.best: val_loss: 1.7187 - val_acc: 0.4534, time = 500s × 26 个 epoch
Opencv.best: val_loss: 0.9742 - val_acc: 0.5962, time = 1600s × 2个 epoch

label: collar
Keras.best: val_loss: 0.6616 - val_acc: 0.8366, time = 270s × 16 个 epoch
Opencv.best: val_loss: 0.4114 - val_acc: 0.8427, time = 580s × 2 个 epoch
```


>>> 18.5.13
- 早上起来发现, paperspace 服务器, 点击 shutdown 但是并没有关闭, 导致损失了 6 美金
    - 设定自动关闭时限, 不使用服务器 1 小时候, 自动关闭
- 由于 collar 似乎并没有引入新的变量, 包括模糊边界的问题, 明天可以在已训练好的情况下, 继续训练训练集的数据

>>> 18.5.12
- 处理模糊边界的问题
    - 如果不存在 m, 则 y=1
    - 如果存在 m, 则 y=0.6, m=0.4
    - 统计每个标签, 有多少模糊边界
        - collar=0
        - neckline = 291
        - skirt = 966
        - sleeve = 2688
        - neck = 0
        - coat = 2133
        - lapel = 0
        - pant = 1441
    - 边界模糊越多, 准确率越低
- 标准差 50 比 标准差 20 效果要差


>>> 18.5.11
- 一种是不改变图形形状进行填充训练: 效果下降了
- 一种是加噪声训练, 看看对结果的影响, 效果一般..
- m 给一定的权重
- 为什么 Val_loss 很低了, 但是 val_acc 很低, 原来是加载测试集的时候错了...
    - 睡一觉起来, 重新训练吧
    - 好像不必, 只不过是验证集错了
    - 加了高斯噪声, 结果提升微乎其微
- 观察 GPU 的使用情况
    - `nvidia-smi`
    - `watch --color -n1 gpustat -cpu`
- 32x3x256x256 的四维数组（BxCxHxW）占用显存为：24M (float32 4byte)



>>> 18.5.10
- 先不管其他的, 对结果进行预处理, 然后使用昨天已经训练好的模型, 对预处理结果进行预测, 然后做加权平均
- 明天可以在线上测试, 使用全部图片进行训练, 会不会效果提升
- 加噪声试试
- 旋转,放大很小一点, 然后边缘填充试试
- Grid Search网格搜索: 一种寻找超参数的做法
- 随机噪声-椒盐噪音/高斯噪音等
- PCA: 主成分分析（英语：Principal components analysis，PCA）是一种分析、简化数据集的技术, PCA白化ZCA白化
    - 白化是一种重要的预处理过程，其目的就是降低输入数据的冗余性，使得经过白化处理的输入数据具有如下性质：(i)特征之间相关性较低；(ii)所有特征具有相同的方差。
    - PCA降维处理：数据量较大时可以通过PCA进行降维处理，以便减小计算量，提升处理速度。但图像处理应用中，因为一般先进行了图像的Resize处理，降低数据量，因此一般不需要再进行PCA降维处理了。
    - 归一化处理：图像处理应用中一般不需要归一化处理，因为RGB通道数据范围一直是0~255，天生是归一化的，因此不需要再进行归一化处理。
- CV 问题处理一般流程: ![](https://ws4.sinaimg.cn/large/006tKfTcly1fr69sspe7wj30kk036q39.jpg)

>>> 18.5.9
- 对 series 重置索引 reindex: `valid_data.reset_index(drop=True)`

>>> 18.5.8
- [图像的放射变换 (Affine transformation)](https://blog.csdn.net/zh_jessica/article/details/77946346#%E5%9B%BE%E5%83%8F%E7%9A%84%E4%BB%BF%E5%B0%84%E5%8F%98%E6%8D%A2affine-transformation)
![](https://ws1.sinaimg.cn/large/006tKfTcly1fr3mqp30h4j30ef0j0my5.jpg)
    - 图像的仿射变换涉及到图像的形状位置角度的变化，是深度学习预处理中常到的功能
    - 仿射变换具体到图像中的应用，主要是对图像的缩放scale，旋转rotate，剪切shear，翻转flip和平移translate的组合
    - 放射变换原点位置是右上角
    - 普通变换原点是左上角
- 然后需要设计预处理方案
    - 原则是在尽可能不丢失信息的情况下, 最大不同
    - 左右旋转 20°
    - 向下平移 0.2
    - 水平翻转
    - 在水平翻转基础上左右旋转 20°
    - 向下平移 0.2
- 最终确定的预处理, 可能还需要对最后分类错误的情况进行调整


>>> 18.5.7
- 继续按照做出 8 种不同图片, 跑一个 epoch 的思路来做, 这样是为了避免看到重复的增强图片
- 尝试修改 keras 的源代码, 去掉随机性
- 先找到 Keras 安装的源码地址, 通过 jupyter notebook 查看: /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/keras/preprocessing/image.py
- 希望用一种可控的方式来进行数据增强, 先进行随机增强 8 份数据, 跑起来看看
- 可以简单实用 PIL 模型来做图片翻转和旋转
- 似乎用 opencv 来做预处理, 似乎更加合理一些

>>> 18.5.5
- 将 trainset 存入文件夹, 将 validset 存入内存, 加快模型运算速度
- 采用读入内存的方式, 发现似乎无法收敛的很好, 基本到 0.65 就停止收敛了
- sleeve 收敛的速度就更慢了, 0.44 就停止了

>>> 18.5.4
- 使用全部数据集, 将不同 label 进行图片分类, 重新训练 neckline
- lapel_0503_InceptionResNetV2.csv
- pant_0503_InceptionResNetV2.csv
- neckline_0504_InceptionResNetV2.csv
- collar_0427a.csv
- coat_0505_InceptionResNetV2.csv
- neck_0504_Xception.csv
- skirt_0505_InceptionResNetV2.csv
- sleeve_0505_InceptionResNetV2.csv
- 训练 skirt 和 sleeve 这两个 label
- 上传原有初赛训练集到 paperspace 服务器
- 使用 round1 数据继续进行训练, 发现 val_acc 下降的很厉害, 效果变得更差了
- 模特数据和摆拍数据最好能够切分开, 初赛数据对摆拍数据有负面影响, 似乎需要更细致的研究

>>> 18.5.3
- 减小 neckline 数据集, 先跑一个 baseline 出来看看
    - 直接切分数据集, 比率 0.4, 仍然会报 memory error 的错误
    - 当切分到 0.5 的时候, 就没有报错了
    - 但是模型完全无法收敛
    - lr 下降到 0.0001 batch_size =16 后, 又正常了, 为什么?
    - 但是效果还是不好, 收敛到 0.74 左右
- 再来继续处理 preprocessing
    - 观察每种处理方式的不同
    - 如果重复进行处理的话, 是在前一个基础上进一步处理, 这样有可能会影响结果
    - ZCA白化: 举例来说，假设训练数据是图像，由于图像中相邻像素之间具有很强的相关性，所以用于训练时输入是冗余的。白化的目的就是降低输入的冗余性；更正式的说，我们希望通过白化过程使得学习算法的输入具有如下性质：(i)特征之间相关性较低；(ii)所有特征具有相同的方差。

>>> 18.5.2
- 没有模特的摆拍衣服, 更需要注意, 因为这样缺少了参照物, 是否图片预处理的方式也会与之前不同?
- 但是神经网络本来就是对特征并不敏感, 或许影响也不大, 需要测试

>>> 18.4.27
- ssh -L 8000:localhost:8888 paperspace@184.105.191.81 映射服务器端口
- http://localhost:8000   本地直接登陆
- flow_from_directory() 这个函数会将路径下的没一个文件夹视为一个分类，并对每个文件夹中的所有图片进行预处理

>>> 18.4.20
- neckline 的 v3 还没跑完, 直接从预测结果开始

>>> 18.4.2
- 目前的阶段，type你可以都置为1. 关键点标签

>>> 18.4.1
- 昨天做 warm-up 图片的时候, 问题出在加载图片, 选择加载[0],  造成全部加载同一张图片, 导致无法训练, 问题已解决
- 使用阿虎清理过得 label 集, 去掉label不同但图片相同的image_id,共去掉了10行。

>>> 18.3.31
- 本竞赛考察的, 不仅是判断的准确程度, 同时考察模型对判断的确定程度.


>>> 18.3.29
- 将过程和结果代码记录下来, 建立 readme 文档
- B 榜代码, 大家随时做, 随时收集, 做完了可以直接提交
```
Slack:

第二个步骤, 我理解其实就是 fine-tuning
更进一步, 如果继续缩小 lr 再训练会怎么样呢?
如果在过拟合之前就继续缩小 lr 会怎么样呢?
ensemble 的关键是, 差异化
同样 val_acc 的结果, 融合的不同模型差异越大, 最终 map 的效果越好
是因为不同模型之间的差异, 将有分歧的预测, 概率降低到了阈值之下
```

>>> 18.3.28
- 使用 Xception/DenseNet201 训练模型, 既可以做融合
    - 还可以看看, 在训练集里面, 三种不同模型, 都判断错误的图片,
    - 挑出来人工肉眼看看
    - 如果是标注错误, 可以手工剔除
    - 阿里提供的数据集, 本身可能就有标注错误的
    - 重新构建 Xception 模型, 重训练
- TTA: testing tine augmentation 的方法: 我们使用不同的augmentation得到不同的预测结果
- 脱离实际业务来谈机器学习算法, 是不可取的, 一定是在各种实际业务中, 学习.
- 还是要试一下, 在原来基础上, 再缩小 lr 是不是仍然可以继续调优

>>> 18.3.27
- 继续强化方向, 可以用全部数据来进行训练, 在原来的基础上. 还是看看 val_acc 的准确性是多少, 理应接近 0.9 才对
    - 果然第一个 epoch, 便是 0.9036 -> 0.9548
    - 但是我担心已经过拟合了, 如果 val_acc 都是 0.9+ , 那么 acc 应该更高, 过拟合也正常
    - 超出想象的是, 在 val_acc 的正确率一直突破, 已经到了 0.98+ , 可能过拟合会比较明显了
        - 到底结果如何, 只能在线上检验了
- 从猫/狗分辨当中去看, 同样适用迁移学习, 高分和低分的关键区别在哪里?
- 下一步还是做模型融合吧, 是用 resnet50 试试

>>> 18.3.26
- 如何用 layers.trainable 来微调神经网络 : https://zhuanlan.zhihu.com/p/26693647
    - 重新训练 最后 23 层, 发现 val_loss 和 val_acc 没有变化, 这样明显是有问题的
        - 问题1: 可能是 lr 太小
            - 调整 lr 0.0001 -> 0.001 测试
        - 问题2: 可能是冻结层数太多
            - 放开更多层数测试
            - 开放了 172 层, 一个 Block , 但是模型 val_acc 仍然没有提升
- 我猜想, 微调可能只能真的只是很小幅度的调动, 如果想有更大幅度的提升, 需要对网络有更多的调整
    - 于是就放开所有冻结, 从头训练, 只不过改变了一些增强的方式, 比如加入水平翻转等等
- 如果过拟合了, 那么继续深入训练, 是否会让 val_acc 效果一直变差, 还是即使过拟合, 还是有可能会也继续提升 val_acc ?
    - 从结果来看, val_acc 是非线性变化的, 不能说过拟合后, val_acc 就会一直下降, 它是有可能继续提升的, 但是下降还是提升, 似乎不受控制
    - 提升到 0.867, 然后继续使用 fine-tuning 进行测试
        - 用 172 层, 还是没什么反应, 改到 516 层试试

>>> 18.3.25
- 如果去掉 23 层权重, val_loss 下降很慢
- 去掉 3 层权重, 还是下降非常慢
    - 要么去掉更少的层数
    - 要么使用更大的 lr

>>> 18.3.24
- 发现 SDD 结果提升了很多到 0.966 几, 他是如何做到的? 什么叫 部分层重训练
- 询问了下 SDD 后面优化的方向, 
- 申请 PaperSpace 服务器

>>> 18.3.23
- 垂直翻转, 改了以后, 发现 val_acc 至少可以提升到 0.85+
- 加了水平翻转, 过拟合问题解决了一大半
- 用 collar 测试, 发现使用 0.86 版已经训练好的参数, 跑的过程中
    - 效果远远不如最开始的模型
    - 而且训练集收敛的也太慢了
    - 不知道是水平翻转的问题
    - 还是 lr 设置的问题
- 不改 lr, 改变 水平翻转测试
    - 这样可行, lr = 0.001 adam
    - 水平/垂直不翻转
    - 得到 collar val_acc = 0.889, 也有可能是 random_seed 变化了

>>> 18.3.22
- 解决 .git/objects/pack 大文件的办法 http://harttle.land/2016/03/22/purge-large-files-in-gitrepo.html
- fine-tuning 的手法 https://zhuanlan.zhihu.com/p/24700347
    - 迁移学习和 fine-tuning 的区别 https://www.zhihu.com/question/49534423
    - A Comprehensive guide to Fine-tuning Deep Learning Models in Keras https://flyyufelix.github.io/2016/10/08/fine-tuning-in-keras-part2.html
- 训练的模型保存下来, 后面可以做模型融合
- 数据增强 API: https://keras-cn.readthedocs.io/en/latest/preprocessing/image/


>>> 18.3.21
- 如何将结果拼到原表中
- 为何生成结果少了一行
    - 原始文件并没有少行, 只不过在添加列名的时候, 将第一行替换掉了, 造成却行的结果
    - 但是提交结果的文件并没有这个问题, 原因何在?
    - 我找到原因了, 应该读取文件时, 应该指定 `header = -1` 或者 `header = None` 
    - 不然添加列名的时候, 会将第一行替换掉, 造成缺值
- 如何保证最后的结果是最好的那组参数? 
- fine tune 的方法

>>> 18.3.20
- Keras 保存和加载模型 http://blog.csdn.net/lujiandong1/article/details/55806435
- 保存 weights 来代替 Model
- 如何确定保存的是不是最好的模型?

>>> 18.3.19
- tqdm 作用是为任务课迭代对象, 加载进度条
- linux 下的压缩/解压命令 http://www.cnblogs.com/eoiioe/archive/2008/09/20/1294681.html
```
.zip
解压：unzip FileName.zip
压缩：zip FileName.zip DirName
```

## 规划
- 先用 Keras 跑一个 baseline 出来
- 然后再测试使用 data augmentation 提高成绩
- 进行 Fine-tuning 得到 0.97 以上成绩

## 问题

>>> ubuntu 磁盘空间不足的问题

删除 ubuntu 回收站文件 `sudo rm -fr $HOME/.local/share/Trash/files/`

>>> MemoryError 的问题


>>> 在进行 KFold 切分数据集的时候报错

查看 https://stackoverflow.com/questions/48508036/sklearn-stratifiedkfold-valueerror-supported-target-types-are-binary-mul 得知 y 必须是 label 的 1-D array, 而不能是 one-hot 编码

重新做一个 1-D array

>>> 在载入 `InceptionResNetV2` 的时候报错

```
Exception: URL fetch failure on https://github.com/fchollet/deep-learning-models/releases/download/v0.7/inception_resnet_v2_weights_tf_dim_ordering_tf_kernels_notop.h5: None -- [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:777)
```

先按照提示给出的网址, 下载了  `InceptionResNetV2` 模型

然后放入 `~/.keras/models`  

参考: https://github.com/fchollet/deep-learning-models/issues/17

>>> ValueError   
```
ValueError: Variable batch_normalization_407/moving_mean/biased already exists, disallowed. Did you mean to set reuse=True in VarScope?
```

参考: https://github.com/kratzert/finetune_alexnet_with_tensorflow/issues/8

发现, 可能是先前报错的时候, 已经加载过一次, 再次加载就会报错, 重新启动 notebook 试试

`tf.reset_default_graph()` 重置 graph 试试, 还是无法解决

参考: https://github.com/keras-team/keras/issues/9165

尝试将 tensorflow 升级到 1.4.0 看能不能解决这个问题

>>> 在 load_model 的时候遇到 `NameError: name 'imagenet_utils' is not defined` 

猜测是 `.best` 造成的错误, 将 . 改成 _ 试试, 问题并未解决

试试 `load_weights` 看能不能解决, 这个暂时放到后面测试

先试试加载 `from keras.applications import imagenet_utils` 仍然不行

将 `ModelCheckpoint` 改成 `save model` 试试, 仍然不行

测试在 `Crestle` 服务器上是否能加载, 也不行

继续测试 `load_weights`  可以解决这个问题, 只不过需要重新加载一次模型

`checkpointer` 保存是 `weights` 还是 `model`

>>> 用 cpu 跑已训练好的模型

跑到 `model.predict` 的时候 `crestle` 自动报错, 重启 kernel

尝试使用 gpu 跑试试

>>> 解压后, 导入图片报错

```
error: /io/opencv/modules/imgproc/src/resize.cpp:4044: error: (-215) ssize.width > 0 && ssize.height > 0 in function resize
```

测试使用昨天的图片, 可以正确加载

但是使用今天上传的图片, 发现无法加载 

发现是上传文件时, 没有完全上传导致, 重新上传后, 正常

>>> ResourceExhaustedError 
ResourceExhaustedError (see above for traceback): OOM when allocating tensor with shape[512,32,147,147]

>>> Failed to display Jupyter Widget of type HBox.
根据错误提示, 首先安装 ipywidgets 试试: https://ipywidgets.readthedocs.io/en/stable/user_install.html

发现仍然无法解决此问题, 仔细阅读说明后, 发现 github 阅读可能会有此问题, 通过 Jupyter notebook 阅读即可

不要怕麻烦, clone 仓库到本地尝试, 下载以后发现仍然有这个问题, 可能需要重新跑一遍

## 参考
- [Distilling the Knowledge in a Neural Network](https://arxiv.org/abs/1503.02531)