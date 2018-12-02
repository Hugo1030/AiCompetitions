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
- [SSD 定位领口]()
    - 使用 SSD 定位到脸部, 然后取

### 图像预处理
- 

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- batch_size = 32, 防止显存溢出.
- learing_rate decay
    - epoch 1, lr = 0.001
    - epoch 2, lr = 0.0001

### 模型
- 使用预制模型 InceptionResNetV2 + xception
- 去掉预制模型 输出层
- 增加 pooling 层
- 增加 dropout = 0.5 防止过拟合
- 增加 softmax, 根据

### TTA
- 边缘填充 + 水平翻转 + 直方图 + 对比拉伸

### 模型融合
- v2 collar.best0601a_InceptionResNetV2_comb.h5 209M => collar_0601b_InceptionResNetV2.csv 4 种 tta
- xception collar.best0531a_Xception.h5 80M => collar_0601a_Xception.csv 4 种 tta

### 全部合并
- 全部 8 种类型与 collar 类似处理, 然后直接 Merge 提交.