## neck属性
neck属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果neck_0418b1.csv，对应的代码Woody0418_InceptionResNetV2_neck.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果neck_0419b_tta.csv，此模型对应的代码Woody0418_InceptionResNetV2_neck_all.ipynb

- 基于xception切分训练集的模型，生成预测结果neck_0418b2.csv，对应的代码Woody0418_Xception_neck.ipynb

- 基于xception不切分训练集的模型，生成预测结果neck_0419b_Xception_tta.csv，此模型对应的代码Woody0418_Xception_neck_all.ipynb



### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299*299大小

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.01，当loss不再提升时，进入第二阶段，将学习率降低到0.001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（neck_0418b1.csv *0.25 + neck_0419b_tta.csv *0.25 + neck_0418b2.csv  *0.25 +neck_0419b_Xception_tta.csv *0.25）=>neck_0419b_2.csv

## coat属性
coat属性由3个模型的预测结果融合而成，这3个模型分别是

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果coat_0418b1.csv，此模型对应的代码Woody0418_InceptionResNetV2_coat_all.ipynb

- 基于xception切分训练集的模型，生成预测结果coat_0418b2.csv，对应的代码Woody0418_Xception_coat.ipynb

- 基于xception不切分训练集的模型，生成预测结果coat_0419b_Xception_tta.csv，此模型对应的代码Woody0418_Xception_coat_all.ipynb


### 图像预处理
3个模型使用相同的图像预处理，将所有图像统一处理成299*299大小。

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强部分width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为32
- 训练分为两个阶段，第一阶段的学习率为0.01，当loss不再提升时，进入第二阶段，将学习率降低到0.001，继续训练直到loss不再提升

### 模型
- 一共使用了三种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy


### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（coat_0418b1.csv *0.25 + coat_0418b2.csv *0.25 + coat_0419b_Xception_tta.csv *0.5）=>coat_0419b_2.csv

















