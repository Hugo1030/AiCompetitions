## lapel属性
lapel属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果lapel_0419_InceptionResNetV2.csv，对应的代码caijun0419_InceptionResNetV2_lapel.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果lapel_0418alldata.csv，此模型对应的代码caijun0418_InceptionResNetV2_alltraindata_lapel.ipynb

- 基于xception切分训练集的模型，生成预测结果lapel_0418a.csv，对应的代码caijun0418_ Xception_lapel.ipynb

- 基于xception不切分训练集的模型，生成预测结果lapel_0419Xception_alldata.csv，此模型对应的代码caijun0419_ Xception_lapel_alltraindata.ipynb


### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299*299大小 

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为32
- 训练分为两个阶段，第一阶段的学习率为0.01，当loss不再提升时，进入第二阶段，将学习率降低到0.001，继续训练直到loss不再提升

### 模型
- 一共使用了三种预训练模型分别是InceptionResNetV2、xception和InceptionV3
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
(lapel_0418alldata.csv*0.5+lapel_0418alldata.csv*0.5)*0.5 + (lapel_0419_InceptionResNetV2.csv * 0.5+lapel_0419Xception_alldata.csv * 0.5)*0.5

## pant属性
pant属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果pant_0419_InceptionResNetV2.csv，对应的代码caijun0419_InceptionResNetV2_pant.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果pant_0418alldata.csv，此模型对应的代码caijun0418_InceptionResNetV2_alltraindata_pant.ipynb

- 基于xception切分训练集的模型，生成预测结果pant_0418a.csv，对应的代码caijun0418_ Xception_pant.ipynb

- 基于xception不切分训练集的模型，生成预测结果pant_0419Xception_alldata.csv，此模型对应的代码caijun0419_ Xception_pant_alltraindata.ipynb


### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299*299大小。

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为32
- 训练分为两个阶段，第一阶段的学习率为0.01，当loss不再提升时，进入第二阶段，将学习率降低到0.001，继续训练直到loss不再提升

### 模型
- 一共使用了三种预训练模型分别是InceptionResNetV2、xception和InceptionV3
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy


### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
(pant_0418alldata.csv*0.5+pant_0418alldata.csv*0.5)*0.5 + (pant_0419_InceptionResNetV2.csv * 0.5+pant_0419Xception_alldata.csv * 0.5)*0.5

















