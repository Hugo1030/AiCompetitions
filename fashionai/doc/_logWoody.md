## 进展
>>> 18.5.30
- 尝试了在coat 数据增强里，第二轮增加旋转，结果效果有所提升
- 我拆开coat成有模特和没有模特分别训练了一下，结果有模特的val_acc 只有0.64+，但是没有模特上val_acc却有0.70+，也就是真正拖成绩后腿的上有模特的，看来之前理解错了。对比了一下round1的coat图片，发现round2的模特有更多的姿势，比如坐着、半躺着...所以难度增加。还有另外一个发现，拆开训练后，合并结果，单模val_acc 能达到0.67+，又比之前能提高0.1
    + 尝试削减姿势带来的影响：通过将图片resize成450X150,使得图片变得非常细，结果效果不好
- 尝试neck 进行OpenCV方式数据增强，结果效果也不好，主要上参数不好调
- 在neck上尝试 中途将Adam变为SDG，没有找到合适的点位，效果不佳

>>> 18.5.29
今天：
1、仿照Inception_resnet_v2看能否将不同模型concat到一起，这样只预测一次，但实际上其实上模型已经融合
--直接结合效果没有单个模型好，而且比较耗费时间，需要调整参数
-- 试验Inception_resnet_v2+Xception 用在coat上，结果收敛慢且最佳效果又差
2、尝试继续找一下多标签标签之间相互依赖的关系处理方法，比如CNN-RNN法
3、尝试着在模型最后几层进行改造，改成FCN形式的,可以用一些finetune技巧
4、有时间尝试模型可视化
5、
>>> 18.5.28
今日，主要将coat图片进行人肉标记，标记成有模特和没有模特两类，花费8小时，然后进行多标签测试，结果效果没有提升。原因：目前的多标签的loss只是单纯的把不同标签one-hot化之后，label每一个位置都是相互独立的，实际上label之间是有依赖关系的，这种方法没有体现出依赖关系，所以效果没有提升
>>> 18.5.25
>>>
今日测试：
1、在昨天的neck类型round1+round2训练基础上，finetune 分别冻结全部层和前595层
看一下效果。
发现效果变差
2、测试coat
pad + resize + flip + flip+直方均衡 + 对比拉伸,成绩0.65+，提交线上之后有
比较显著的提高
3、测试用sleeve数据集作为伪标签，训练coat
结果验证集成绩比之前的准确率提高0.01，但是val_loss却也提高了
再用已经提高的模型，再预测一遍sleeve数据集，形成准确率更高的伪标签集
进一步训练：发现准确率略微有所提高，但不是很大，tta之后成绩还降了

还有一种思路：
利用上一轮提升了成绩的模型，再次预测sleeve数据集，形成新的label，再次加入训练集
回到之前模型，重新再次训练一遍
效果也不好，因为再次对sleeve进行预测，其实已经没有多少意义，因为sleeve的数据相当于
被见过了

>>> 18.5.22
今日主要尝试yolo新思路
1、得益于醉舟的人脸快速识别模式，很快将图片集分成有人脸和无人脸模式
2、coat的标签变成多标签问题（multi-label），增加是否有人脸
3、使用keras进行多标签问题训练
修改的地方：loss 改为 ='binary_crossentropy'，激活函数需要改为sigmoid，[参考文章](https://zhuanlan.zhihu.com/p/34712246)
[Multi-label classification with Keras](https://www.pyimagesearch.com/2018/05/07/multi-label-classification-with-keras/)这篇文章应该好好研究一下
过程发现：
一上来，起步的准确率就是0.8+，我怀疑应该和softmax的标准不一样吧，之后看一下效果，目前yolo准确率还需要进一步提高

>>> 18.5.21
最近新思路：
1、尝试迁移pytorch里的图片增强，例如five-crop等用在keras模型上
2、对Inception_resnet_v2模型冻结几个block进行优化
3、对Inception_resnet_v2模型后面在加几个操作（例如卷积、全连接等）
4、切换Adam 和Momeon优化器
5、伪标签法：
例如用（neckline、neck、lapel、collar）之间的数据相互伪标签，（sleeve和coat）相互伪标签
6、tta 法： 用一个模型对同一数据集进行预处理，然后分别预测，融合
7、从round1到round2的数据全用(neck/neckline/lapel/collar)这几类初赛和复赛的分布类似，可以使用
8、yolo 分类分出来 有人和无人，打上标签，然后再进行多标签预测
9、可视化方面：1、应该查看错误标签的概率值和正确标签的概率值

今日尝试
把图片neck图片切割后再进行resize，方法通过观察图片
neck：应该保留50%上边，左右两边各去掉25%

coat 主要是看长度：
可以直接左右两边各去掉25%试试,之后输入的size是resize之后的(299,299,3)，还是（299，150，3）？

>>> 18.4.24
- 完成torch 版本的baseline 版本迁移学习改写，之后可以上手inceptionV4版本
- 提交初赛代码（attribute和keypoints）
- 涌现出新思路：
 1、用LTSM训练图片
 2、fine-tune的时候不调pre-trained模型，而是在自己已经训练好的模型参数基础上，再冻结几层

>>> 18.4.23
- 尝试用根据官方tutorial改写 训练的迁移学习脚本
 问题：loss function一直报错，数据类型有问题

>>> 18.4.22
- 看周莫凡练习pytorch基本语法
包括练习基本模型模型搭建，CNN的模型



>>> 18.4.19
- 尝试思路：
1、沐神分享的benchmark 跑一下，融合，尤其是有一个模型resnet101
2、图片的背景和前景分离，再训练
3、优化器，调整前面Adam，后面SGD


>>> 18.4.7
1、查找研究关键点的模型-musk_rnn及相关demo
2、了解CNN的location和detection
>>> 18.4.6
1、完成和调整baseline的loss部分

>>> 18.4.4
1、写完服饰关键点的baseline代码
2、提交baseline版本
3、思考模型loss

>>> 18.4.3
1、测试resnet50和resnet152，效果不理想
2、查找服饰关键点资料，写服饰关键点的baseline代码
3、学习天池比赛公共课直播课程

>>> 18.4.2
1、看论文《Sparse Deep Transfer Learning for Convolutional》
2、查找研究天池比赛服饰关键点

>>> 18.3.30

- 读paper《The Effectiveness of Data Augmentation in Image Classification using Deep Learning》  
有以下方式可以试试
>The reduce overfitting, several methods have been proposed [15]. The simplest could be to add a regularization term on the norm of the weights. Another popular techniques are dropout. Dropout works by prob- abilistically removing an neuron from designated layers during training or by dropping certain connection [10] [6]. Another popular technique is batch normalization, which normalizes layers and allows us to train the normalization weights. Batch normalization can be applied to any layer within the net and hence is very effective [12], even when used in generative adversarial networks, such as CycleGAN ([17].

> 降低过拟合方法：没有试过：  
1、by dropping certain connection [10] [6]  
[6] Y. Gal and Z. Ghahramani. A Theoretically Grounded Ap- plication of Dropout in Recurrent Neural Networks. ArXiv e-prints, Dec. 2015. 2  
[10]Y. Kubo, G. Tucker, and S. Wiesler. Compacting Neural Network Classifiers via Dropout Training. ArXiv e-prints, Nov. 2016. 2  
2、Another popular technique is batch normalization[12]   
[12]Y. Ma and D. Klabjan. Convergence analysis of batch nor- malization for deep neural nets. CoRR, abs/1705.08011, 2017. 2   
3、 when used in generative adversarial networks, such as CycleGAN [17]  
[17] S. Xiang and H. Li. On the Effects of Batch and Weight Normalization in Generative Adversarial Networks. ArXiv e-prints, Apr. 2017. 2  
4、作者的方法：The first approach is generate augmented data before training the classifier. For instance, we will apply GANs and basic transformations to create a larger dataset. All images are fed into the net at training time and at test time, only the original images are used to validate. The second approach attempts to learn augmentation through a pre- pended neural net. At training time, this neural net takes in two random images from the training set and outputs a single ”image” so that this image matches either in style or in context with a given image from the training set. This output, which represents an augmented image produced by the network, is fed into the second classifying network along with the original training data. The training loss is then back-propagated to train the augmenting layers of the
network as well as the classification layers of the network. In test time, images from the validation or test set is ran through only the classification network.
具体内容可以看论文我标注的

- fine-tune Xception 分别测试冻结前4、9、13、14层测试效果，发现效果和没有finetune效果一样，只不过训练时间变短。
本次尝试的方法略有不同：之前大家都是先生成模型，在冻结层。
先进行生成模型，然后加载之前训练的模型，最后在冻结层，试图冻结之前自己已经训练好的参数，而不是具体模型之前训练的weights



>>> 18.3.29

尝试finetune Xception
1、查一下Xception的结果，或者一般怎么finetune，感觉不同类型的结构，冻结层的方式应该不同
2、然后再进行冻结

尝试不同的优化器
1、看官网的优化器介绍
2、看网上大家怎么用优化器


>>> 18.3.28

DONE:
- 训练neck，由于neck数据量少，很容易overfit
  + 尝试激进变换数据增强参数，效果可以提升0.02
  + 尝试用Xception 进行训练neck，效果收敛比较快
- 训练 coat
  + 尝试用全量数据进行训练，可以增加准确率
TODO:
- fine-tuning
error:
- 对于数据量小的应该尝试更加激进的参数
Need：
-NIL



>>> 18.3.27
- 尝试探索VGG19和InceptionV3
方法：单纯的将InceptionResNetV2替换成VGG19和InceptionV3跑几个epoch
结果：acc一直在0.19~0.3
原因：虽然可以运行,但是不一定是正确姿势



>>> 18.3.26
- 完成coat训练，val_acc 0.86+
- 尝试multi-task learning
参考[]()

>>> 18.3.21

- DONE

  AttributeError: 'ProgbarLogger' object has no attribute 'log_values'



- TODO


- ERR
- NEED


>>> 18.3.20

- DONE
完成'neck_design_labels', 'coat_length_labels', 'lapel_design_labels',
'pant_length_labels' baseline的训练
- TODO
1、学习OpenCV
2、尝试keras的各种迁移风格
3、最后可以尝试将训练的结果进行融合

- ERR
- NEED



>>> 18.3.20

- 重点研究paperspace使用
 - 支付校验的时候需要关闭VPN
 - ML机器的无法直接使用jupyter notebook，会报错

 > No web browser found:could not locate runner browser

 需要将jupyter notebook在本地做个映射
 `ssh -L 8000:localhost:8889 paperspace@64.62.141.116`
 其中 —L 8000 为本地映射的端口
 localhost:8889 为服务器本地端口
 paperspace@64.62.141.116 远程服务器的地址
- paperspace 两个机器之间传输速度是14m/s,可以传输大文件，但是千万别传那种包含成千上万文件的文件夹，服务器这样传比较慢
类似这种命令
`scp lapel_design_labels.tar paperspace@184.105.181.123:/home/paperspace/myfile`
- 上传文件要上传tar 打包文件，而不是压缩文件  
tar 打包命令  
`tar -cvf pant_length_labels.tar pant_length_labels`  
tar 解包命令  
`tar -xvf archive_name.tar -C /home/paperspace/myfile`

检查是否tensorflow使用GPU跑
```
import tensorflow as tf

if not tf.test.gpu_device_name():
    warnings.warn('没有找到GPU.')
else:
    print('默认的GPU设备: {}'.format(tf.test.gpu_device_name()))
```
 - paperspace 坑点
   1、申请机器需要24小时才能审批
   2、支付校验需要关闭VPN
   3、中国使用的时候操作比较卡顿，CLI有延迟，jupyter notebook 刚启动特别慢，估计要等5分钟，这点最不能忍受，jupyter notebook 显示图片特别慢
   4、ML机器提供dock，但是dock只是安装了python2
   5、开一台机器收费5刀

>>> 18.3.19
