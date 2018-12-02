# FashionAI 全球挑战赛—服饰属性标签识别

队伍名称 "Du4AI", 此项目为 "FashionAI 全球挑战赛—服饰属性标签识别" 初赛代码及方案描述, 以供大赛官方审核.

## 目录结构
```
Project
|-- collar 
|-- neckline
|-- skirt
|-- sleeve
|-- neck
|-- coat
|-- lapel
|-- pant
|-- data 存放数据
    |-- base 训练集
    |-- z_rank 测试集
    |-- web warm_up 数据集
|-- ensemble 将 8 个 label 结果合并, 并提交
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
collar 属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果 collar_0418_InceptionResNetV2.csv，对应的代码 lichuan0418_InceptionResNetV2_collar.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果 collar_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_collar.ipynb

- 基于xception切分训练集的模型，生成预测结果 collar_0418_xception.csv，对应的代码lichuan0418_ Xception_collar.ipynb

- 基于xception不切分训练集的模型，生成预测结果collar_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_collar.ipynb

### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299×299大小

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.1
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（collar_0418_InceptionResNetV2.csv ×0.25 + collar_0419_InceptionResNetV2_alldata.csv ×0.25 + collar_0418_xception.csv ×0.25 + collar_0419_InceptionResNetV2_alldata.csv ×0.25）=> collar_0420a.csv

---

## neckline属性
neckline 属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果 neckline_0418_InceptionResNetV2.csv，对应的代码 lichuan0418_InceptionResNetV2_neckline.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果 neckline_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_neckline.ipynb

- 基于xception切分训练集的模型，生成预测结果 neckline_0418_xception.csv，对应的代码lichuan0418_ Xception_neckline.ipynb

- 基于xception不切分训练集的模型，生成预测结果 neckline_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_neckline.ipynb

### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299×299大小

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为 0.1
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（neckline_0418_InceptionResNetV2.csv ×0.25 + neckline_0419_InceptionResNetV2_alldata.csv ×0.25 + neckline_0418_xception.csv ×0.25 + neckline_0419_InceptionResNetV2_alldata.csv ×0.25）=> neckline_0420a.csv

---

## skirt 属性
skirt 属性由6个模型的预测结果融合而成，这6个模型分别是

- 基于 InceptionResNetV2 切分训练集的模型，生成预测结果 skirt_0418_InceptionResNetV2.csv，对应的代码 lichuan0418_InceptionResNetV2_skirt

- 基于 InceptionResNetV2 不切分训练集的模型，生成预测结果 skirt_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_skirt

- 基于 InceptionResNetV2 不切分训练集的模型，使用 warm_up 数据, 生成预测结果 skirt_0420_xception_warmup.csv，此模型对应的代码 lichuan0420_ Xception_skirt_warmup.ipynb

- 基于xception切分训练集的模型，生成预测结果 skirt_0418_xception.csv，对应的代码lichuan0418_ Xception_skirt.ipynb

- 基于xception不切分训练集的模型，生成预测结果 skirt_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_skirt.ipynb

- 基于xception 不切分训练集的模型，使用 warm_up 数据, 生成预测结果 skirt_0420_InceptionResNetV2_warmup.csv，此模型对应的代码 lichuan0420_InceptionResNetV2_skirt_warmup.ipynb

### 图像预处理
6个模型使用相同的图像预处理，将所有图像统一处理成299×299大小

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为 0.1
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（skirt_0418_InceptionResNetV2.csv + skirt_0419_InceptionResNetV2_alldata.csv + skirt_0420_xception_warmup.csv + skirt_0418_xception.csv + skirt_0419_InceptionResNetV2_alldata.csv + skirt_0420_InceptionResNetV2_warmup.csv）/ 6 => skirt_0420a.csv

---

## sleeve 属性
sleeve 属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于 InceptionResNetV2 切分训练集的模型，生成预测结果 sleeve_0418_InceptionResNetV2.csv，对应的代码 lichuan0418_InceptionResNetV2_sleeve.ipynb

- 基于 InceptionResNetV2 不切分训练集的模型，生成预测结果 sleeve_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_sleeve.ipynb

- 基于 xception 切分训练集的模型，生成预测结果 neckline_0418_xception.csv，对应的代码 lichuan0418_ Xception_sleeve.ipynb

- 基于xception不切分训练集的模型，生成预测结果 sleeve_0419_InceptionResNetV2_alldata.csv，此模型对应的代码 lichuan0419_InceptionResNetV2_alltraindata_sleeve.ipynb

### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299×299大小

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为 0.1
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是 InceptionResNetV2 和 xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的 softmax 层
- 损失函数统一使用 categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（sleeve_0418_InceptionResNetV2.csv ×0.25 + sleeve_0419_InceptionResNetV2_alldata.csv ×0.25 + sleeve_0418_xception.csv ×0.25 + sleeve_0419_InceptionResNetV2_alldata.csv ×0.25）=> sleeve_0420a.csv

---

## neck属性
neck属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果neck_0418b1.csv，对应的代码Woody0418_InceptionResNetV2_neck.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果neck_0419b_tta.csv，此模型对应的代码Woody0418_InceptionResNetV2_neck_all.ipynb

- 基于xception切分训练集的模型，生成预测结果neck_0418b2.csv，对应的代码Woody0418_Xception_neck.ipynb

- 基于xception不切分训练集的模型，生成预测结果neck_0419b_Xception_tta.csv，此模型对应的代码Woody0418_Xception_neck_all.ipynb

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（neck_0418b1.csv ×0.25 + neck_0419b_tta.csv ×0.25 + neck_0418b2.csv  ×0.25 +neck_0419b_Xception_tta.csv ×0.25）=> neck_0419b_2.csv

### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299×299大小

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为64
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了两种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（neck_0418b1.csv ×0.25 + neck_0419b_tta.csv ×0.25 + neck_0418b2.csv  ×0.25 +neck_0419b_Xception_tta.csv ×0.25）=>neck_0419b_2.csv

---

## coat属性
coat属性由3个模型的预测结果融合而成，这3个模型分别是

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果coat_0418b1.csv，此模型对应的代码Woody0418_InceptionResNetV2_coat_all.ipynb

- 基于xception切分训练集的模型，生成预测结果coat_0418b2.csv，对应的代码Woody0418_Xception_coat.ipynb

- 基于xception不切分训练集的模型，生成预测结果coat_0419b_Xception_tta.csv，此模型对应的代码Woody0418_Xception_coat_all.ipynb


### 图像预处理
3个模型使用相同的图像预处理，将所有图像统一处理成299×299大小。

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强部分width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为32
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了三种预训练模型分别是InceptionResNetV2和xception
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy


### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
（coat_0418b1.csv ×0.25 + coat_0418b2.csv ×0.25 + coat_0419b_Xception_tta.csv ×0.5）=>coat_0419b_2.csv

---

## lapel属性
lapel属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果lapel_0419_InceptionResNetV2.csv，对应的代码caijun0419_InceptionResNetV2_lapel.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果lapel_0418alldata.csv，此模型对应的代码caijun0418_InceptionResNetV2_alltraindata_lapel.ipynb

- 基于xception切分训练集的模型，生成预测结果lapel_0418a.csv，对应的代码caijun0418_ Xception_lapel.ipynb

- 基于xception不切分训练集的模型，生成预测结果lapel_0419Xception_alldata.csv，此模型对应的代码caijun0419_ Xception_lapel_alltraindata.ipynb


### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299×299大小 

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为32
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了三种预训练模型分别是InceptionResNetV2、xception和InceptionV3
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy

### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
(lapel_0418alldata.csv×0.5+lapel_0418alldata.csv×0.5)×0.5 + (lapel_0419_InceptionResNetV2.csv × 0.5+lapel_0419Xception_alldata.csv × 0.5)×0.5 = lapel_0420a.csv

---

## pant属性
pant属性由4个模型的预测结果融合而成，这4个模型分别是

- 基于InceptionResNetV2切分训练集的模型，生成预测结果pant_0419_InceptionResNetV2.csv，对应的代码caijun0419_InceptionResNetV2_pant.ipynb

- 基于InceptionResNetV2不切分训练集的模型，生成预测结果pant_0418alldata.csv，此模型对应的代码caijun0418_InceptionResNetV2_alltraindata_pant.ipynb

- 基于xception切分训练集的模型，生成预测结果pant_0418a.csv，对应的代码caijun0418_ Xception_pant.ipynb

- 基于xception不切分训练集的模型，生成预测结果pant_0419Xception_alldata.csv，此模型对应的代码caijun0419_ Xception_pant_alltraindata.ipynb


### 图像预处理
4个模型使用相同的图像预处理，将所有图像统一处理成299×299大小。

### 训练
- 所有模型的训练集分为两类，一类是切分了训练集和验证集的，使用切分的训练集进行训练，另一类是使用所有训练集进行训练
- 数据增强使用了水平翻转，width_shift_range、height_shift_range、shear_range参数统一为0.075
- batchsize为32
- 训练分为两个阶段，第一阶段的学习率为0.001，当loss不再提升时，进入第二阶段，将学习率降低到0.0001，继续训练直到loss不再提升

### 模型
- 一共使用了三种预训练模型分别是InceptionResNetV2、xception和InceptionV3
- 所有预训练模型使用相同的处理方式，去掉自带的输出层，接上和分类对应的softmax层
- 损失函数统一使用categorical_crossentropy


### 模型预测结果融合方式
不同模型的预测结果按照以下方式融合
(pant_0418alldata.csv×0.5+pant_0418alldata.csv×0.5)×0.5 + (pant_0419_InceptionResNetV2.csv × 0.5+pant_0419Xception_alldata.csv × 0.5)×0.5 = pant_0420a.csv