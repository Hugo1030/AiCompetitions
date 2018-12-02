# FashionAI S2 策略

## 目录结构
```
Project
|-- collar 
... 其他 7 个 label 类似
```
## 环境：
python 3.6

## 主要依赖库：
```
tensorflow 1.4.0
numpy 1.14.2
pandas 0.23.3
matplotlib 2.1.0
sklearn 0.19.1
keras 2.1.3
```

## collar属性

- [round1]()
- [round2]()

### 图像预处理
- 

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是 InceptionResNetV2 和 xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的 softmax 层
- 损失函数统一使用 categorical_crossentropy

### TTA
- 边缘填充 + 水平翻转 + 直方图 + 对比拉伸

### 模型融合
- v2 collar.best0601a_InceptionResNetV2_comb.h5 209M => collar_0601b_InceptionResNetV2.csv 4 种 tta
- xception collar.best0531a_Xception.h5 80M => collar_0601a_Xception.csv 4 种 tta

---