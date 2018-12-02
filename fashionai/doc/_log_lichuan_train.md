## Best Model
- InceptionResNetV2
    - round2:
        - collar: val_loss: 0.4562 - val_acc: 0.8618 tta: 0.9351| collar.best0522a_InceptionResNetV2.h5
        - neckline: val_loss: 0.6738 - val_acc: 0.7944 tta: 0.9145| neckline.best0522a_InceptionResNetV2.h5
        - skirt: val_loss: 0.7965 - val_acc: 0.7389 tta: 0.7444 | skirt.best0529a_InceptionResNetV2.h5
        - sleeve: val_loss: 0.8360 - val_acc: 0.6961 - tta: 0.7154 | sleeve.best0529a_InceptionResNetV2.h5
    - round1:
        - collar: val_loss: 0.4718 - val_acc: 0.8608 tta: 0.8754 | collar.best0530a_InceptionResNetV2_round1.h5
        - neckline: val_loss: 0.4897 - val_acc: 0.8418 | neckline.best0516a_InceptionResNetV2_round1.h5
        - skirt: val_loss: 0.4177 - val_acc: 0.8704 tta: 0.8797 | skirt.best0528a_InceptionResNetV2_round1.h5
        - sleeve: val_loss: 0.3383 - val_acc: 0.8865 - tta: 0.8950 | sleeve.best0528a_InceptionResNetV2_round1.h5
- Xception
    - round2:
        - collar: val_loss: 0.4915 - val_acc: 0.8549 tta: 0.8708 | collar.best0525a_Xcepition.h5
        - neckline: val_loss: 0.7057 - val_acc: 0.7903 tta: 0.8058| neckline.best0525a_Xcepition.h5
        - skirt: val_loss: 0.7841 - val_acc: 0.7377 tta: 0.7436 | skirt.best0529a_Xception.h5
        - sleeve: val_loss: 0.8197 - val_acc: 0.6932 tta: 0.7200 | sleeve.best0528b_Xception.h5
    - round1:
        - collar: val_loss: 0.4933 - val_acc: 0.8631 tta: 0.8767 | collar.best0527a_xception_round1.h5
        - neckline: val_loss: 0.4439 - val_acc: 0.8628 tta: 0.8814| neckline.best0527a_xception_round1.h5
        - skirt: val_loss: 0.4781 - val_acc: 0.8782 tta: 0.8860 | skirt.best0527a_xception_round1.h5
        - sleeve: val_loss: 0.3599 - val_acc: 0.8914 tta: 0.9025 | sleeve.best0527a_xception_round1.h5    

>>> 18.6.1
label: sleeve
model: sleeve.best0601a_Xception.h5
goal: 伪标签, 不做增强 2:1

Train on 26027 samples, validate on 5847 samples
Epoch 1/1
26027/26027 [==============================] - 907s 35ms/step - loss: 0.3463 - acc: 0.8852 - val_loss: 0.4629 - val_acc: 0.9653

Epoch 00001: val_loss improved from inf to 0.46286, saving model to ./models/sleeve.best0601a_Xception.h5

label: skirt
model: skirt.best0601a_Xception.h5
goal: 伪标签, 不做增强 2:1

Train on 18858 samples, validate on 4197 samples
Epoch 1/1
18858/18858 [==============================] - 681s 36ms/step - loss: 0.2689 - acc: 0.9204 - val_loss: 0.3531 - val_acc: 0.9640

Epoch 00001: val_loss improved from inf to 0.35314, saving model to ./models/skirt.best0601a_Xception.h5

label: neckline
model: neckline.best0601a_Xception.h5
goal: 伪标签, 不做增强 2:1

Train on 24535 samples, validate on 5445 samples
Epoch 1/1
24535/24535 [==============================] - 860s 35ms/step - loss: 0.1169 - acc: 0.9786 - val_loss: 0.2319 - val_acc: 0.9820

Epoch 00001: val_loss improved from inf to 0.23186, saving model to ./models/neckline.best0601a_Xception.h5

label: collar
model: collar.best0601a_Xception.h5
goal: 伪标签, 不做增强 2:1
Train on 13661 samples, validate on 3093 samples
Epoch 1/1
13661/13661 [==============================] - 491s 36ms/step - loss: 0.0532 - acc: 0.9903 - val_loss: 0.1155 - val_acc: 0.9900

Epoch 00001: val_loss improved from inf to 0.11548, saving model to ./models/collar.best0601a_Xception.h5

label: sleeve
model: sleeve.best0601a_InceptionResNetV2_comb.h5
goal: 伪标签, 不做增强 2:1

lr = 0.00001
Train on 26027 samples, validate on 5847 samples
Epoch 1/1
26027/26027 [==============================] - 927s 36ms/step - loss: 0.3836 - acc: 0.8713 - val_loss: 0.4945 - val_acc: 0.9244

Epoch 00001: val_loss improved from inf to 0.49446, saving model to ./models/sleeve.best0601a_InceptionResNetV2_comb.h5

label: skirt
model: skirt.best0601a_InceptionResNetV2_comb.h5
goal: 伪标签, 不做增强 2:1

lr = 0.00001
Train on 18858 samples, validate on 4197 samples
Epoch 1/1
18858/18858 [==============================] - 682s 36ms/step - loss: 0.3099 - acc: 0.9068 - val_loss: 0.4032 - val_acc: 0.9590

Epoch 00001: val_loss improved from inf to 0.40317, saving model to ./models/skirt.best0601a_InceptionResNetV2_comb.h5

label: neckline
model: neckline.best0601a_InceptionResNetV2_comb.h5
goal: 伪标签, 不做增强 2:1

lr = 0.00001
Train on 24535 samples, validate on 5445 samples
Epoch 1/1
24535/24535 [==============================] - 880s 36ms/step - loss: 0.1513 - acc: 0.9683 - val_loss: 0.2705 - val_acc: 0.9827

Epoch 00001: val_loss improved from inf to 0.27055, saving model to ./models/neckline.best0601a_InceptionResNetV2_comb.h5

label: collar
model: collar.best0601a_InceptionResNetV2_comb.h5
goal: 伪标签, 不做增强 2:1

lr = 0.00001
Train on 13661 samples, validate on 3093 samples
Epoch 1/1
13661/13661 [==============================] - 515s 38ms/step - loss: 0.0712 - acc: 0.9832 - val_loss: 0.1314 - val_acc: 0.9893

Epoch 00001: val_loss improved from inf to 0.13138, saving model to ./models/collar.best0601a_InceptionResNetV2_comb.h5


label: neckline
model: neckline.best0601a_InceptionResNetV2_comb.h5
goal: 测试伪标签, 不做增强

Train on 12555 samples, validate on 4197 samples
Epoch 1/1
12555/12555 [==============================] - 483s 38ms/step - loss: 0.2460 - acc: 0.9031 - val_loss: 0.4069 - val_acc: 0.9538

Epoch 00001: val_loss improved from inf to 0.40692, saving model to ./models/skirt.best0601a_InceptionResNetV2_comb.h5

label: neckline
model: neckline.best0601a_Xception_test.h5
goal: 测试伪标签, 切分 0.25 数据集出来

lr = 0.001 round1
Train on 37664 samples, validate on 12556 samples
Epoch 1/1
37664/37664 [==============================] - 1393s 37ms/step - loss: 0.7325 - acc: 0.7066 - val_loss: 0.8717 - val_acc: 0.6542

Epoch 00001: val_loss improved from inf to 0.87170, saving model to ./models/skirt.best0601a_Xception_test.h5

lr = 0.0001 round2
Train on 37664 samples, validate on 12556 samples
Epoch 1/1
37664/37664 [==============================] - 1414s 38ms/step - loss: 0.3427 - acc: 0.8623 - val_loss: 0.7739 - val_acc: 0.7354

Epoch 00001: val_loss improved from inf to 0.77395, saving model to ./models/skirt.best0601a_Xception_test.h5

lr = 0.0001 伪标签 round3
Train on 12555 samples, validate on 3139 samples
Epoch 1/1
12555/12555 [==============================] - 468s 37ms/step - loss: 0.2614 - acc: 0.9154 - val_loss: 0.9139 - val_acc: 0.7334

Epoch 00001: val_loss improved from inf to 0.91392, saving model to ./models/skirt.best0601a_Xception_test2.h5

lr = 0.00001 伪标签 round3
Train on 12555 samples, validate on 3139 samples
Epoch 1/1
12555/12555 [==============================] - 463s 37ms/step - loss: 1.4322 - acc: 0.7187 - val_loss: 0.7231 - val_acc: 0.7299

Epoch 00001: val_loss improved from inf to 0.72314, saving model to ./models/skirt.best0601a_Xception_test2.h5

-----------------------------------------------------------------
label: neckline  comb 伪标签  round3
model: neckline.best0601a_InceptionResNetV2_comb.h5
result: neckline_0601b_InceptionResNetV2.csv
goal: 伪标签, 概率

lr = 0.0001
Train on 70908 samples, validate on 21780 samples
Epoch 1/1
70908/70908 [==============================] - 2549s 36ms/step - loss: 0.1701 - acc: 0.9619 - val_loss: 0.3442 - val_acc: 0.9459

Epoch 00001: val_loss improved from inf to 0.34422, saving model to ./models/neckline.best0601a_InceptionResNetV2_comb.h5

-----------------------------------------------------------------
label: collar  comb 伪标签  round3
model: collar.best0601a_InceptionResNetV2_comb.h5
result: collar_0601b_InceptionResNetV2.csv
goal: 伪标签, 概率

lr = 0.001
Train on 48604 samples, validate on 12372 samples
Epoch 1/1
48604/48604 [==============================] - 1713s 35ms/step - loss: 0.0688 - acc: 0.9830 - val_loss: 0.1811 - val_acc: 0.9682

Epoch 00001: val_loss improved from inf to 0.18108, saving model to ./models/collar.best0601a_InceptionResNetV2_comb.h5

>>> 18.5.31
label: sleeve  4种预处理 padding+flips+flip constract + hist  round2
model: sleeve.best0531a_InceptionResNetV2.h5
result: sleeve_0531a_InceptionResNetV2.csv
tta: 0.8889
goal: round2 两阶段之二

lr = 0.0001
Train on 69140 samples, validate on 5187 samples
Epoch 1/1
69140/69140 [==============================] - 2345s 34ms/step - loss: 0.4845 - acc: 0.7955 - val_loss: 0.2844 - val_acc: 0.8799

Epoch 00001: val_loss improved from inf to 0.28436, saving model to ./models/sleeve.best0531a_InceptionResNetV2.h5

label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0531a_InceptionResNetV2.h5
goal: round2 两阶段之一

lr = 0.001
Train on 69140 samples, validate on 5187 samples
Epoch 1/1
69140/69140 [==============================] - 2311s 33ms/step - loss: 0.9837 - acc: 0.6101 - val_loss: 0.7679 - val_acc: 0.6900

Epoch 00001: val_loss improved from inf to 0.76785, saving model to ./models/sleeve.best0531a_InceptionResNetV2.h5

label: neckline  4种预处理 padding+flips+flip constract + hist  round2
model: neckline.best0531a_Xcepiton.h5
result: neckline_0531a_Xcepiton.csv
tta: 0.9957
goal: round2 两阶段之二

lr = 0.0001
Train on 69140 samples, validate on 5187 samples
Epoch 1/1
69140/69140 [==============================] - 2526s 37ms/step - loss: 0.4656 - acc: 0.8007 - val_loss: 0.0000e+00 - val_acc: 1.0000

Epoch 00001: val_loss improved from inf to 0.00000, saving model to ./models/sleeve.best0531a_Xception.h5

label: neckline  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: neckline.best0531a_Xcepiton.h5
goal: round2 两阶段之一

lr = 0.001
Train on 69140 samples, validate on 5187 samples
Epoch 1/1
69140/69140 [==============================] - 2527s 37ms/step - loss: 0.9785 - acc: 0.6089 - val_loss: 0.7594 - val_acc: 0.7016

Epoch 00001: val_loss improved from inf to 0.75941, saving model to ./models/sleeve.best0531a_Xception.h5

-----------------------------------------------------------------
label: neckline  4种预处理 padding+flips+flip constract + hist  round2
model: neckline.best0531a_InceptionResNetV2.h5
result: neckline_0531a_InceptionResNetV2.csv
tta: 0.9977
goal: round2 两阶段之二

lr = 0.0001



label: neckline  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: neckline.best0531a_InceptionResNetV2.h5
goal: round2 两阶段之一

lr = 0.001
Train on 65504 samples, validate on 4914 samples
Epoch 1/1
65504/65504 [==============================] - 2169s 33ms/step - loss: 0.7185 - acc: 0.7587 - val_loss: 0.4423 - val_acc: 0.8610

Epoch 00001: val_loss improved from inf to 0.44235, saving model to ./models/neckline.best0531a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: neckline  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: neckline.best0531a_InceptionResNetV2_round1.h5
tta: 
goal: round1 

lr = 0.001
Train on 61724 samples, validate on 3147 samples
Epoch 1/1
61724/61724 [==============================] - 2499s 40ms/step - loss: 0.8322 - acc: 0.7182 - val_loss: 7.8527 - val_acc: 0.4137

Epoch 00001: val_loss improved from inf to 7.85272, saving model to ./models/neckline.best0531a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 61724 samples, validate on 3147 samples
Epoch 1/1
61724/61724 [==============================] - 2497s 40ms/step - loss: 0.2992 - acc: 0.9015 - val_loss: 8.8084 - val_acc: 0.4665

Epoch 00001: val_loss improved from inf to 8.80836, saving model to ./models/neckline.best0531a_InceptionResNetV2_round1.h5

-----------------------------------------------------------------
label: neckline  4种预处理 padding+flips+flip constract + hist  round2
model: neckline.best0531a_Xcepiton.h5
result: neckline_0531a_Xcepiton.csv
tta: 0.9957
goal: round2 两阶段之二

lr = 0.0001
Train on 65504 samples, validate on 4914 samples
Epoch 1/1
65504/65504 [==============================] - 2320s 35ms/step - loss: 0.1945 - acc: 0.9385 - val_loss: 0.0561 - val_acc: 0.9835

Epoch 00001: val_loss improved from inf to 0.05614, saving model to ./models/neckline.best0531a_Xception.h5

label: neckline  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: neckline.best0531a_Xcepiton.h5
goal: round2 两阶段之一

lr = 0.001
Train on 65504 samples, validate on 4914 samples
Epoch 1/1
65504/65504 [==============================] - 2169s 33ms/step - loss: 0.2078 - acc: 0.9322 - val_loss: 0.0723 - val_acc: 0.9807

Epoch 00001: val_loss improved from inf to 0.07231, saving model to ./models/neckline.best0531a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: collar  4种预处理 padding+flips+flip constract + hist  round2
model: collar.best0531a_InceptionResNetV2.h5
result: collar_0531a_InceptionResNetV2.csv
tta: 0.9977
goal: round2 两阶段之二

lr = 0.0001
Train on 36232 samples, validate on 2718 samples
Epoch 1/1
36232/36232 [==============================] - 1228s 34ms/step - loss: 0.1037 - acc: 0.9651 - val_loss: 0.0262 - val_acc: 0.9948

Epoch 00001: val_loss improved from inf to 0.02616, saving model to ./models/collar.best0531a_InceptionResNetV2.h5



label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: collar.best0531a_InceptionResNetV2.h5
goal: round2 两阶段之一

lr = 0.001
Train on 36232 samples, validate on 2718 samples
Epoch 1/1
36232/36232 [==============================] - 1226s 34ms/step - loss: 0.4225 - acc: 0.8430 - val_loss: 0.7280 - val_acc: 0.8904

Epoch 00001: val_loss improved from inf to 0.72798, saving model to ./models/collar.best0531a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: collar  4种预处理 padding+flips+flip constract + hist  round2
model: collar.best0531a_Xcepiton.h5
result: skirt_0531a_Xcepiton.csv
tta: 0.9977
goal: round2 两阶段之二

lr = 0.0001
Train on 36232 samples, validate on 2718 samples
Epoch 1/1
36232/36232 [==============================] - 1255s 35ms/step - loss: 0.0974 - acc: 0.9665 - val_loss: 0.0160 - val_acc: 0.9948

Epoch 00001: val_loss improved from inf to 0.01602, saving model to ./models/collar.best0531a_Xception.h5

label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: collar.best0529b_Xcepiton.h5
goal: round2 两阶段之一

lr = 0.001
Train on 36232 samples, validate on 2718 samples
Epoch 1/1
36232/36232 [==============================] - 1256s 35ms/step - loss: 0.4374 - acc: 0.8398 - val_loss: 0.2778 - val_acc: 0.8977

Epoch 00001: val_loss improved from inf to 0.27784, saving model to ./models/collar.best0531a_Xception.h5

-----------------------------------------------------------------
label: skirt  4种预处理 padding+flips+flip constract + hist  round2
model: skirt.best0529b_InceptionResNetV2.h5
result: skirt_0531a_InceptionResNetV2.csv
tta: 0.9124
goal: round2 两阶段之二

lr = 0.0001
0.2548 0.9068


label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0529b_InceptionResNetV2.h5
goal: round2 两阶段之一

lr = 0.001
Train on 50220 samples, validate on 3768 samples
Epoch 1/1
50220/50220 [==============================] - 1768s 35ms/step - loss: 0.7309 - acc: 0.7027 - val_loss: 0.6540 - val_acc: 0.7359

Epoch 00001: val_loss improved from inf to 0.65401, saving model to ./models/skirt.best0531a_InceptionResNetV2.h5


-----------------------------------------------------------------
label: skirt  4种预处理 padding+flips+flip constract + hist  round2
model: skirt.best0530a_Xcepiton.h5
result: skirt_0531a_Xception.csv
tta: 0.9092
goal: round2 两阶段之二

lr = 0.0001 
Train on 50220 samples, validate on 3768 samples
Epoch 1/1
50220/50220 [==============================] - 1789s 36ms/step - loss: 0.3708 - acc: 0.8481 - val_loss: 0.2315 - val_acc: 0.9018

Epoch 00001: val_loss improved from inf to 0.23147, saving model to ./models/skirt.best0530a_Xception.h5

>>> 18.5.30
label: skirt  4种预处理 pad+rotate 20+rotate -20 + flip 对比拉伸 round2
model: skirt.best0530a_InceptionResNetV2.h5
result: skirt_0530a_Xception.csv
tta: 0.8702
goal: round2 两阶段之二

lr = 0.0001
Train on 50220 samples, validate on 3768 samples
Epoch 1/1
50220/50220 [==============================] - 1779s 35ms/step - loss: 2.8234 - acc: 0.5098 - val_loss: 0.8615 - val_acc: 0.8583

Epoch 00001: val_loss improved from inf to 0.86148, saving model to ./models/skirt.best0530a_Xception.h5

-----------------------------------------------------------------

label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0529b_InceptionResNetV2.h5
goal: round2 两阶段之一

lr = 0.001
Train on 50220 samples, validate on 3768 samples
Epoch 1/1
50220/50220 [==============================] - 1775s 35ms/step - loss: 0.7296 - acc: 0.7061 - val_loss: 0.6162 - val_acc: 0.7611

Epoch 00001: val_loss improved from inf to 0.61624, saving model to ./models/skirt.best0530a_Xception_lr1.h5

-----------------------------------------------------------------
label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: collar.best0530a_Xception_round1.h5
tta: 0.8610
goal: round1 全数据集到底有没有用?

lr = 0.001

lr = 0.0001
Train on 30208 samples, validate on 6360 samples
Epoch 1/1
30208/30208 [==============================] - 1076s 36ms/step - loss: 0.7286 - acc: 0.8674 - val_loss: 0.5146 - val_acc: 0.8411

Epoch 00001: val_loss improved from inf to 0.00000, saving model to ./models/collar.best0530a_xception_round1.h5

-----------------------------------------------------------------
label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: collar.best0530a_InceptionResNetV2.h5
result: collar_0530a_InceptionResNetV2.csv
tta: 0.9988
goal: round2 重训

lr = 0.001
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1282s 35ms/step - loss: 0.4768 - acc: 0.8222 - val_loss: 0.3016 - val_acc: 0.9007

Epoch 00001: val_loss improved from inf to 0.30165, saving model to ./models/collar.best0530a_InceptionResNetV2.h5
CPU times: user 25min 14s, sys: 3min 37s, total: 28min 52s
Wall time: 21min 50s

lr = 0.0001
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1285s 35ms/step - loss: 0.1607 - acc: 0.9427 - val_loss: 0.0575 - val_acc: 0.9859

Epoch 00001: val_loss improved from inf to 0.05746, saving model to ./models/collar.best0530a_InceptionResNetV2.h5
CPU times: user 25min 27s, sys: 3min 37s, total: 29min 4s
Wall time: 22min 2s

-----------------------------------------------------------------
label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: collar.best0530a_InceptionResNetV2_round1.h5
result: 
tta: 0.8754
goal: round1 重训

lr = 0.001
Train on 33568 samples, validate on 6360 samples
Epoch 1/1
33568/33568 [==============================] - 1492s 44ms/step - loss: 0.6719 - acc: 0.7588 - val_loss: 0.8866 - val_acc: 0.7528

Epoch 00001: val_loss improved from inf to 0.88660, saving model to ./models/collar.best0530a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 33568 samples, validate on 6360 samples
Epoch 1/1
33568/33568 [==============================] - 1488s 44ms/step - loss: 0.2201 - acc: 0.9265 - val_loss: 0.4718 - val_acc: 0.8608

Epoch 00001: val_loss improved from inf to 0.47176, saving model to ./models/collar.best0530a_InceptionResNetV2_round1.h5

>>> 18.5.29
```
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0529b_InceptionResNetV2.h5
result: skirt_0529b_InceptionResNetV2.csv
tta: 0.7444
goal: round1 重训练后的 round2 全数据

lr = 0.001
Train on 50220 samples, validate on 5024 samples
Epoch 1/1
50220/50220 [==============================] - 1677s 33ms/step - loss: 0.7273 - acc: 0.7045 - val_loss: 0.6110 - val_acc: 0.7663

Epoch 00001: val_loss improved from inf to 0.61103, saving model to ./models/skirt.best0529b_InceptionResNetV2.h5

lr = 0.0001
Train on 50220 samples, validate on 5024 samples
Epoch 1/1
50220/50220 [==============================] - 1678s 33ms/step - loss: 0.3779 - acc: 0.8456 - val_loss: 0.2407 - val_acc: 0.9084

Epoch 00001: val_loss improved from inf to 0.24065, saving model to ./models/skirt.best0529b_InceptionResNetV2.h5

-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0529a_Xception.h5
result: skirt_0529a_Xception.csv
tta: 0.7444
goal: round1 重训练后的 round2 + label smooth

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1575s 35ms/step - loss: 0.7290 - acc: 0.7061 - val_loss: 0.8139 - val_acc: 0.6610

Epoch 00001: val_loss improved from inf to 0.81389, saving model to ./models/skirt.best0529a_Xception.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1601s 35ms/step - loss: 0.3493 - acc: 0.8573 - val_loss: 0.7841 - val_acc: 0.7377

Epoch 00001: val_loss improved from inf to 0.78407, saving model to ./models/skirt.best0529a_Xception.h5

-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0529a_InceptionResNetV2.h5
result: skirt_0529a_InceptionResNetV2.csv
tta: 0.7444
goal: round1 重训练后的 round2 

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1518s 34ms/step - loss: 0.7296 - acc: 0.7046 - val_loss: 0.8218 - val_acc: 0.6744

Epoch 00001: val_loss improved from inf to 0.82176, saving model to ./models/skirt.best0529a_InceptionResNetV2.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1520s 34ms/step - loss: 0.3696 - acc: 0.8483 - val_loss: 0.7965 - val_acc: 0.7389

Epoch 00001: val_loss improved from inf to 0.79651, saving model to ./models/skirt.best0529a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: skirt.best0528a_InceptionResNetV2_round1.h5
result: 
tta: 0.8797
goal: round1 重训

lr = 0.001
Train on 36892 samples, validate on 7020 samples
Epoch 1/1
36892/36892 [==============================] - 1598s 43ms/step - loss: 0.6079 - acc: 0.7778 - val_loss: 0.7497 - val_acc: 0.7855

Epoch 00001: val_loss improved from inf to 0.74972, saving model to ./models/skirt.best0529a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 36892 samples, validate on 7020 samples
Epoch 1/1
36892/36892 [==============================] - 1600s 43ms/step - loss: 0.1609 - acc: 0.9441 - val_loss: 0.4177 - val_acc: 0.8704

Epoch 00001: val_loss improved from inf to 0.41773, saving model to ./models/skirt.best0528a_InceptionResNetV2_round1.h5

-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0529a_InceptionResNetV2.h5
result: sleeve_0529a_InceptionResNetV2.csv
tta: 0.7154
goal: round1 重训练后的 round2 

lr = 0.001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2127s 34ms/step - loss: 0.9944 - acc: 0.6099 - val_loss: 1.0676 - val_acc: 0.5813

Epoch 00001: val_loss improved from inf to 1.06762, saving model to ./models/sleeve.best0529a_InceptionResNetV2.h5

lr = 0.0001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2137s 34ms/step - loss: 0.4731 - acc: 0.7995 - val_loss: 0.8360 - val_acc: 0.6961

Epoch 00001: val_loss improved from inf to 0.83601, saving model to ./models/sleeve.best0529a_InceptionResNetV2.h5
```


>>> 18.5.28
```
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0528a_InceptionResNetV2_round1.h5
tta: 0.8432
goal: round2 全数据重训练+label smoothing

lr = 0.001
Train on 69140 samples, validate on 6916 samples
Epoch 1/1
69140/69140 [==============================] - 2360s 34ms/step - loss: 0.7471 - acc: 0.5699 - val_loss: 1.1898 - val_acc: 0.6447

Epoch 00001: val_loss improved from inf to 1.18976, saving model to ./models/sleeve.best0528a_InceptionResNetV2.h5

lr = 0.0001
Train on 69140 samples, validate on 6916 samples
Epoch 1/1
69140/69140 [==============================] - 2362s 34ms/step - loss: 0.2724 - acc: 0.7469 - val_loss: 1.1182 - val_acc: 0.8323

Epoch 00001: val_loss improved from inf to 1.11820, saving model to ./models/sleeve.best0528a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: sleeve.best0528a_InceptionResNetV2_round1.h5
tta: 0.8950
goal: round1 全数据重训练

lr = 0.001
Train on 53196 samples, validate on 10136 samples
Epoch 1/1
53196/53196 [==============================] - 2305s 43ms/step - loss: 0.6023 - acc: 0.7801 - val_loss: 0.6552 - val_acc: 0.7907

Epoch 00001: val_loss improved from inf to 0.65516, saving model to ./models/sleeve.best0528a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 53196 samples, validate on 10136 samples
Epoch 1/1
53196/53196 [==============================] - 2311s 43ms/step - loss: 0.1575 - acc: 0.9461 - val_loss: 0.3383 - val_acc: 0.8865

Epoch 00001: val_loss improved from inf to 0.33832, saving model to ./models/sleeve.best0528a_InceptionResNetV2_round1.h5

-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0528a_xception.h5
result: sleeve_0528b_Xception.csv
tta: 0.7200
goal: round2 测试 label_smooth, m=0.1

lr = 0.001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2293s 37ms/step - loss: 0.9877 - acc: 0.6081 - val_loss: 1.0945 - val_acc: 0.5849

Epoch 00001: val_loss improved from inf to 1.09453, saving model to ./models/sleeve.best0528b_Xception.h5

lr = 0.0001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2319s 37ms/step - loss: 0.4620 - acc: 0.8048 - val_loss: 0.8197 - val_acc: 0.6932

Epoch 00001: val_loss improved from inf to 0.81973, saving model to ./models/sleeve.best0528b_Xception.h5

-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0528a_xception_round1.h5
result: sleeve_0528a_Xception.csv
tta: 0.9190
goal: round2 全数据

lr = 0.001
Train on 69140 samples, validate on 6916 samples
Epoch 1/1
69140/69140 [==============================] - 2524s 37ms/step - loss: 0.9838 - acc: 0.6092 - val_loss: 0.7489 - val_acc: 0.6845

Epoch 00001: val_loss improved from inf to 0.74887, saving model to ./models/sleeve.best0528a_Xception.h5

lr = 0.0001
Train on 69140 samples, validate on 6916 samples
Epoch 1/1
69140/69140 [==============================] - 2445s 35ms/step - loss: 0.4521 - acc: 0.8084 - val_loss: 0.2363 - val_acc: 0.9014

Epoch 00001: val_loss improved from inf to 0.23627, saving model to ./models/sleeve.best0528a_Xception.h5
-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0528a_xception_round1.h5
result: skirt_0528a_Xception.csv
tta: 0.9307
goal: round2 全数据

lr = 0.001
Train on 50220 samples, validate on 5024 samples
Epoch 1/1
50220/50220 [==============================] - 1761s 35ms/step - loss: 0.7292 - acc: 0.7036 - val_loss: 0.6003 - val_acc: 0.7450

Epoch 00001: val_loss improved from inf to 0.60033, saving model to ./models/skirt.best0528a_Xception.h5

lr = 0.0001
Train on 50220 samples, validate on 5024 samples
Epoch 1/1
50220/50220 [==============================] - 1825s 36ms/step - loss: 0.3560 - acc: 0.8538 - val_loss: 0.2040 - val_acc: 0.9228

Epoch 00001: val_loss improved from inf to 0.20400, saving model to ./models/skirt.best0528a_Xception.h5
```

>>> 18.5.27
```
label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: collar.best0527a_xception_round1.h5
result: collar_0527a_Xception.csv
tta: 0.9955
goal: round2 全数据

lr = 0.001

lr = 0.0001
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1269s 35ms/step - loss: 0.1495 - acc: 0.9471 - val_loss: 0.0514 - val_acc: 0.9865

Epoch 00001: val_loss improved from inf to 0.05143, saving model to ./models/neckline_0527a_InceptionResNetV2

-----------------------------------------------------------------
label: neckline  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: neckline.best0527a_xception_round1.h5
result: neckline_0527a_Xception.csv
tta: 0.9938
goal: round2 全数据

lr = 0.001
Train on 65504 samples, validate on 6552 samples
Epoch 1/1
65504/65504 [==============================] - 2331s 36ms/step - loss: 0.7861 - acc: 0.7343 - val_loss: 0.5366 - val_acc: 0.8191

Epoch 00001: val_loss improved from inf to 0.53659, saving model to ./models/neckline.best0527a_Xception.h5

lr = 0.0001
Train on 65504 samples, validate on 6552 samples
Epoch 1/1
65504/65504 [==============================] - 2297s 35ms/step - loss: 0.2649 - acc: 0.9110 - val_loss: 0.0924 - val_acc: 0.9722

Epoch 00001: val_loss improved from inf to 0.09239, saving model to ./models/neckline.best0527a_Xception.h5
-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: sleeve.best0527a_xception_round1.h5
tta: 0.9025
goal: round1 全数据

lr = 0.001
Train on 53196 samples, validate on 10136 samples
Epoch 1/1
53196/53196 [==============================] - 1879s 35ms/step - loss: 0.5207 - acc: 0.8125 - val_loss: 0.5912 - val_acc: 0.7880

Epoch 00001: val_loss improved from inf to 0.59122, saving model to ./models/sleeve.best0527a_xception_round1.h5

lr = 0.0001
Train on 53196 samples, validate on 10136 samples
Epoch 1/1
53196/53196 [==============================] - 1841s 35ms/step - loss: 0.1117 - acc: 0.9625 - val_loss: 0.3599 - val_acc: 0.8914

Epoch 00001: val_loss improved from inf to 0.35990, saving model to ./models/sleeve.best0527a_xception_round1.h5

-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: skirt.best0527a_xception_round1.h5
tta: 0.8860
goal: round1 全数据

lr = 0.001
Train on 36892 samples, validate on 7020 samples
Epoch 1/1
36892/36892 [==============================] - 1282s 35ms/step - loss: 0.4937 - acc: 0.8260 - val_loss: 0.6548 - val_acc: 0.7815

Epoch 00001: val_loss improved from inf to 0.65477, saving model to ./models/skirt.best0527a_xception_round1.h5

lr = 0.0001
Train on 36892 samples, validate on 7020 samples
Epoch 1/1
36892/36892 [==============================] - 1287s 35ms/step - loss: 0.0966 - acc: 0.9673 - val_loss: 0.4781 - val_acc: 0.8782

Epoch 00001: val_loss improved from inf to 0.47807, saving model to ./models/skirt.best0527a_xception_round1.h5

-----------------------------------------------------------------
label: neckline  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: neckline.best0527a_xception_round1.h5
tta: 0.8814
goal: round1 全数据


lr = 0.001
Train on 68584 samples, validate on 12588 samples
Epoch 1/1
68584/68584 [==============================] - 2430s 35ms/step - loss: 0.6748 - acc: 0.7759 - val_loss: 0.6649 - val_acc: 0.7973

Epoch 00001: val_loss improved from inf to 0.66491, saving model to ./models/neckline.best0527a_xception_round1.h5

lr = 0.0001
Train on 68584 samples, validate on 12588 samples
Epoch 1/1
68584/68584 [==============================] - 2462s 36ms/step - loss: 0.2122 - acc: 0.9305 - val_loss: 0.4439 - val_acc: 0.8628

Epoch 00001: val_loss improved from inf to 0.44386, saving model to ./models/neckline.best0527a_xception_round1.h5
-----------------------------------------------------------------
label: collar  4种预处理 pad+flip+翻转直方+对比拉伸 round1
model: sleeve.best0527a_xception_round1.h5
tta: 0.8767
goal: round1 全数据

lr = 0.001
Train on 33568 samples, validate on 6360 samples
Epoch 1/1
33568/33568 [==============================] - 1185s 35ms/step - loss: 0.5651 - acc: 0.7978 - val_loss: 1.0337 - val_acc: 0.6739

Epoch 00001: val_loss improved from inf to 1.03365, saving model to ./models/collar.best0527a_xception_round1.h5

lr = 0.0001
Train on 33568 samples, validate on 6360 samples
Epoch 1/1
33568/33568 [==============================] - 1225s 36ms/step - loss: 0.1434 - acc: 0.9509 - val_loss: 0.4933 - val_acc: 0.8631

Epoch 00001: val_loss improved from inf to 0.49331, saving model to ./models/collar.best0527a_xception_round1.h5

-----------------------------------------------------------------

label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0527a_InceptionResNetV2.h5
result: sleeve_0527a_InceptionResNetV2.cs
tta: 0.8918
goal: 全数据

lr = 0.001
Train on 69140 samples, validate on 6916 samples
Epoch 1/1
69140/69140 [==============================] - 2488s 36ms/step - loss: 1.0491 - acc: 0.5803 - val_loss: 0.8365 - val_acc: 0.6703

Epoch 00001: val_loss improved from inf to 0.83651, saving model to ./models/sleeve.best0527a_InceptionResNetV2.h5

lr = 0.0001
Train on 69140 samples, validate on 6916 samples
Epoch 1/1
69140/69140 [==============================] - 2508s 36ms/step - loss: 0.5253 - acc: 0.7800 - val_loss: 0.3142 - val_acc: 0.8739

Epoch 00001: val_loss improved from inf to 0.31419, saving model to ./models/sleeve.best0527a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0527a_InceptionResNetV2.h5
result: skirt_0527a_InceptionResNetV2.cs
tta: 0.8996
goal: 全数据

lr = 0.001
Train on 50220 samples, validate on 5024 samples
Epoch 1/1
50220/50220 [==============================] - 1711s 34ms/step - loss: 0.7676 - acc: 0.6890 - val_loss: 0.6837 - val_acc: 0.7199

Epoch 00001: val_loss improved from inf to 0.68367, saving model to ./models/skirt.best0527a_InceptionResNetV2.h5

lr = 0.0001
Train on 50220 samples, validate on 5024 samples
Epoch 1/1
50220/50220 [==============================] - 1710s 34ms/step - loss: 0.4086 - acc: 0.8342 - val_loss: 0.2663 - val_acc: 0.8999

Epoch 00001: val_loss improved from inf to 0.26632, saving model to ./models/skirt.best0527a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: neckline  4种预处理 crop+pad+flip+翻转直方 round2
model: neckline.best0527a_InceptionResNetV2.h5
result: neckline_0527a_InceptionResNetV2.cs
tta: 0.9963
goal: 全数据

lr = 0.001
Train on 65504 samples, validate on 6552 samples
Epoch 1/1
65504/65504 [==============================] - 2357s 36ms/step - loss: 0.8417 - acc: 0.7151 - val_loss: 0.5994 - val_acc: 0.7990

Epoch 00001: val_loss improved from inf to 0.59944, saving model to ./models/neckline.best0527a_InceptionResNetV2.h5
CPU times: user 39min 8s, sys: 8min 5s, total: 47min 14s
Wall time: 39min 39s

lr = 0.0001
Train on 65504 samples, validate on 6552 samples
Epoch 1/1
65504/65504 [==============================] - 2283s 35ms/step - loss: 0.3142 - acc: 0.8943 - val_loss: 0.1454 - val_acc: 0.9582

Epoch 00001: val_loss improved from inf to 0.14541, saving model to ./models/neckline.best0527a_InceptionResNetV2.h5
CPU times: user 39min 18s, sys: 7min 41s, total: 46min 59s
Wall time: 38min 28s

-----------------------------------------------------------------
label: collar  4种预处理 crop+pad+flip+翻转直方 round2
model: collar.best0527a_InceptionResNetV2.h5
result: collar_0527a_InceptionResNetV2.cs
tta: 0.9980
goal: 全数据

lr = 0.001
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1357s 37ms/step - loss: 0.5253 - acc: 0.8046 - val_loss: 0.3979 - val_acc: 0.8515

Epoch 00001: val_loss improved from inf to 0.39795, saving model to ./models/collar.best0527a_InceptionResNetV2.h5
CPU times: user 24min 22s, sys: 4min 11s, total: 28min 34s
Wall time: 23min 2s

lr = 0.0001
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1310s 36ms/step - loss: 0.1784 - acc: 0.9374 - val_loss: 0.0657 - val_acc: 0.9782

Epoch 00001: val_loss improved from inf to 0.06573, saving model to ./models/collar.best0527a_InceptionResNetV2.h5
CPU times: user 22min 15s, sys: 4min 20s, total: 26min 36s
Wall time: 22min 15s

```

>>> 18.5.26
```
label: neckline  4种预处理 crop+pad+flip+翻转直方 round2
model: neckline.best0526a_InceptionResNetV2.h5
result: neckline_0526a_InceptionResNetV2.cs
tta: 0.9566
goal: 添加 crop 作为特征放入, 且减少一种预处理, 防止过拟合

lr = 0.001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2004s 34ms/step - loss: 0.8499 - acc: 0.7129 - val_loss: 0.9764 - val_acc: 0.6828

Epoch 00001: val_loss improved from inf to 0.97639, saving model to ./models/neckline.best0526a_InceptionResNetV2.h5
CPU times: user 36min 57s, sys: 6min 16s, total: 43min 14s
Wall time: 33min 49s

lr = 0.0001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2007s 34ms/step - loss: 0.3115 - acc: 0.8970 - val_loss: 0.6738 - val_acc: 0.7944

Epoch 00001: val_loss improved from inf to 0.67384, saving model to ./models/neckline.best0526a_InceptionResNetV2.h5
CPU times: user 37min, sys: 6min 15s, total: 43min 16s
Wall time: 33min 54s

-----------------------------------------------------------------
label: collar  4种预处理 crop+pad+flip+翻转直方 round2
model: collar.best0526b_InceptionResNetV2.h5
result: collar_0526a_InceptionResNetV2.cs
tta: 0.9682
goal: 添加 crop 作为特征放入, 且减少一种预处理, 防止过拟合

lr = 0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1126s 35ms/step - loss: 0.5357 - acc: 0.7991 - val_loss: 0.7862 - val_acc: 0.7354

Epoch 00001: val_loss improved from inf to 0.78616, saving model to ./models/collar.best0526b_InceptionResNetV2.h5
CPU times: user 20min 54s, sys: 3min 31s, total: 24min 25s
Wall time: 19min 10s

lr = 0.0001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1131s 35ms/step - loss: 0.1795 - acc: 0.9358 - val_loss: 0.4135 - val_acc: 0.8576

Epoch 00001: val_loss improved from inf to 0.41349, saving model to ./models/collar.best0526b_InceptionResNetV2.h5
CPU times: user 21min 1s, sys: 3min 30s, total: 24min 32s
Wall time: 19min 18s

-----------------------------------------------------------------
label: collar  5种预处理 crop+pad+flip+翻转直方+拉伸 round2
model: collar.best0526a_InceptionResNetV2.h5
result: collar_0526a_InceptionResNetV2.cs
tta: 0.9717
goal: 添加 crop 作为特征放入

lr = 0.001
Train on 40760 samples, validate on 4530 samples
Epoch 1/1
40760/40760 [==============================] - 1378s 34ms/step - loss: 0.4966 - acc: 0.8157 - val_loss: 0.4876 - val_acc: 0.8097

Epoch 00001: val_loss improved from inf to 0.48762, saving model to ./models/collar.best0526a_InceptionResNetV2.h5
CPU times: user 24min 22s, sys: 4min 32s, total: 28min 55s
Wall time: 23min 18s

lr = 0.0001
Train on 40760 samples, validate on 4530 samples
Epoch 1/1
40760/40760 [==============================] - 1384s 34ms/step - loss: 0.1380 - acc: 0.9515 - val_loss: 0.4645 - val_acc: 0.8508

Epoch 00001: val_loss improved from inf to 0.46449, saving model to ./models/collar.best0526a_InceptionResNetV2.h5
CPU times: user 24min 34s, sys: 4min 35s, total: 29min 9s
Wall time: 23min 26s

```

>>> 18.5.25
```
label: collar  4种预处理  pad+flip+翻转直方+拉伸 round2
model: collar.best0525a_Xcepiton.h5
result: collar_0525a_Xcepiton.csv
tta: 0.8708
goal: 测试 xcepition

lr = 0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1169s 36ms/step - loss: 0.5829 - acc: 0.7788 - val_loss: 0.5944 - val_acc: 0.7839

Epoch 00001: val_loss improved from inf to 0.59440, saving model to ./models/collar.best0525a_Xception.h5

lr = 0.0001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1194s 37ms/step - loss: 0.1266 - acc: 0.9569 - val_loss: 0.4915 - val_acc: 0.8549

Epoch 00001: val_loss improved from inf to 0.49149, saving model to ./models/collar.best0525a_Xcepition.h5

-----------------------------------------------------------------
label: neckline  4种预处理  pad+flip+翻转直方+拉伸 round2
model: neckline.best0525a_InceptionResNetV2.h5
result: neckline_0525a_Xception.cs
tta: 0.8058
goal: 测试 xcepition

lr = 0.001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2066s 35ms/step - loss: 1.0312 - acc: 0.6507 - val_loss: 0.8677 - val_acc: 0.7123

Epoch 00001: val_loss improved from inf to 0.86770, saving model to ./models/neckline.best0525a_Xception.h5

lr = 0.0001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2142s 36ms/step - loss: 0.2863 - acc: 0.9059 - val_loss: 0.7057 - val_acc: 0.7903

Epoch 00001: val_loss improved from inf to 0.70575, saving model to ./models/neckline.best0525a_Xcepition.h5

-----------------------------------------------------------------
label: skirt  4种预处理  pad+flip+翻转直方+拉伸 round2
model: skirt.best0525a_InceptionResNetV2.h5
result: skirt_0525a_Xception.cs
tta: 0.7253
goal: 测试 xcepition

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1625s 36ms/step - loss: 0.8605 - acc: 0.6451 - val_loss: 0.9575 - val_acc: 0.6258

Epoch 00001: val_loss improved from inf to 0.95747, saving model to ./models/skirt.best0525a_Xception.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1593s 35ms/step - loss: 0.4430 - acc: 0.8225 - val_loss: 0.7821 - val_acc: 0.7189

Epoch 00001: val_loss improved from inf to 0.78215, saving model to ./models/skirt.best0525a_Xcepition.h5

-----------------------------------------------------------------
label: sleeve  4种预处理  pad+flip+翻转直方+拉伸 round2
model: sleeve.best0525a_xception.h5
result: sleeve_0525a_Xception.csv
tta: 0.6599
goal: 测试 xcepition

lr = 0.001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2221s 36ms/step - loss: 1.2239 - acc: 0.5091 - val_loss: 1.1333 - val_acc: 0.5506

Epoch 00001: val_loss improved from inf to 1.13328, saving model to ./models/sleeve.best0525a_Xception.h5

lr = 0.0001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2190s 35ms/step - loss: 0.6536 - acc: 0.7159 - val_loss: 0.9085 - val_acc: 0.6501

Epoch 00001: val_loss improved from inf to 0.90846, saving model to ./models/sleeve.best0525a_Xcepition.h5

-----------------------------------------------------------------
label: collar  4种预处理  pad+flip+翻转直方+拉伸 round2
model: collar.best0525a_InceptionResNetV2.h5
result: collar_0525a_InceptionResNetV2.cs
tta: 0.8509
goal: batch_size = 64 对比 32, pad 对比 crop

lr = 0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1341s 41ms/step - loss: 0.5464 - acc: 0.7962 - val_loss: 0.7028 - val_acc: 0.7558

Epoch 00001: val_loss improved from inf to 0.70278, saving model to ./models/collar.best0525a_InceptionResNetV2.h5

lr = 0.0001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1350s 41ms/step - loss: 0.1527 - acc: 0.9466 - val_loss: 0.4453 - val_acc: 0.8504

Epoch 00001: val_loss improved from inf to 0.44529, saving model to ./models/collar.best0525a_InceptionResNetV2.h5


-----------------------------------------------------------------
label: neckline  4种预处理  pad+flip+翻转直方+拉伸 round2
model: neckline.best0525b_InceptionResNetV2.h5
result: neckline_0525b_InceptionResNetV2.cs
tta: 0.8131
goal: batch_size = 64 对比 32

lr = 0.001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2359s 40ms/step - loss: 0.8754 - acc: 0.7037 - val_loss: 0.9807 - val_acc: 0.6642

Epoch 00001: val_loss improved from inf to 0.98072, saving model to ./models/neckline.best0525b_InceptionResNetV2.h5

lr = 0.0001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2427s 41ms/step - loss: 0.2777 - acc: 0.9077 - val_loss: 0.6896 - val_acc: 0.7891

Epoch 00001: val_loss improved from inf to 0.68961, saving model to ./models/neckline.best0525b_InceptionResNetV2.h5

-----------------------------------------------------------------
label: neckline  4种预处理  pad+flip+翻转直方+拉伸 round2
model: neckline.best0525a_InceptionResNetV2.h5
result: neckline_0525a_InceptionResNetV2.cs
tta: 0.7967
goal: 对比 crop 看看是否真的有效


lr = 0.001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 1975s 33ms/step - loss: 0.7740 - acc: 0.7388 - val_loss: 0.9378 - val_acc: 0.6946

Epoch 00001: val_loss improved from inf to 0.93782, saving model to ./models/neckline.best0525a_InceptionResNetV2.h5

lr = 0.0001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 1975s 34ms/step - loss: 0.2078 - acc: 0.9316 - val_loss: 0.7977 - val_acc: 0.7805

Epoch 00001: val_loss improved from inf to 0.79775, saving model to ./models/neckline.best0525a_InceptionResNetV2.h5
```

>>> 18.5.23
```
label: collar  4种预处理 crop+flip+翻转直方+拉伸 round2
model: collar.best0524b_InceptionResNetV2.h5
result: collar_0524b_InceptionResNetV2.cs
tta: 0.9351
goal: 冲最优解

lr = 0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1135s 35ms/step - loss: 0.4943 - acc: 0.8197 - val_loss: 0.6051 - val_acc: 0.7792

Epoch 00001: val_loss improved from inf to 0.60513, saving model to ./models/collar.best0524b_InceptionResNetV2.h5
CPU times: user 20min 48s, sys: 3min 35s, total: 24min 23s
Wall time: 19min 18s

lr = 0.0001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1140s 35ms/step - loss: 0.1344 - acc: 0.9536 - val_loss: 0.4562 - val_acc: 0.8618

Epoch 00001: val_loss improved from inf to 0.45617, saving model to ./models/collar.best0523b_InceptionResNetV2.h5
CPU times: user 20min 51s, sys: 3min 36s, total: 24min 27s
Wall time: 19min 24s

-----------------------------------------------------------------
label: neckline  4种预处理 crop+flip+翻转直方+拉伸 round2
model: neckline.best0524b_InceptionResNetV2.h5
result: neckline_0524a_InceptionResNetV2.cs
tta: 0.9145
goal: 冲最优解

lr = 0.001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2038s 35ms/step - loss: 0.8180 - acc: 0.7267 - val_loss: 1.1960 - val_acc: 0.6864

Epoch 00001: val_loss improved from inf to 1.19600, saving model to ./models/neckline.best0524a_InceptionResNetV2.h5
CPU times: user 36min 43s, sys: 6min 30s, total: 43min 13s
Wall time: 34min 23s

lr = 0.0001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 2008s 34ms/step - loss: 0.2551 - acc: 0.9143 - val_loss: 0.6747 - val_acc: 0.8017

Epoch 00001: val_loss improved from inf to 0.67467, saving model to ./models/neckline.best0523b_InceptionResNetV2.h5
CPU times: user 36min 36s, sys: 6min 26s, total: 43min 2s
Wall time: 33min 52s

-----------------------------------------------------------------
label: skirt  4种预处理 pad+flip+翻转直方+拉伸 round2
model: skirt.best0524b_InceptionResNetV2.h5
result: skirt_0524a_InceptionResNetV2.cs
tta: 0.7460
goal: 冲最优解

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1656s 37ms/step - loss: 0.7730 - acc: 0.6846 - val_loss: 0.8267 - val_acc: 0.6831

Epoch 00001: val_loss improved from inf to 0.82674, saving model to ./models/skirt.best0524b_InceptionResNetV2.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1635s 36ms/step - loss: 0.4125 - acc: 0.8308 - val_loss: 0.7463 - val_acc: 0.7309

Epoch 00001: val_loss improved from inf to 0.74630, saving model to ./models/skirt.best0524b_InceptionResNetV2.h5

-----------------------------------------------------------------
label: collar  4种预处理 pad+flip+翻转高斯 round2
model: collar.best0524a_InceptionResNetV2.h5
result: collar_0524a_InceptionResNetV2.csv
tta: 0.8609
goal: pad 对比 face_crop 裁剪对结果的影响

lr = 0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1175s 36ms/step - loss: 0.4626 - acc: 0.8266 - val_loss: 0.5684 - val_acc: 0.7897

Epoch 00001: val_loss improved from inf to 0.56845, saving model to ./models/collar.best0524a_InceptionResNetV2.h5

lr = 0.0001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1178s 36ms/step - loss: 0.1134 - acc: 0.9602 - val_loss: 0.4754 - val_acc: 0.8549

Epoch 00001: val_loss improved from inf to 0.47539, saving model to ./models/collar.best0524a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: skirt  finetune 4种预处理 crop+flip+翻转高斯 round2
model: skirt.best0524a_InceptionResNetV2.h5
result: skirt_0524a_InceptionResNetV2.csv
goal: 裁剪对结果的影响

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1591s 35ms/step - loss: 0.8880 - acc: 0.6419 - val_loss: 0.9530 - val_acc: 0.6218

Epoch 00001: val_loss improved from inf to 0.95301, saving model to ./models/skirt.best0524a_InceptionResNetV2.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1602s 35ms/step - loss: 0.5319 - acc: 0.7839 - val_loss: 0.8212 - val_acc: 0.6923

Epoch 00001: val_loss improved from inf to 0.82121, saving model to ./models/skirt.best0524a_InceptionResNetV2.h5

-----------------------------------------------------------------
label: sleeve  finetune 3种预处理 crop+flip+翻转高斯 round2
model: sleeve.best0524c_InceptionResNetV2.h5
result: sleeve_0524c_InceptionResNetV2.csv
goal: 三种预处理和四种的区别

lr = 0.001
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1659s 36ms/step - loss: 1.1365 - acc: 0.5502 - val_loss: 1.1972 - val_acc: 0.5545

Epoch 00001: val_loss improved from inf to 1.19721, saving model to ./models/sleeve.best0524c_InceptionResNetV2.h5

lr = 0.0001
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1660s 36ms/step - loss: 0.6317 - acc: 0.7369 - val_loss: 0.8285 - val_acc: 0.6663

Epoch 00001: val_loss improved from inf to 0.82852, saving model to ./models/sleeve.best0524c_InceptionResNetV2.h5

-----------------------------------------------------------------
label: sleeve  finetune 4种预处理 pad+flip+翻转高斯+直方均衡 round2
model: sleeve.best0524c_InceptionResNetV2.h5
result: sleeve_0524c_InceptionResNetV2.csv
goal: finetune

lr = 0.001 冻结
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 757s 12ms/step - loss: 1.7139 - acc: 0.3651 - val_loss: 1.5822 - val_acc: 0.4088

Epoch 00001: val_loss improved from inf to 1.58216, saving model to ./models/sleeve.best0524c_InceptionResNetV2.h5

lr = 0.0001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2188s 35ms/step - loss: 0.9199 - acc: 0.6288 - val_loss: 0.9008 - val_acc: 0.6417

Epoch 00001: val_loss improved from inf to 0.90084, saving model to ./models/sleeve.best0524c_InceptionResNetV2.h5

lr = 0.00001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2198s 35ms/step - loss: 0.4859 - acc: 0.7973 - val_loss: 0.8629 - val_acc: 0.6716

Epoch 00001: val_loss improved from inf to 0.86294, saving model to ./models/sleeve.best0524c_InceptionResNetV2.h5

-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转高斯+直方均衡 round2
model: sleeve.best0524b_InceptionResNetV2.h5
result: sleeve_0524b_InceptionResNetV2.csv
tta: 0.6888
goal: 测试 lr 减小

lr = 0.001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2182s 35ms/step - loss: 1.0672 - acc: 0.5733 - val_loss: 0.9736 - val_acc: 0.5975

Epoch 00001: val_loss improved from inf to 0.97360, saving model to ./models/sleeve.best0524b_InceptionResNetV2.h5

lr = 0.0001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2184s 35ms/step - loss: 0.5312 - acc: 0.7764 - val_loss: 0.8303 - val_acc: 0.6755

Epoch 00001: val_loss improved from inf to 0.83030, saving model to ./models/sleeve.best0524b_InceptionResNetV2.h5

-----------------------------------------------------------------
label: sleeve  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: sleeve.best0524a_InceptionResNetV2.h5
result: sleeve_0524a_InceptionResNetV2.csv
tta: 0.6871 

lr = 0.001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2146s 34ms/step - loss: 1.0604 - acc: 0.5781 - val_loss: 1.0823 - val_acc: 0.5849

Epoch 00001: val_loss improved from inf to 1.08233, saving model to ./models/sleeve.best0524a_InceptionResNetV2.h5

lr = 0.0005
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2190s 35ms/step - loss: 0.5733 - acc: 0.7612 - val_loss: 0.8197 - val_acc: 0.6780

Epoch 00001: val_loss improved from inf to 0.81967, saving model to ./models/sleeve.best0524a_InceptionResNetV2.h5

```
>>> 18.5.23
```
label: lapel  全数据 + 4种预处理 crop+flip+翻转高斯+直方均衡 round2
model: lapel.best0523a_InceptionResNetV2.h5
result: lapel_0523a_InceptionResNetV2.csv 

lr = 0.001
Train on 35504 samples, validate on 3552 samples
Epoch 1/1
35504/35504 [==============================] - 1239s 35ms/step - loss: 0.9238 - acc: 0.6442 - val_loss: 0.9008 - val_acc: 0.6565

Epoch 00001: val_loss improved from inf to 0.90085, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
CPU times: user 20min 37s, sys: 3min 53s, total: 24min 31s
Wall time: 21min 4s

lr = 0.00005
Train on 35504 samples, validate on 3552 samples
Epoch 1/1
35504/35504 [==============================] - 1240s 35ms/step - loss: 0.4370 - acc: 0.8438 - val_loss: 0.2369 - val_acc: 0.9248

Epoch 00001: val_loss improved from inf to 0.23692, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
CPU times: user 20min 43s, sys: 3min 48s, total: 24min 31s
Wall time: 21min 5s
-----------------------------------------------------------------
label: neckline  全数据 + 4种预处理 crop+flip+翻转高斯+直方均衡 round2
model: neckline.best0523a_InceptionResNetV2.h5
result: neckline_0523b_InceptionResNetV2.csv tta

lr = 0.001
Train on 65504 samples, validate on 6552 samples
Epoch 1/1
65504/65504 [==============================] - 2247s 34ms/step - loss: 0.8466 - acc: 0.7168 - val_loss: 0.5011 - val_acc: 0.8292

Epoch 00001: val_loss improved from inf to 0.50108, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
CPU times: user 36min 58s, sys: 7min 8s, total: 44min 7s
Wall time: 37min 51s

lr = 0.00005
Train on 65504 samples, validate on 6552 samples
Epoch 1/1
65504/65504 [==============================] - 2249s 34ms/step - loss: 0.3118 - acc: 0.8950 - val_loss: 0.1608 - val_acc: 0.9502

Epoch 00001: val_loss improved from inf to 0.16078, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
CPU times: user 37min 1s, sys: 7min 6s, total: 44min 8s
Wall time: 37min 54s

-----------------------------------------------------------------
label: collar  全数据 + 4种预处理 crop+flip+翻转高斯+直方均衡 round2
model: collar.best0523a_InceptionResNetV2.h5
result: collar_0523c_InceptionResNetV2.csv tta

lr = 0.001
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1221s 34ms/step - loss: 0.5138 - acc: 0.8103 - val_loss: 0.3602 - val_acc: 0.8607

Epoch 00001: val_loss improved from inf to 0.36016, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
CPU times: user 21min 55s, sys: 3min 58s, total: 25min 53s
Wall time: 20min 43s

lr = 0.00005
Train on 36232 samples, validate on 3624 samples
Epoch 1/1
36232/36232 [==============================] - 1220s 34ms/step - loss: 0.1710 - acc: 0.9383 - val_loss: 0.0986 - val_acc: 0.9650

Epoch 00001: val_loss improved from inf to 0.09858, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
CPU times: user 21min 56s, sys: 3min 57s, total: 25min 53s
Wall time: 20min 42s


-----------------------------------------------------------------
label: lapel  3种预处理 face_crop + 水平翻转 + 水平翻转/高斯噪声 + 直方均衡 round2
model: lapel.best0523a_InceptionResNetV2.h5
result: lapel_0523a_InceptionResNetV2.csv
tta: 0.8556

lr = 0.001
Epoch 1/32
249/249 [==============================] - 312s 1s/step - loss: 0.8463 - acc: 0.6863 - val_loss: 0.7880 - val_acc: 0.7072

Epoch 00001: val_loss improved from inf to 0.78802, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 2/32
249/249 [==============================] - 260s 1s/step - loss: 0.5805 - acc: 0.7853 - val_loss: 0.6965 - val_acc: 0.7556

Epoch 00002: val_loss improved from 0.78802 to 0.69653, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 3/32
249/249 [==============================] - 260s 1s/step - loss: 0.5147 - acc: 0.8136 - val_loss: 1.1497 - val_acc: 0.6757

Epoch 00003: val_loss did not improve
Epoch 4/32
249/249 [==============================] - 260s 1s/step - loss: 0.4449 - acc: 0.8386 - val_loss: 0.6701 - val_acc: 0.7815

Epoch 00004: val_loss improved from 0.69653 to 0.67010, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 5/32
249/249 [==============================] - 260s 1s/step - loss: 0.3843 - acc: 0.8607 - val_loss: 0.6625 - val_acc: 0.7770

Epoch 00005: val_loss improved from 0.67010 to 0.66254, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 6/32
249/249 [==============================] - 260s 1s/step - loss: 0.3736 - acc: 0.8652 - val_loss: 0.5676 - val_acc: 0.7984

Epoch 00006: val_loss improved from 0.66254 to 0.56760, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 7/32
249/249 [==============================] - 260s 1s/step - loss: 0.3541 - acc: 0.8722 - val_loss: 0.9651 - val_acc: 0.6351

Epoch 00007: val_loss did not improve
Epoch 8/32
249/249 [==============================] - 260s 1s/step - loss: 0.3323 - acc: 0.8752 - val_loss: 0.4266 - val_acc: 0.8581

Epoch 00008: val_loss improved from 0.56760 to 0.42660, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 9/32
249/249 [==============================] - 260s 1s/step - loss: 0.2849 - acc: 0.8931 - val_loss: 0.5776 - val_acc: 0.8007

Epoch 00009: val_loss did not improve
Epoch 10/32
249/249 [==============================] - 260s 1s/step - loss: 0.2627 - acc: 0.9013 - val_loss: 0.4969 - val_acc: 0.8131

Epoch 00010: val_loss did not improve
Epoch 11/32
249/249 [==============================] - 260s 1s/step - loss: 0.2483 - acc: 0.9093 - val_loss: 0.5406 - val_acc: 0.8356

Epoch 00011: val_loss did not improve
CPU times: user 1h 18min 53s, sys: 9min 42s, total: 1h 28min 35s
Wall time: 49min 3s

adam = Adam(lr=1e-4)

Epoch 1/32
249/249 [==============================] - 308s 1s/step - loss: 0.1638 - acc: 0.9403 - val_loss: 0.3838 - val_acc: 0.8750

Epoch 00001: val_loss improved from inf to 0.38376, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 2/32
249/249 [==============================] - 260s 1s/step - loss: 0.1192 - acc: 0.9593 - val_loss: 0.4110 - val_acc: 0.8851

Epoch 00002: val_loss did not improve
Epoch 3/32
249/249 [==============================] - 260s 1s/step - loss: 0.0979 - acc: 0.9652 - val_loss: 0.4280 - val_acc: 0.8818

Epoch 00003: val_loss did not improve
Epoch 4/32
249/249 [==============================] - 260s 1s/step - loss: 0.0764 - acc: 0.9737 - val_loss: 0.4630 - val_acc: 0.8818

Epoch 00004: val_loss did not improve
CPU times: user 28min 52s, sys: 3min 36s, total: 32min 28s
Wall time: 18min 31s

adam = Adam(lr=1e-5)
Epoch 1/32
249/249 [==============================] - 312s 1s/step - loss: 0.1226 - acc: 0.9565 - val_loss: 0.3711 - val_acc: 0.8806

Epoch 00001: val_loss improved from inf to 0.37110, saving model to ./models/lapel.best0523a_InceptionResNetV2.h5
Epoch 2/32
249/249 [==============================] - 261s 1s/step - loss: 0.1172 - acc: 0.9576 - val_loss: 0.3719 - val_acc: 0.8840

Epoch 00002: val_loss did not improve
Epoch 3/32
249/249 [==============================] - 261s 1s/step - loss: 0.1105 - acc: 0.9613 - val_loss: 0.3742 - val_acc: 0.8851

Epoch 00003: val_loss did not improve
Epoch 4/32
249/249 [==============================] - 261s 1s/step - loss: 0.1072 - acc: 0.9616 - val_loss: 0.3841 - val_acc: 0.8840

Epoch 00004: val_loss did not improve
CPU times: user 29min, sys: 3min 38s, total: 32min 38s
Wall time: 18min 38s

-----------------------------------------------------------------
label: neckline  3种预处理 face_crop + 水平翻转 + 水平翻转/高斯噪声 + 直方均衡 round2
model: neckline.best0523a_InceptionResNetV2.h5
result: neckline_0523a_InceptionResNetV2.csv
tta: 0.8556

adam = Adam(lr=1e-3)

Epoch 1/32
460/460 [==============================] - 533s 1s/step - loss: 1.3352 - acc: 0.5230 - val_loss: 1.2527 - val_acc: 0.5684

Epoch 00001: val_loss improved from inf to 1.25275, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 2/32
460/460 [==============================] - 480s 1s/step - loss: 1.0200 - acc: 0.6387 - val_loss: 0.9201 - val_acc: 0.6764

Epoch 00002: val_loss improved from 1.25275 to 0.92012, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 3/32
460/460 [==============================] - 481s 1s/step - loss: 0.8945 - acc: 0.6784 - val_loss: 0.8884 - val_acc: 0.6880

Epoch 00003: val_loss improved from 0.92012 to 0.88844, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 4/32
460/460 [==============================] - 482s 1s/step - loss: 0.8194 - acc: 0.7106 - val_loss: 0.8519 - val_acc: 0.6941

Epoch 00004: val_loss improved from 0.88844 to 0.85188, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 5/32
460/460 [==============================] - 482s 1s/step - loss: 0.7513 - acc: 0.7346 - val_loss: 0.8894 - val_acc: 0.6880

Epoch 00005: val_loss did not improve
Epoch 6/32
460/460 [==============================] - 483s 1s/step - loss: 0.6782 - acc: 0.7573 - val_loss: 0.8983 - val_acc: 0.6880

Epoch 00006: val_loss did not improve
Epoch 7/32
460/460 [==============================] - 483s 1s/step - loss: 0.6357 - acc: 0.7737 - val_loss: 0.8906 - val_acc: 0.7076

Epoch 00007: val_loss did not improve
Epoch 8/32
  6/460 [..............................] - ETA: 7:37 - loss: 0.6383 - acc: 0.7917KeyboardInterrupt
CPU times: user 1h 34min 44s, sys: 11min 21s, total: 1h 46min 6s
Wall time: 57min 43s

adam = Adam(lr=1e-4)

Epoch 1/32
460/460 [==============================] - 531s 1s/step - loss: 0.5748 - acc: 0.7944 - val_loss: 0.7090 - val_acc: 0.7534

Epoch 00001: val_loss improved from inf to 0.70898, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 2/32
460/460 [==============================] - 481s 1s/step - loss: 0.4868 - acc: 0.8272 - val_loss: 0.7017 - val_acc: 0.7601

Epoch 00002: val_loss improved from 0.70898 to 0.70169, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 3/32
460/460 [==============================] - 480s 1s/step - loss: 0.4248 - acc: 0.8487 - val_loss: 0.7213 - val_acc: 0.7650

Epoch 00003: val_loss did not improve
Epoch 4/32
460/460 [==============================] - 481s 1s/step - loss: 0.3964 - acc: 0.8581 - val_loss: 0.7187 - val_acc: 0.7747

Epoch 00004: val_loss did not improve
Epoch 5/32
460/460 [==============================] - 481s 1s/step - loss: 0.3481 - acc: 0.8771 - val_loss: 0.7416 - val_acc: 0.7729

Epoch 00005: val_loss did not improve
Epoch 6/32
 11/460 [..............................] - ETA: 7:32 - loss: 0.3242 - acc: 0.8864KeyboardInterrupt
CPU times: user 1h 6min 34s, sys: 8min 22s, total: 1h 14min 56s
Wall time: 41min 36s

adam = Adam(lr=1e-5)
Epoch 1/32
460/460 [==============================] - 532s 1s/step - loss: 0.4107 - acc: 0.8538 - val_loss: 0.7194 - val_acc: 0.7668

Epoch 00001: val_loss improved from inf to 0.71939, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 2/32
460/460 [==============================] - 482s 1s/step - loss: 0.4059 - acc: 0.8556 - val_loss: 0.7248 - val_acc: 0.7662

Epoch 00002: val_loss did not improve
Epoch 3/32
460/460 [==============================] - 482s 1s/step - loss: 0.3956 - acc: 0.8609 - val_loss: 0.7272 - val_acc: 0.7674

Epoch 00003: val_loss did not improve
Epoch 4/32
100/460 [=====>........................] - ETA: 6:03 - loss: 0.3964 - acc: 0.8559KeyboardInterrupt
CPU times: user 43min 13s, sys: 5min 23s, total: 48min 37s
Wall time: 27min 6s

Epoch 1/32
460/460 [==============================] - 530s 1s/step - loss: 0.4230 - acc: 0.8497 - val_loss: 0.7165 - val_acc: 0.7674

Epoch 00001: val_loss improved from inf to 0.71649, saving model to ./models/neckline.best0523a_InceptionResNetV2.h5
Epoch 2/32
434/460 [===========================>..] - ETA: 26s - loss: 0.4131 - acc: 0.8527

------------------------------------------------------------
label: collar  4种预处理 face_crop + 水平翻转 + 水平翻转/高斯噪声 + 直方均衡 round2
model: collar.best0523a_InceptionResNetV2.h5
result: collar_0523a_InceptionResNetV2.csv => tta | collar_0523b_InceptionResNetV2.csv 不做 tta
tta = 0.9801

adam = Adam(lr=1e-3)

Epoch 1/32
254/254 [==============================] - 325s 1s/step - loss: 0.7240 - acc: 0.7315 - val_loss: 1.3791 - val_acc: 0.6501

Epoch 00001: val_loss improved from inf to 1.37906, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 2/32
254/254 [==============================] - 267s 1s/step - loss: 0.5703 - acc: 0.7881 - val_loss: 1.0736 - val_acc: 0.7230

Epoch 00002: val_loss improved from 1.37906 to 1.07362, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 3/32
254/254 [==============================] - 267s 1s/step - loss: 0.4894 - acc: 0.8195 - val_loss: 0.8524 - val_acc: 0.7042

Epoch 00003: val_loss improved from 1.07362 to 0.85245, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 4/32
254/254 [==============================] - 267s 1s/step - loss: 0.4221 - acc: 0.8428 - val_loss: 0.6309 - val_acc: 0.7594

Epoch 00004: val_loss improved from 0.85245 to 0.63089, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 5/32
254/254 [==============================] - 266s 1s/step - loss: 0.3944 - acc: 0.8562 - val_loss: 0.5297 - val_acc: 0.8135

Epoch 00005: val_loss improved from 0.63089 to 0.52966, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 6/32
254/254 [==============================] - 266s 1s/step - loss: 0.3415 - acc: 0.8754 - val_loss: 0.4726 - val_acc: 0.8444

Epoch 00006: val_loss improved from 0.52966 to 0.47260, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 7/32
254/254 [==============================] - 266s 1s/step - loss: 0.3040 - acc: 0.8851 - val_loss: 0.4555 - val_acc: 0.8433

Epoch 00007: val_loss improved from 0.47260 to 0.45552, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 8/32
254/254 [==============================] - 266s 1s/step - loss: 0.2959 - acc: 0.8913 - val_loss: 0.6726 - val_acc: 0.7903

Epoch 00008: val_loss did not improve
Epoch 9/32
254/254 [==============================] - 266s 1s/step - loss: 0.2674 - acc: 0.9017 - val_loss: 0.5624 - val_acc: 0.8333

Epoch 00009: val_loss did not improve
Epoch 10/32
254/254 [==============================] - 266s 1s/step - loss: 0.2452 - acc: 0.9112 - val_loss: 0.6008 - val_acc: 0.8068

Epoch 00010: val_loss did not improve
Epoch 11/32
  5/254 [..............................] - ETA: 4:10 - loss: 0.3313 - acc: 0.8625KeyboardInterrupt
CPU times: user 1h 12min 54s, sys: 8min 52s, total: 1h 21min 47s
Wall time: 45min 58s

adam = Adam(lr=1e-4)

Epoch 1/32
254/254 [==============================] - 329s 1s/step - loss: 0.1868 - acc: 0.9318 - val_loss: 0.3794 - val_acc: 0.8709

Epoch 00001: val_loss improved from inf to 0.37940, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 2/32
254/254 [==============================] - 266s 1s/step - loss: 0.1312 - acc: 0.9514 - val_loss: 0.4124 - val_acc: 0.8764

Epoch 00002: val_loss did not improve
Epoch 3/32
254/254 [==============================] - 266s 1s/step - loss: 0.1158 - acc: 0.9580 - val_loss: 0.4284 - val_acc: 0.8830

Epoch 00003: val_loss did not improve
Epoch 4/32
 14/254 [>.............................] - ETA: 4:02 - loss: 0.1067 - acc: 0.9621KeyboardInterrupt
CPU times: user 23min 9s, sys: 2min 48s, total: 25min 58s
Wall time: 15min 2s

adam = Adam(lr=1e-5)

Epoch 1/32
254/254 [==============================] - 335s 1s/step - loss: 0.1361 - acc: 0.9520 - val_loss: 0.4015 - val_acc: 0.8742

Epoch 00001: val_loss improved from inf to 0.40153, saving model to ./models/collar_2.best0523a_InceptionResNetV2.h5
Epoch 2/32
254/254 [==============================] - 267s 1s/step - loss: 0.1360 - acc: 0.9525 - val_loss: 0.3993 - val_acc: 0.8797

Epoch 00002: val_loss improved from 0.40153 to 0.39926, saving model to ./models/collar_2.best0523a_InceptionResNetV2.h5
Epoch 3/32
254/254 [==============================] - 267s 1s/step - loss: 0.1274 - acc: 0.9546 - val_loss: 0.4035 - val_acc: 0.8764

Epoch 00003: val_loss did not improve
Epoch 4/32
254/254 [==============================] - 267s 1s/step - loss: 0.1245 - acc: 0.9562 - val_loss: 0.4078 - val_acc: 0.8764

Epoch 00004: val_loss did not improve
Epoch 5/32
  8/254 [..............................] - ETA: 4:09 - loss: 0.0968 - acc: 0.9648KeyboardInterrupt
CPU times: user 30min 9s, sys: 3min 42s, total: 33min 51s
Wall time: 19min 32s

adam = Adam(lr=1e-6)

Epoch 1/32
254/254 [==============================] - 313s 1s/step - loss: 0.1266 - acc: 0.9541 - val_loss: 0.4017 - val_acc: 0.8764

Epoch 00001: val_loss improved from inf to 0.40166, saving model to ./models/collar.best0523a_InceptionResNetV2.h5
Epoch 2/32
254/254 [==============================] - 265s 1s/step - loss: 0.1212 - acc: 0.9598 - val_loss: 0.4026 - val_acc: 0.8797

Epoch 00002: val_loss did not improve
Epoch 3/32
254/254 [==============================] - 265s 1s/step - loss: 0.1260 - acc: 0.9543 - val_loss: 0.4032 - val_acc: 0.8797

Epoch 00003: val_loss did not improve
Epoch 4/32
113/254 [============>.................] - ETA: 2:21 - loss: 0.1387 - acc: 0.9501KeyboardInterrupt
CPU times: user 25min 23s, sys: 3min 13s, total: 28min 36s
Wall time: 16min 21s

```


>>> 18.5.22
```
label: skirt  4种预处理 pad+flip+翻转直方+对比拉伸 round2
model: skirt.best0522a_InceptionResNetV2.h5
result: skirt_0522a_InceptionResNetV2.csv
tta : 0.7380

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1527s 34ms/step - loss: 0.7742 - acc: 0.6829 - val_loss: 0.8296 - val_acc: 0.6742

Epoch 00001: val_loss improved from inf to 0.82963, saving model to ./models/skirt.best0522a_InceptionResNetV2.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1529s 34ms/step - loss: 0.4052 - acc: 0.8365 - val_loss: 0.7443 - val_acc: 0.7309

Epoch 00001: val_loss improved from inf to 0.74427, saving model to ./models/skirt.best0522a_InceptionResNetV2.h5

------------------------------------------------------------
label: neckline  4种预处理 crop+flip+翻转高斯+直方均衡 round2
model: neckline.best0522a_InceptionResNetV2.h5
result: neckline_0522a_InceptionResNetV2.csv

lr = 0.001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 1986s 34ms/step - loss: 0.8587 - acc: 0.7141 - val_loss: 1.0685 - val_acc: 0.6746

Epoch 00001: val_loss improved from inf to 1.06855, saving model to ./models/neckline.best0522a_InceptionResNetV2.h5

lr = 0.0001
Train on 58952 samples, validate on 6552 samples
Epoch 1/1
58952/58952 [==============================] - 1998s 34ms/step - loss: 0.2917 - acc: 0.9035 - val_loss: 0.6754 - val_acc: 0.8007

Epoch 00001: val_loss improved from inf to 0.67537, saving model to ./models/neckline.best0522a_InceptionResNetV2.h5


------------------------------------------------------------
label: collar  4种预处理 crop+flip+翻转高斯+直方均衡 round2
model: collar.best0522a_InceptionResNetV2.h5
result: collar_0522b_InceptionResNetV2.csv tta

lr = 0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1101s 34ms/step - loss: 0.5274 - acc: 0.8055 - val_loss: 0.4883 - val_acc: 0.8193

Epoch 00001: val_loss improved from inf to 0.48831, saving model to ./models/collar.best0522a_InceptionResNetV2.h5

lr = 0.0001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1110s 34ms/step - loss: 0.1496 - acc: 0.9482 - val_loss: 0.4485 - val_acc: 0.8698

Epoch 00001: val_loss improved from inf to 0.44849, saving model to ./models/collar.best0522a_InceptionResNetV2.h5

------------------------------------------------------------
label: collar  2种预处理 crop+flip round2
model: collar.best0522a_InceptionResNetV2.h5
result: collar_0522a_InceptionResNetV2.csv

lr = 0.001
Train on 16304 samples, validate on 1812 samples
Epoch 1/1
16304/16304 [==============================] - 576s 35ms/step - loss: 0.6083 - acc: 0.7727 - val_loss: 0.4826 - val_acc: 0.8267

Epoch 00001: val_loss improved from inf to 0.48263, saving model to ./models/collar.best0522a_InceptionResNetV2.h5

lr = 0.0001
Train on 16304 samples, validate on 1812 samples
Epoch 1/1
16304/16304 [==============================] - 576s 35ms/step - loss: 0.2543 - acc: 0.9095 - val_loss: 0.4027 - val_acc: 0.8510

Epoch 00001: val_loss improved from inf to 0.40265, saving model to ./models/collar.best0522a_InceptionResNetV2.h5


```

>>> 18.5.21
```
label: skirt  4种预处理 round2
model: skirt.best0521a_InceptionResNetV2.h5
result: skirt_0521a_InceptionResNetV2.csv

lr = 0.001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1592s 35ms/step - loss: 0.8395 - acc: 0.6614 - val_loss: 0.8560 - val_acc: 0.6437

Epoch 00001: val_loss improved from inf to 0.85604, saving model to ./models/skirt.best0521a_InceptionResNetV2.h5

lr = 0.0001
Train on 45196 samples, validate on 5024 samples
Epoch 1/1
45196/45196 [==============================] - 1575s 35ms/step - loss: 0.4700 - acc: 0.8115 - val_loss: 0.7507 - val_acc: 0.7106

Epoch 00001: val_loss improved from inf to 0.75066, saving model to ./models/skirt.best0521a_InceptionResNetV2.h5

------------------------------------------------------------
label: sleeve  4种预处理 round2
model: sleeve.best0521a_InceptionResNetV2.h5
result: sleeve_0521a_InceptionResNetV2.csv

lr = 0.001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2117s 34ms/step - loss: 1.1164 - acc: 0.5586 - val_loss: 1.0746 - val_acc: 0.5886

Epoch 00001: val_loss improved from inf to 1.07462, saving model to ./models/sleeve.best0521a_InceptionResNetV2.h5

lr = 0.0001
Train on 62224 samples, validate on 6916 samples
Epoch 1/1
62224/62224 [==============================] - 2123s 34ms/step - loss: 0.5745 - acc: 0.7612 - val_loss: 0.9060 - val_acc: 0.6667

Epoch 00001: val_loss improved from inf to 0.90601, saving model to ./models/sleeve.best0521a_InceptionResNetV2.h5
```
>>> 18.5.20
```
label: collar  伪标签  round3
model: collar.best0520a_InceptionResNetV2.h5
result: collar_0520a_InceptionResNetV2.csv

lr = 0.00005
Train on 27174 samples, validate on 2718 samples
Epoch 1/1
27174/27174 [==============================] - 929s 34ms/step - loss: 0.0690 - acc: 0.9766 - val_loss: 0.6718 - val_acc: 0.8477

Epoch 00001: val_loss improved from inf to 0.67181, saving model to ./models/collar.best0520a_InceptionResNetV2_comb.h5

------------------------------------------------------------
label: collar  伪标签  round3
model: collar.best0520a_InceptionResNetV2.h5
result: collar_0520a_InceptionResNetV2.csv

lr = 0.0001
Train on 27174 samples, validate on 2718 samples
Epoch 1/1
27174/27174 [==============================] - 923s 34ms/step - loss: 0.0737 - acc: 0.9755 - val_loss: 0.8165 - val_acc: 0.8436

Epoch 00001: val_loss improved from inf to 0.81651, saving model to ./models/collar.best0520a_InceptionResNetV2_comb.h5
------------------------------------------------------------
label: sleeve  3 种预处理  round2 3轮
model: sleeve.best0520a_InceptionResNetV2.h5
result: sleeve_0520a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 46668 samples, validate on 1729 samples
Epoch 1/1
46668/46668 [==============================] - 492s 11ms/step - loss: 1.7220 - acc: 0.3662 - val_loss: 1.5858 - val_acc: 0.3991

Epoch 00001: val_loss improved from inf to 1.58579, saving model to ./models/sleeve.best0520a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 46668 samples, validate on 1729 samples
Epoch 1/1
46668/46668 [==============================] - 1524s 33ms/step - loss: 1.0023 - acc: 0.6003 - val_loss: 0.8719 - val_acc: 0.6536

Epoch 00001: val_loss improved from inf to 0.87191, saving model to ./models/sleeve.best0520a_InceptionResNetV2.h5

lr = 0.00005 放开所有层
Train on 46668 samples, validate on 1729 samples
Epoch 1/1
46668/46668 [==============================] - 1528s 33ms/step - loss: 0.5871 - acc: 0.7574 - val_loss: 0.8933 - val_acc: 0.6597

Epoch 00001: val_loss improved from inf to 0.84832, saving model to ./models/sleeve.best0520a_InceptionResNetV2.h5

------------------------------------------------------------
label: neck  3 种预处理  round2 2轮
model: neck.best0520a_InceptionResNetV2.h5
result: neck_0520a_InceptionResNetV2.csv

lr = 0.001
Train on 22014 samples, validate on 2448 samples
Epoch 1/1
22014/22014 [==============================] - 762s 35ms/step - loss: 0.9445 - acc: 0.6294 - val_loss: 0.9631 - val_acc: 0.6319

Epoch 00001: val_loss improved from inf to 0.96307, saving model to ./models/neck.best0520a_InceptionResNetV2.h5

lr = 0.00005
Train on 22014 samples, validate on 2448 samples
Epoch 1/1
22014/22014 [==============================] - 765s 35ms/step - loss: 0.3828 - acc: 0.8626 - val_loss: 0.8204 - val_acc: 0.7209

Epoch 00001: val_loss improved from inf to 0.82043, saving model to ./models/neck.best0520a_InceptionResNetV2.h5
------------------------------------------------------------
label: collar  3 种预处理  round2 + 冻结 3 epoch
model: collar.best0520a_InceptionResNetV2.h5
result: collar_0520a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 286s 12ms/step - loss: 0.6131 - acc: 0.7504 - val_loss: 0.5699 - val_acc: 0.7726

Epoch 00001: val_loss improved from inf to 0.56994, saving model to ./models/collar.best0520a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 840s 34ms/step - loss: 0.4176 - acc: 0.8366 - val_loss: 0.4438 - val_acc: 0.8337

Epoch 00001: val_loss improved from inf to 0.44377, saving model to ./models/collar.best0520a_InceptionResNetV2.h5

lr = 0.00005 放开所有层
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 844s 35ms/step - loss: 0.1552 - acc: 0.9450 - val_loss: 0.5478 - val_acc: 0.8326

Epoch 00001: val_loss improved from inf to 0.54782, saving model to ./models/collar.best0520a_InceptionResNetV2.h5

>>> 18.5.19
```
label: neck  3 种预处理  round2
model: neck.best0519a_InceptionResNetV2.h5
result: neck_0519a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 22014 samples, validate on 816 samples
Epoch 1/1
22014/22014 [==============================] - 239s 11ms/step - loss: 1.0212 - acc: 0.6031 - val_loss: 0.8630 - val_acc: 0.6544

Epoch 00001: val_loss improved from inf to 0.86302, saving model to ./models/neck.best0519a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 22014 samples, validate on 816 samples
Epoch 1/1
22014/22014 [==============================] - 771s 35ms/step - loss: 0.5565 - acc: 0.7921 - val_loss: 0.9988 - val_acc: 0.7132

Epoch 00001: val_loss improved from inf to 0.99877, saving model to ./models/neck.best0519a_InceptionResNetV2.h5

lr = 0.00005 放开所有层
Train on 22014 samples, validate on 816 samples
Epoch 1/1
22014/22014 [==============================] - 775s 35ms/step - loss: 0.0787 - acc: 0.9744 - val_loss: 1.065 - val_acc: 0.7475

Epoch 00001: val_loss improved from inf to 1.04058, saving model to ./models/neck.best0519a_InceptionResNetV2.h5

------------------------------------------------------------
label: coat  3 种预处理  round2
lapel_best: val_loss: 0.9786 - val_acc: 0.6141
model: coat.best0519a_InceptionResNetV2.h5
result: coat_0519a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 39024 samples, validate on 1446 samples
Epoch 1/1
39024/39024 [==============================] - 429s 11ms/step - loss: 1.4007 - acc: 0.4723 - val_loss: 1.1831 - val_acc: 0.5408

Epoch 00001: val_loss improved from inf to 1.18313, saving model to ./models/coat.best0519a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 39024 samples, validate on 1446 samples
Epoch 1/1
39024/39024 [==============================] - 1332s 34ms/step - loss: 0.7681 - acc: 0.7006 - val_loss: 1.0486 - val_acc: 0.6314

Epoch 00001: val_loss improved from inf to 1.04858, saving model to ./models/coat.best0519a_InceptionResNetV2.h5

lr = 0.00005 放开所有层
Train on 39024 samples, validate on 1446 samples
Epoch 1/1
39024/39024 [==============================] - 1336s 34ms/step - loss: 0.1899 - acc: 0.9312 - val_loss: 1.4149 - val_acc: 0.6445

Epoch 00001: val_loss improved from inf to 1.41492, saving model to ./models/coat.best0519a_InceptionResNetV2.h5

------------------------------------------------------------
label: lapel  3 种预处理  round2
lapel_best: val_loss: 0.7767 - val_acc: 0.7057
model: lapel.best0519a_InceptionResNetV2.h5
result: lapel_0519a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 23964 samples, validate on 888 samples
Epoch 1/1
23964/23964 [==============================] - 260s 11ms/step - loss: 1.0335 - acc: 0.6070 - val_loss: 0.8615 - val_acc: 0.6881

Epoch 00001: val_loss improved from inf to 0.86148, saving model to ./models/lapel.best0519a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 23964 samples, validate on 888 samples
Epoch 1/1
23964/23964 [==============================] - 832s 35ms/step - loss: 0.5575 - acc: 0.7957 - val_loss: 0.7967 - val_acc: 0.7410

Epoch 00001: val_loss improved from inf to 0.79673, saving model to ./models/lapel.best0519a_InceptionResNetV2.h5

lr = 0.00005 放开所有层
Train on 23964 samples, validate on 888 samples
Epoch 1/1
23964/23964 [==============================] - 835s 35ms/step - loss: 0.0922 - acc: 0.9702 - val_loss: 0.8494 - val_acc: 0.7793

Epoch 00001: val_loss improved from inf to 0.84936, saving model to ./models/lapel.best0519a_InceptionResNetV2.h5

------------------------------------------------------------
label: pant  3 种预处理  round2
pant_best: val_loss: 0.6315 - val_acc: 0.7452
model: pant.best0519a_InceptionResNetV2.h5
result: pant_0519a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 37806 samples, validate on 1401 samples
Epoch 1/1
37806/37806 [==============================] - 407s 11ms/step - loss: 0.9949 - acc: 0.6098 - val_loss: 0.8457 - val_acc: 0.6438

Epoch 00001: val_loss improved from inf to 0.84572, saving model to ./models/pant.best0519a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 37806 samples, validate on 1401 samples
Epoch 1/1
37806/37806 [==============================] - 1280s 34ms/step - loss: 0.4950 - acc: 0.7937 - val_loss: 0.7109 - val_acc: 0.7473

Epoch 00001: val_loss improved from inf to 0.71091, saving model to ./models/pant.best0519a_InceptionResNetV2.h5

lr = 0.00005 放开所有层
Train on 37806 samples, validate on 1401 samples
Epoch 1/1
37806/37806 [==============================] - 1293s 34ms/step - loss: 0.1575 - acc: 0.9346 - val_loss: 0.7355 - val_acc: 0.7823

Epoch 00001: val_loss improved from inf to 0.73552, saving model to ./models/pant.best0519a_InceptionResNetV2.h5

------------------------------------------------------------
label: coat  3 种预处理  round1
neck_best:
model: coat.best0519a_InceptionResNetV2_round1.h5

lr = 0.001 冻结 cnn 层
Train on 30558 samples, validate on 1132 samples
Epoch 1/1
30558/30558 [==============================] - 344s 11ms/step - loss: 1.4821 - acc: 0.4367 - val_loss: 1.2089 - val_acc: 0.5433

Epoch 00001: val_loss improved from inf to 1.20889, saving model to ./models/coat.best0519a_InceptionResNetV2_round1.h5

lr = 0.0001 放开所有层
Train on 30558 samples, validate on 1132 samples
Epoch 1/1
30558/30558 [==============================] - 1045s 34ms/step - loss: 0.4020 - acc: 0.8564 - val_loss: 0.5349 - val_acc: 0.8375

Epoch 00001: val_loss improved from inf to 0.53492, saving model to ./models/coat.best0519a_InceptionResNetV2_round1.h5

------------------------------------------------------------
label: neck  3 种预处理  round1
neck_best:
model: neck.best0519a_InceptionResNetV2_round1.h5

lr = 0.001 冻结 cnn 层
Train on 15366 samples, validate on 570 samples
Epoch 1/1
15366/15366 [==============================] - 186s 12ms/step - loss: 1.4839 - acc: 0.3607 - val_loss: 1.2997 - val_acc: 0.4702

Epoch 00001: val_loss improved from inf to 1.29972, saving model to ./models/neck.best0519a_InceptionResNetV2_round1.h5

lr = 0.0001 放开所有层
Train on 15366 samples, validate on 570 samples
Epoch 1/1
15366/15366 [==============================] - 552s 36ms/step - loss: 0.5830 - acc: 0.7812 - val_loss: 0.7879 - val_acc: 0.7526

Epoch 00001: val_loss improved from inf to 0.78795, saving model to ./models/neck.best0519a_InceptionResNetV2_round1.h5

------------------------------------------------------------
label: lapel  3 种预处理  round1
label_best:
model: lapel.best0519a_InceptionResNetV2_round1.h5

lr = 0.001 冻结 cnn 层
Train on 18990 samples, validate on 704 samples
Epoch 1/1
18990/18990 [==============================] - 218s 11ms/step - loss: 1.3652 - acc: 0.4151 - val_loss: 1.2024 - val_acc: 0.5099

Epoch 00001: val_loss improved from inf to 1.20241, saving model to ./models/lapel.best0519a_InceptionResNetV2_round1.h5

lr = 0.0001 放开所有层
Train on 18990 samples, validate on 704 samples
Epoch 1/1
18990/18990 [==============================] - 672s 35ms/step - loss: 0.4090 - acc: 0.8557 - val_loss: 0.5395 - val_acc: 0.8352

Epoch 00001: val_loss improved from inf to 0.53945, saving model to ./models/lapel.best0519a_InceptionResNetV2_round1.h5


------------------------------------------------------------
label: pant  3 种预处理  round1
pant_best: val_loss: 0.5241 - val_acc: 0.8311
model: pant.best0519a_InceptionResNetV2_round1.h5

lr = 0.001 冻结 cnn 层
Train on 20136 samples, validate on 746 samples
Epoch 1/1
20136/20136 [==============================] - 233s 12ms/step - loss: 1.4378 - acc: 0.4302 - val_loss: 1.2102 - val_acc: 0.5349

Epoch 00001: val_loss improved from inf to 1.21025, saving model to ./models/pant.best0519a_InceptionResNetV2_round1.h5

lr = 0.0001 放开所有层
Train on 20136 samples, validate on 746 samples
Epoch 1/1
20136/20136 [==============================] - 698s 35ms/step - loss: 0.3927 - acc: 0.8545 - val_loss: 0.5241 - val_acc: 0.8311

Epoch 00001: val_loss improved from inf to 0.52406, saving model to ./models/pant.best0519a_InceptionResNetV2_round1.h5

------------------------------------------------------------
label:  collar  3 种预处理  round3 伪标签
neck_best: val_loss: 0.4660 - val_acc: 0.8510
model: collar.best0519a_InceptionResNetV2_comb.h5

lr = 0.001 冻结 cnn 层
Train on 9058 samples, validate on 906 samples
Epoch 1/1
9058/9058 [==============================] - 342s 38ms/step - loss: 0.2676 - acc: 0.9051 - val_loss: 0.6655 - val_acc: 0.8079

Epoch 00001: val_loss improved from inf to 0.66554, saving model to ./models/collar.best0519a_InceptionResNetV2_comb.h5

lr = 0.0001 放开所有层
Train on 9058 samples, validate on 906 samples
Epoch 1/1
9058/9058 [==============================] - 346s 38ms/step - loss: 0.0814 - acc: 0.9710 - val_loss: 0.7908 - val_acc: 0.8532

Epoch 00001: val_loss improved from inf to 0.79076, saving model to ./models/collar.best0519a_InceptionResNetV2_comb.h5

------------------------------------------------------------
label:  skirt  3 种预处理 直方图  round2 finetune
neck_best: val_loss: 0.7220 - val_acc: 0.7357
model: skirt.best0519a_InceptionResNetV2.h5
result: skirt_0519a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 33897 samples, validate on 1256 samples
Epoch 1/1
33897/33897 [==============================] - 1134s 33ms/step - loss: 0.8562 - acc: 0.6509 - val_loss: 0.8646 - val_acc: 0.6537

Epoch 00001: val_loss improved from inf to 0.86464, saving model to ./models/skirt.best0519a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 33897 samples, validate on 1256 samples
Epoch 1/1
33897/33897 [==============================] - 1137s 34ms/step - loss: 0.5147 - acc: 0.7894 - val_loss: 0.7318 - val_acc: 0.7269

Epoch 00001: val_loss improved from inf to 0.73183, saving model to ./models/skirt.best0519a_InceptionResNetV2.h5
```


>>> 18.5.18
```
label: sleeve  3 种预处理+全数据  round2 finetune
neck_best: val_loss: 0.7220 - val_acc: 0.7357
model: sleeve.best0518b_InceptionResNetV2.h5
result: sleeve_0518b_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 51855 samples, validate on 1729 samples
Epoch 1/1
51855/51855 [==============================] - 1705s 33ms/step - loss: 1.1400 - acc: 0.5518 - val_loss: 0.8624 - val_acc: 0.6599

Epoch 00001: val_loss improved from inf to 0.86238, saving model to ./models/sleeve.best0518b_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 51855 samples, validate on 1729 samples
Epoch 1/1
51855/51855 [==============================] - 1707s 33ms/step - loss: 0.6456 - acc: 0.7306 - val_loss: 0.4109 - val_acc: 0.8259

Epoch 00001: val_loss improved from inf to 0.41090, saving model to ./models/sleeve.best0518b_InceptionResNetV2.h5

------------------------------------------------------------
label: skirt  3 种预处理+全数据  round2 finetune
neck_best: val_loss: 0.7220 - val_acc: 0.7357
model: skirt.best0518b_InceptionResNetV2.h5
result: skirt_0518b_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 37665 samples, validate on 1256 samples
Epoch 1/1
37665/37665 [==============================] - 1249s 33ms/step - loss: 0.8482 - acc: 0.6526 - val_loss: 0.8349 - val_acc: 0.6584

Epoch 00001: val_loss improved from inf to 0.83495, saving model to ./models/skirt.best0518b_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 37665 samples, validate on 1256 samples
Epoch 1/1
37665/37665 [==============================] - 1252s 33ms/step - loss: 0.5090 - acc: 0.7926 - val_loss: 0.3254 - val_acc: 0.8742

Epoch 00001: val_loss improved from inf to 0.32544, saving model to ./models/skirt.best0518b_InceptionResNetV2.h5

------------------------------------------------------------
label: neckline  3 种预处理+全数据  round2 finetune
neck_best: val_loss: 0.4660 - val_acc: 0.8510
model: neckline.best0518b_InceptionResNetV2.h5
result: neckline_0518b_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 49128 samples, validate on 1638 samples
Epoch 1/1
49128/49128 [==============================] - 1618s 33ms/step - loss: 0.8444 - acc: 0.7141 - val_loss: 0.6019 - val_acc: 0.7869

Epoch 00001: val_loss improved from inf to 0.60193, saving model to ./models/neckline.best0518b_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 49128 samples, validate on 1638 samples
Epoch 1/1
49128/49128 [==============================] - 1620s 33ms/step - loss: 0.3081 - acc: 0.8978 - val_loss: 0.1124 - val_acc: 0.9640

Epoch 00001: val_loss improved from inf to 0.11243, saving model to ./models/neckline.best0518b_InceptionResNetV2.h5


------------------------------------------------------------
label: collar  3 种预处理+全数据  round2 
neck_best: val_loss: 0.4660 - val_acc: 0.8510
model: collar.best0518b_InceptionResNetV2.h5
result: collar_0518b_InceptionResNetV2.csv

lr = 0.001
Train on 27174 samples, validate on 906 samples
Epoch 1/1
27174/27174 [==============================] - 933s 34ms/step - loss: 0.5316 - acc: 0.8011 - val_loss: 0.3797 - val_acc: 0.8631

Epoch 00001: val_loss improved from inf to 0.37973, saving model to ./models/collar.best0518b_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 27174 samples, validate on 906 samples
Epoch 1/1
27174/27174 [==============================] - 940s 35ms/step - loss: 0.1826 - acc: 0.9349 - val_loss: 0.0497 - val_acc: 0.9879

Epoch 00001: val_loss improved from inf to 0.04973, saving model to ./models/collar.best0518b_InceptionResNetV2.h5

------------------------------------------------------------
label: skirt  4 种预处理  round2 直方图
neck_best: val_loss: 0.7220 - val_acc: 0.7357
model: skirt.best0518b_InceptionResNetV2.h5
result: skirt_0518b_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 45196 samples, validate on 1256 samples
Epoch 1/1
45196/45196 [==============================] - 1487s 33ms/step - loss: 0.8339 - acc: 0.6619 - val_loss: 1.0027 - val_acc: 0.6154

Epoch 00001: val_loss improved from inf to 1.00272, saving model to ./models/skirt.best0518b_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 45196 samples, validate on 1256 samples
Epoch 1/1
45196/45196 [==============================] - 1489s 33ms/step - loss: 0.4621 - acc: 0.8145 - val_loss: 0.7384 - val_acc: 0.7261

Epoch 00001: val_loss improved from inf to 0.73835, saving model to ./models/skirt.best0518a_InceptionResNetV2.h5


------------------------------------------------------------
label: collar  3 种预处理  round2 finetune
neck_best: val_loss: 0.4570 - val_acc: 0.8462
model: collar.best0518a_InceptionResNetV2.h5
result: collar_0518a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层

Train on 24456 samples, validate on 906 samples
Epoch 1/1
24456/24456 [==============================] - 826s 34ms/step - loss: 0.5305 - acc: 0.7987 - val_loss: 0.5455 - val_acc: 0.7903

Epoch 00001: val_loss improved from inf to 0.54551, saving model to ./models/collar.best0518a_InceptionResNetV2.h5

lr = 0.0001 放开所有层

Train on 24456 samples, validate on 906 samples
Epoch 1/1
24456/24456 [==============================] - 835s 34ms/step - loss: 0.1775 - acc: 0.9371 - val_loss: 0.4660 - val_acc: 0.8510

Epoch 00001: val_loss improved from inf to 0.46604, saving model to ./models/collar.best0518a_InceptionResNetV2.h5

------------------------------------------------------------
label: neckline  3 种预处理  round2 finetune
neck_best: val_loss: val_loss: 0.6876 - val_acc: 0.7853
model: neckline.best0518a_InceptionResNetV2.h5
result: neckline_0518a_InceptionResNetV2.csv

lr = 0.001

Train on 44214 samples, validate on 1638 samples
Epoch 1/1
44214/44214 [==============================] - 1467s 33ms/step - loss: 0.8575 - acc: 0.7109 - val_loss: 2.0689 - val_acc: 0.5635

Epoch 00001: val_loss improved from inf to 2.06885, saving model to ./models/neckline.best0518a_InceptionResNetV2.h5

lr = 0.0001 放开所有层

Train on 44214 samples, validate on 1638 samples
Epoch 1/1
44214/44214 [==============================] - 1494s 34ms/step - loss: 0.2963 - acc: 0.9007 - val_loss: 0.6408 - val_acc: 0.7900

Epoch 00001: val_loss improved from inf to 0.64082, saving model to ./models/neckline.best0518a_InceptionResNetV2.h5

------------------------------------------------------------
label: skirt  3 种预处理  round2 finetune
neck_best: val_loss: 0.7713 - val_acc: 0.7073
model: skirt.best0518a_InceptionResNetV2.h5
result: skirt_0518a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层

Train on 33897 samples, validate on 1256 samples
Epoch 1/1
33897/33897 [==============================] - 1151s 34ms/step - loss: 0.8559 - acc: 0.6519 - val_loss: 1.2578 - val_acc: 0.6027

Epoch 00001: val_loss improved from inf to 1.25784, saving model to ./models/skirt.best0518a_InceptionResNetV2.h5

lr = 0.0001 放开所有层
Train on 33897 samples, validate on 1256 samples
Epoch 1/1
33897/33897 [==============================] - 1143s 34ms/step - loss: 0.5163 - acc: 0.7875 - val_loss: 0.7220 - val_acc: 0.7357

Epoch 00001: val_loss improved from inf to 0.72202, saving model to ./models/skirt.best0518a_InceptionResNetV2.h5

------------------------------------------------------------
label: sleeve  3 种预处理  round2 finetune
neck_best: val_loss: 0.8878 - val_acc: 0.6617
model: sleeve.best0518a_InceptionResNetV2.h5
result: sleeve_0518a_InceptionResNetV2.csv

lr = 0.001 冻结 cnn 层
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1600s 34ms/step - loss: 1.1543 - acc: 0.5444 - val_loss: 0.3604 - val_acc: 0.8623

Epoch 00001: val_loss improved from inf to 0.36045, saving model to ./models/sleeve.best0518a_InceptionResNetV2.h5


lr = 0.0001 放开所有层
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1598s 34ms/step - loss: 0.6585 - acc: 0.7275 - val_loss: 0.8488 - val_acc: 0.6541

Epoch 00001: val_loss improved from inf to 0.28296, saving model to ./models/sleeve.best0518a_InceptionResNetV2.h5
```

>>> 18.5.17
```
label: sleeve  3 种预处理  round3 加载了错误模型用的 round1
neck_best: val_loss: 0.8878 - val_acc: 0.6617
model: sleeve.best0517a_InceptionResNetV2_round3.h5
result: sleeve_0517b_InceptionResNetV2.csv
error_boost

lr = 0.00005
Train on 8430 samples, validate on 1729 samples
Epoch 1/2
8430/8430 [==============================] - 340s 40ms/step - loss: 1.6386 - acc: 0.3539 - val_loss: 0.9652 - val_acc: 0.6669

Epoch 00001: val_loss improved from inf to 0.96524, saving model to ./models/sleeve.best0517a_InceptionResNetV2_round3.h5
Epoch 2/2
8430/8430 [==============================] - 291s 35ms/step - loss: 0.8224 - acc: 0.6943 - val_loss: 0.4495 - val_acc: 0.8809

Epoch 00002: val_loss improved from 0.96524 to 0.44954, saving model to ./models/sleeve.best0517a_InceptionResNetV2_round3.h5


------------------------------------------------------------
label: collar  3 种预处理  round3 加载了错误模型用的 round1
neck_best: val_loss: 0.4570 - val_acc: 0.8462
model: collar.best0517a_InceptionResNetV2_round3.h5
result: collar_0517b_InceptionResNetV2.csv

lr = 0,00005
Train on 2492 samples, validate on 906 samples
Epoch 1/2
2492/2492 [==============================] - 133s 53ms/step - loss: 1.2232 - acc: 0.6079 - val_loss: 0.4691 - val_acc: 0.8245

Epoch 00001: val_loss improved from inf to 0.46914, saving model to ./models/collar.best0517a_InceptionResNetV2_round3.h5

Train on 2492 samples, validate on 906 samples
Epoch 1/1
2492/2492 [==============================] - 88s 35ms/step - loss: 0.7421 - acc: 0.6994 - val_loss: 0.3977 - val_acc: 0.8664

Epoch 00001: val_loss improved from inf to 0.39773, saving model to ./models/collar.best0517a_InceptionResNetV2_round3.h5


label: collar  3 种预处理  round3
neck_best: val_loss: 0.4570 - val_acc: 0.8462
model: collar.best0517a_InceptionResNetV2_round3.h5
result: collar_0517a_InceptionResNetV2.csv

lr = 0.001
xx

lr = 0.0001
Train on 7476 samples, validate on 906 samples
Epoch 1/1
7476/7476 [==============================] - 292s 39ms/step - loss: 0.1064 - acc: 0.9629 - val_loss: 0.00529 - val_acc: 1.0

Epoch 00001: val_loss improved from inf to 6.69500, saving model to ./models/collar.best0517a_InceptionResNetV2_round3.h5
```

>>> 18.5.16
```
label: neckline  3 种预处理  round2
neck_best: val_loss: 0.7244 - val_acc: 0.7576
model: neckline.best0516a_InceptionResNetV2_round2.h5

lr = 0.001
Train on 44214 samples, validate on 4914 samples
Epoch 1/1
44214/44214 [==============================] - 1509s 34ms/step - loss: 0.8532 - acc: 0.7125 - val_loss: 0.9165 - val_acc: 0.6862

Epoch 00001: val_loss improved from inf to 0.91650, saving model to ./models/neckline.best0516b_InceptionResNetV2_round2.h5

lr = 0.0001
Train on 44214 samples, validate on 4914 samples
Epoch 1/1
44214/44214 [==============================] - 1522s 34ms/step - loss: 0.2960 - acc: 0.8999 - val_loss: 0.6876 - val_acc: 0.7853

Epoch 00001: val_loss improved from inf to 0.68758, saving model to ./models/neckline.best0516b_InceptionResNetV2_round2.h5


label: neckline  3 种预处理  round1
neck_best: val_loss: 0.7244 - val_acc: 0.7576
model: skirt.best0516a_InceptionResNetV2_round1.h5

lr = 0.001
Train on 46293 samples, validate on 5145 samples
Epoch 1/1
46293/46293 [==============================] - 1568s 34ms/step - loss: 0.8743 - acc: 0.7078 - val_loss: 0.8858 - val_acc: 0.7079

Epoch 00001: val_loss improved from inf to 0.88582, saving model to ./models/neckline.best0516a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 46293 samples, validate on 5145 samples
Epoch 1/1
46293/46293 [==============================] - 1567s 34ms/step - loss: 0.2981 - acc: 0.9019 - val_loss: 0.4897 - val_acc: 0.8418

Epoch 00001: val_loss improved from inf to 0.48965, saving model to ./models/neckline.best0516a_InceptionResNetV2_round1.h5

-----------------------------------------------------
label: skirt  3 种预处理  round2
neck_best: val_loss: 0.7713 - val_acc: 0.7073
model: skirt.best0516a_InceptionResNetV2_round2.h5

lr = 0.001
Train on 33897 samples, validate on 3768 samples
Epoch 1/1
33897/33897 [==============================] - 1177s 35ms/step - loss: 0.8657 - acc: 0.6497 - val_loss: 1.0040 - val_acc: 0.6176

Epoch 00001: val_loss improved from inf to 1.00396, saving model to ./models/skirt.best0516b_InceptionResNetV2_round2.h5

lr = 0.0001
Train on 33897 samples, validate on 3768 samples
Epoch 1/1
33897/33897 [==============================] - 1182s 35ms/step - loss: 0.5152 - acc: 0.7908 - val_loss: 0.7713 - val_acc: 0.7073

Epoch 00001: val_loss improved from inf to 0.77129, saving model to ./models/skirt.best0516b_InceptionResNetV2_round2.h5

label: skirt  3 种预处理  round1
neck_best: val_loss: 0.7330 - val_acc: 0.6982
model: skirt.best0516a_InceptionResNetV2_round1.h5


lr = 0.001
Train on 24900 samples, validate on 2769 samples
Epoch 1/1
24900/24900 [==============================] - 887s 36ms/step - loss: 0.6870 - acc: 0.7496 - val_loss: 0.6374 - val_acc: 0.7783

Epoch 00001: val_loss improved from inf to 0.63745, saving model to ./models/skirt.best0516a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 24900 samples, validate on 2769 samples
Epoch 1/1
24900/24900 [==============================] - 879s 35ms/step - loss: 0.2181 - acc: 0.9220 - val_loss: 0.5060 - val_acc: 0.8368

Epoch 00001: val_loss improved from inf to 0.50598, saving model to ./models/skirt.best0516a_InceptionResNetV2_round1.h5


-----------------------------------------------------
label: sleeve  3 种预处理  round2
neck_best: val_loss: 0.9742 - val_acc: 0.5962
model: sleeve.best0516a_InceptionResNetV2_round2.h5

lr = 0.001

Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1586s 34ms/step - loss: 1.1223 - acc: 0.5568 - val_loss: 1.2156 - val_acc: 0.5348

Epoch 00001: val_loss improved from inf to 1.21560, saving model to ./models/sleeve.best0516b_InceptionResNetV2_round2.h5

lr = 0.0001

Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1592s 34ms/step - loss: 0.6204 - acc: 0.7424 - val_loss: 0.8878 - val_acc: 0.6617

Epoch 00001: val_loss improved from inf to 0.88785, saving model to ./models/sleeve.best0516b_InceptionResNetV2_round2.h5

label: sleeve  3 种预处理  round1
neck_best: val_loss: 0.9742 - val_acc: 0.5962
model: sleeve.best0516a_InceptionResNetV2_round1.h5

lr = 0.001
Train on 35907 samples, validate on 3990 samples
Epoch 1/1
35907/35907 [==============================] - 1234s 34ms/step - loss: 0.6848 - acc: 0.7513 - val_loss: 0.8642 - val_acc: 0.7256

Epoch 00001: val_loss improved from inf to 0.86423, saving model to ./models/sleeve.best0516a_InceptionResNetV2_round1.h5

lr = 0.0001
Train on 35907 samples, validate on 3990 samples
Epoch 1/1
35907/35907 [==============================] - 1231s 34ms/step - loss: 0.2149 - acc: 0.9267 - val_loss: 0.4058 - val_acc: 0.8669

Epoch 00001: val_loss improved from inf to 0.40583, saving model to ./models/sleeve.best0516a_InceptionResNetV2_round1.h5


-----------------------------------------------------
label: collar  3 种预处理  round2 再重新训练一次, 第 2 轮
neck_best: val_loss: 0.4570 - val_acc: 0.8462
model: collar.best0516b_InceptionResNetV2_round2.h5
submit: collar_0516a_InceptionResNetV2.csv

lr = 0.001
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 868s 36ms/step - loss: 0.5298 - acc: 0.8012 - val_loss: 0.7537 - val_acc: 0.7432

Epoch 00001: val_loss improved from inf to 0.75374, saving model to ./models/collar.best0516b_InceptionResNetV2_round2.h5

lr = 0.00002
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 873s 36ms/step - loss: 0.1623 - acc: 0.9447 - val_loss: 0.4570 - val_acc: 0.8462

Epoch 00001: val_loss improved from inf to 0.45700, saving model to ./models/collar.best0516b_InceptionResNetV2_round2.h5

label: collar  3 种预处理  round2 重新训练一次, 使用更大的 lr 试试
neck_best: val_loss: val_loss: 0.3955 - val_acc: 0.8444
model: collar.best0516a_InceptionResNetV2_round2.h5

lr = 0.001
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 859s 35ms/step - loss: 0.5304 - acc: 0.7997 - val_loss: 0.5621 - val_acc: 0.7877

Epoch 00001: val_loss improved from inf to 0.56212, saving model to ./models/collar.best0516a_InceptionResNetV2_round2.h5

lr = 0.00002
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 854s 35ms/step - loss: 0.2246 - acc: 0.9183 - val_loss: 0.3955 - val_acc: 0.8444

Epoch 00001: val_loss improved from inf to 0.39546, saving model to ./models/collar.best0516a_InceptionResNetV2_round2.h5


label: collar  3 种预处理  round2
neck_best: val_loss: 0.4114 - val_acc: 0.8427
model: collar.best0516a_InceptionResNetV2_round2.h5

lr = 0.00002
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 848s 35ms/step - loss: 0.5899 - acc: 0.7859 - val_loss: 0.4862 - val_acc: 0.8087

Epoch 00001: val_loss improved from inf to 0.48624, saving model to ./models/collar.best0516a_InceptionResNetV2_round2.h5

lr = 0.00001
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 848s 35ms/step - loss: 0.4183 - acc: 0.8389 - val_loss: 0.4615 - val_acc: 0.8208

Epoch 00001: val_loss improved from inf to 0.46151, saving model to ./models/collar.best0516a_InceptionResNetV2_round2.h5

Epoch 2/2
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 802s 33ms/step - loss: 0.3666 - acc: 0.8581 - val_loss: 0.4539 - val_acc: 0.8227

Epoch 00001: val_loss improved from inf to 0.45385, saving model to ./models/collar.best0516a_InceptionResNetV2_round2.h5

Train on 24456 samples, validate on 2718 samples
Epoch 1/16
24456/24456 [==============================] - 802s 33ms/step - loss: 0.3052 - acc: 0.8830 - val_loss: 0.4677 - val_acc: 0.8308

Epoch 00001: val_loss improved from inf to 0.46768, saving model to ./models/collar.best0516a_InceptionResNetV2_round2.h5
Epoch 2/16
24456/24456 [==============================] - 802s 33ms/step - loss: 0.2403 - acc: 0.9108 - val_loss: 0.4968 - val_acc: 0.8319

Epoch 00002: val_loss did not improve
Epoch 3/16
24456/24456 [==============================] - 801s 33ms/step - loss: 0.1702 - acc: 0.9392 - val_loss: 0.5845 - val_acc: 0.8201

Epoch 00003: val_loss did not improve
Epoch 4/16
 1728/24456 [=>............................] - ETA: 11:59 - loss: 0.1413 - acc: 0.9514KeyboardInterrupt


label: collar  3 种预处理  round1
neck_best: val_loss: 0.5143 - val_acc: 0.8183
model: collar.best0516a_InceptionResNetV2_round1.h5

lr = 0.001
Train on 22656 samples, validate on 2520 samples
Epoch 1/1
22656/22656 [==============================] - 795s 35ms/step - loss: 0.7154 - acc: 0.7411 - val_loss: 1.0861 - val_acc: 0.6710

Epoch 00001: val_loss improved from inf to 1.08612, saving model to ./models/collar.best0516a_InceptionResNetV2_round1.h5

lr = 0.00002
Train on 22656 samples, validate on 2520 samples
Epoch 1/1
22656/22656 [==============================] - 787s 35ms/step - loss: 0.2859 - acc: 0.9000 - val_loss: 0.5143 - val_acc: 0.8183

Epoch 00001: val_loss improved from inf to 0.51427, saving model to ./models/collar.best0516a_InceptionResNetV2_round1.h5

```

>>> 18.5.15
```
label: neck  3 种预处理  neck_best: null
model: neck.best0515a_InceptionResNetV2.h5
result: neck0515a_InceptionResNetV2.csv

lr = 0.001
Train on 22014 samples, validate on 2448 samples
Epoch 1/1
22014/22014 [==============================] - 774s 35ms/step - loss: 1.1275 - acc: 0.5352 - val_loss: 1.2984 - val_acc: 0.5331

Epoch 00001: val_loss improved from inf to 1.29839, saving model to ./models/neck.best0515a_InceptionResNetV2.h5

lr = 0.00002
Train on 22014 samples, validate on 2448 samples
Epoch 1/1
22014/22014 [==============================] - 765s 35ms/step - loss: 0.6342 - acc: 0.7622 - val_loss: 0.7586 - val_acc: 0.7092

Epoch 00001: val_loss improved from inf to 0.75856, saving model to ./models/neck.best0515a_InceptionResNetV2.h5

-----------------------------------------------------------
label: coat  3 种预处理  coat_best: null
model: coat.best0515a_InceptionResNetV2.h5
result: coat0515a_InceptionResNetV2.csv

lr = 0.001
Train on 39024 samples, validate on 4338 samples
Epoch 1/1
39024/39024 [==============================] - 1340s 34ms/step - loss: 1.2913 - acc: 0.4888 - val_loss: 1.2377 - val_acc: 0.5281

Epoch 00001: val_loss improved from inf to 1.23768, saving model to ./models/coat.best0515a_InceptionResNetV2.h5

lr=0.00002
Train on 39024 samples, validate on 4338 samples
Epoch 1/1
39024/39024 [==============================] - 1330s 34ms/step - loss: 0.8375 - acc: 0.6665 - val_loss: 0.9786 - val_acc: 0.6141

Epoch 00001: val_loss improved from inf to 0.97856, saving model to ./models/coat.best0515a_InceptionResNetV2.h5


-----------------------------------------------------------
label: lapel  3 种预处理  lapel_best: null
model: lapel.best0515a_InceptionResNetV2.h5
result: lapel0515a_InceptionResNetV2.csv

lr = 0.001
Train on 23964 samples, validate on 2664 samples
Epoch 1/1
23964/23964 [==============================] - 837s 35ms/step - loss: 1.0979 - acc: 0.5603 - val_loss: 1.1623 - val_acc: 0.5770

Epoch 00001: val_loss improved from inf to 1.16226, saving model to ./models/lapel.best0515a_InceptionResNetV2.h5

lr=0.00002
Train on 23964 samples, validate on 2664 samples
Epoch 1/1
23964/23964 [==============================] - 837s 35ms/step - loss: 0.6037 - acc: 0.7757 - val_loss: 0.7767 - val_acc: 0.7057

Epoch 00001: val_loss improved from inf to 0.77668, saving model to ./models/lapel.best0515a_InceptionResNetV2.h5

-----------------------------------------------------------
label: pant  3 种预处理  last_best: val_loss: 0.6593 - val_acc: 0.7234
model: pant.best0515a_InceptionResNetV2.h5
result: pant_0515a_InceptionResNetV2.csv

lr = 0.001
Train on 37806 samples, validate on 4203 samples
Epoch 1/1
37806/37806 [==============================] - 1288s 34ms/step - loss: 0.8647 - acc: 0.6398 - val_loss: 0.9082 - val_acc: 0.6403

Epoch 00001: val_loss improved from inf to 0.90819, saving model to ./models/pant.best0515a_InceptionResNetV2.h5

lr=0.00002
Train on 37806 samples, validate on 4203 samples
Epoch 1/1
37806/37806 [==============================] - 1302s 34ms/step - loss: 0.5164 - acc: 0.7793 - val_loss: 0.6315 - val_acc: 0.7452

Epoch 00001: val_loss improved from inf to 0.63145, saving model to ./models/pant.best0515a_InceptionResNetV2.h5
```

>>> 18.5.14
```
label: sleeve  keras + L2 正则, 过去 best: val_loss: 0.9742 - val_acc: 0.5962
model:  sleeve.best0514b_InceptionResNetV2.h5
result: sleeve_0514a_InceptionResNetV2.csv

lr = 0.0001
Epoch 1/32
 - 546s - loss: 1.1841 - acc: 0.6336 - val_loss: 1.6232 - val_acc: 0.4488

Epoch 00001: val_loss improved from inf to 1.62316, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 2/32
 - 503s - loss: 1.1339 - acc: 0.6512 - val_loss: 1.6015 - val_acc: 0.4772

Epoch 00002: val_loss improved from 1.62316 to 1.60146, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 3/32
 - 503s - loss: 1.1116 - acc: 0.6634 - val_loss: 1.5976 - val_acc: 0.4737

Epoch 00003: val_loss improved from 1.60146 to 1.59762, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 4/32
 - 503s - loss: 1.0863 - acc: 0.6772 - val_loss: 1.6303 - val_acc: 0.4719

Epoch 00004: val_loss did not improve
Epoch 5/32
 - 503s - loss: 1.0692 - acc: 0.6815 - val_loss: 1.6125 - val_acc: 0.4725

Epoch 00005: val_loss did not improve
Epoch 6/32
 - 503s - loss: 1.0494 - acc: 0.6889 - val_loss: 1.5982 - val_acc: 0.4789

Epoch 00006: val_loss did not improve
Epoch 7/32
 - 503s - loss: 1.0362 - acc: 0.6962 - val_loss: 1.6353 - val_acc: 0.4673

Epoch 00007: val_loss did not improve
Epoch 8/32
 - 503s - loss: 1.0204 - acc: 0.7051 - val_loss: 1.6400 - val_acc: 0.4615

Epoch 00008: val_loss did not improve


lr = 0.001

Epoch 1/32
 - 550s - loss: 5.1750 - acc: 0.3456 - val_loss: 2.6258 - val_acc: 0.1614

Epoch 00001: val_loss improved from inf to 2.62580, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 2/32
 - 502s - loss: 1.8551 - acc: 0.3903 - val_loss: 1.9868 - val_acc: 0.3644

Epoch 00002: val_loss improved from 2.62580 to 1.98676, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 3/32
 - 502s - loss: 1.7824 - acc: 0.4233 - val_loss: 2.0857 - val_acc: 0.2967

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 502s - loss: 1.7478 - acc: 0.4351 - val_loss: 1.8589 - val_acc: 0.4025

Epoch 00004: val_loss improved from 1.98676 to 1.85892, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 5/32
 - 502s - loss: 1.6974 - acc: 0.4607 - val_loss: 1.8879 - val_acc: 0.3904

Epoch 00005: val_loss did not improve
Epoch 6/32
 - 502s - loss: 1.6302 - acc: 0.4855 - val_loss: 1.9579 - val_acc: 0.3864

Epoch 00006: val_loss did not improve
Epoch 7/32
 - 502s - loss: 1.5922 - acc: 0.5083 - val_loss: 1.8850 - val_acc: 0.3916

Epoch 00007: val_loss did not improve
Epoch 8/32
 - 502s - loss: 1.5572 - acc: 0.5138 - val_loss: 1.7823 - val_acc: 0.4309

Epoch 00008: val_loss improved from 1.85892 to 1.78226, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 9/32
 - 502s - loss: 1.5115 - acc: 0.5312 - val_loss: 1.8940 - val_acc: 0.4257

Epoch 00009: val_loss did not improve
Epoch 10/32
 - 502s - loss: 1.4961 - acc: 0.5423 - val_loss: 1.8830 - val_acc: 0.3846

Epoch 00010: val_loss did not improve
Epoch 11/32
 - 502s - loss: 1.4614 - acc: 0.5564 - val_loss: 1.9057 - val_acc: 0.3904

Epoch 00011: val_loss did not improve
Epoch 12/32
 - 502s - loss: 1.4257 - acc: 0.5626 - val_loss: 1.7187 - val_acc: 0.4534

Epoch 00012: val_loss improved from 1.78226 to 1.71872, saving model to ./models/sleeve.best0514b_InceptionResNetV2.h5
Epoch 13/32
 - 502s - loss: 1.4069 - acc: 0.5719 - val_loss: 1.8427 - val_acc: 0.4425

Epoch 00013: val_loss did not improve
Epoch 14/32
 - 502s - loss: 1.3604 - acc: 0.5880 - val_loss: 1.9741 - val_acc: 0.4390

Epoch 00014: val_loss did not improve
Epoch 15/32
 - 502s - loss: 1.3628 - acc: 0.5955 - val_loss: 1.8450 - val_acc: 0.3991

Epoch 00015: val_loss did not improve
Epoch 16/32
 - 502s - loss: 1.3438 - acc: 0.6020 - val_loss: 1.8895 - val_acc: 0.4309

Epoch 00016: val_loss did not improve
Epoch 17/32
 - 502s - loss: 1.3122 - acc: 0.6113 - val_loss: 1.7828 - val_acc: 0.4552

Epoch 00017: val_loss did not improve


------------------------------------------------
label: collar  keras + L2 正则
model:  collar.best0514b_InceptionResNetV2.h5
result: collar_0514a_InceptionResNetV2.csv

lr = 0.000005 

Epoch 1/32
 - 326s - loss: 0.3753 - acc: 0.9577 - val_loss: 0.6616 - val_acc: 0.8366

Epoch 00001: val_loss improved from inf to 0.66156, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 2/32
 - 271s - loss: 0.3726 - acc: 0.9571 - val_loss: 0.6707 - val_acc: 0.8311

Epoch 00002: val_loss did not improve
Epoch 3/32
 - 267s - loss: 0.3644 - acc: 0.9595 - val_loss: 0.6635 - val_acc: 0.8344

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 268s - loss: 0.3574 - acc: 0.9621 - val_loss: 0.6768 - val_acc: 0.8278

Epoch 00004: val_loss did not improve
Epoch 5/32
KeyboardInterrupt

lr = 0.0001

val_acc: 0.8400

lr = 0.001

Epoch 1/32
 - 322s - loss: 4.4115 - acc: 0.8064 - val_loss: 1.0802 - val_acc: 0.7064

Epoch 00001: val_loss improved from inf to 1.08019, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 2/32
 - 272s - loss: 0.8288 - acc: 0.8140 - val_loss: 1.0197 - val_acc: 0.7583

Epoch 00002: val_loss improved from 1.08019 to 1.01973, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 3/32
 - 271s - loss: 0.7865 - acc: 0.8287 - val_loss: 1.0208 - val_acc: 0.7561

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 267s - loss: 0.7572 - acc: 0.8371 - val_loss: 0.9162 - val_acc: 0.7792

Epoch 00004: val_loss improved from 1.01973 to 0.91616, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 5/32
 - 266s - loss: 0.7056 - acc: 0.8555 - val_loss: 0.8585 - val_acc: 0.7914

Epoch 00005: val_loss improved from 0.91616 to 0.85850, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 6/32
 - 267s - loss: 0.6794 - acc: 0.8639 - val_loss: 0.8497 - val_acc: 0.7903

Epoch 00006: val_loss improved from 0.85850 to 0.84971, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 7/32
 - 267s - loss: 0.6402 - acc: 0.8784 - val_loss: 0.9481 - val_acc: 0.7472

Epoch 00007: val_loss did not improve
Epoch 8/32
 - 267s - loss: 0.6413 - acc: 0.8778 - val_loss: 1.0092 - val_acc: 0.7550

Epoch 00008: val_loss did not improve
Epoch 9/32
 - 267s - loss: 0.6065 - acc: 0.8863 - val_loss: 0.8265 - val_acc: 0.8035

Epoch 00009: val_loss improved from 0.84971 to 0.82655, saving model to ./models/collar.best0514b_InceptionResNetV2.h5
Epoch 10/32
 - 267s - loss: 0.6011 - acc: 0.8927 - val_loss: 0.8955 - val_acc: 0.7759

Epoch 00010: val_loss did not improve
Epoch 11/32
 - 267s - loss: 0.5715 - acc: 0.8942 - val_loss: 0.8549 - val_acc: 0.7826

Epoch 00011: val_loss did not improve
Epoch 12/32
------------------------------------------------
label: collar  不做任何预处理
model: collar.best0514a_InceptionResNetV2.h5

lr=0.001
Train on 8152 samples, validate on 906 samples
Epoch 1/1
8152/8152 [==============================] - 321s 39ms/step - loss: 0.9576 - acc: 0.6192 - val_loss: 1.9519 - val_acc: 0.4227

Epoch 00001: val_loss improved from inf to 1.95194, saving model to ./models/collar.best0514a_InceptionResNetV2.h5

lr=0.00002
Train on 8152 samples, validate on 906 samples
Epoch 1/1
8152/8152 [==============================] - 317s 39ms/step - loss: 0.4691 - acc: 0.8245 - val_loss: 0.4960 - val_acc: 0.8079

Epoch 00001: val_loss improved from inf to 0.49599, saving model to ./models/collar.best0514a_InceptionResNetV2.h5

lr=0.00002
Train on 8152 samples, validate on 906 samples
Epoch 1/1
8152/8152 [==============================] - 272s 33ms/step - loss: 0.3822 - acc: 0.8583 - val_loss: 0.4839 - val_acc: 0.8124

Epoch 00001: val_loss improved from inf to 0.48393, saving model to ./models/collar.best0514a_InceptionResNetV2.h5

lr=0.00002
Train on 8152 samples, validate on 906 samples
Epoch 1/1
8152/8152 [==============================] - 269s 33ms/step - loss: 0.3160 - acc: 0.8824 - val_loss: 0.4636 - val_acc: 0.8157

Epoch 00001: val_loss improved from inf to 0.46359, saving model to ./models/collar.best0514a_InceptionResNetV2.h5


------------------------------------------------
label: collar  2 种预处理, 旋转10°, 作为水平翻转的对比测试(到底是因为增强,还是因为翻转)
model: collar.best0514a_InceptionResNetV2.h5

lr=0.001
Train on 16304 samples, validate on 1812 samples
Epoch 1/1
16304/16304 [==============================] - 594s 36ms/step - loss: 0.7788 - acc: 0.6922 - val_loss: 0.6492 - val_acc: 0.7655

Epoch 00001: val_loss improved from inf to 0.64923, saving model to ./models/collar.best0514a_InceptionResNetV2.h5

lr=0.00002
Train on 16304 samples, validate on 1812 samples
Epoch 1/1
16304/16304 [==============================] - 589s 36ms/step - loss: 0.3293 - acc: 0.8799 - val_loss: 0.4458 - val_acc: 0.8344

Epoch 00001: val_loss improved from inf to 0.44581, saving model to ./models/collar.best0514a_InceptionResNetV2.h5


------------------------------------------------
label: pant  2 种预处理
model: pant.best0514a_InceptionResNetV2.h5
result: pant_0514a_InceptionResNetV2.csv

lr = 0.001
Train on 25204 samples, validate on 2802 samples
Epoch 1/1
25204/25204 [==============================] - 895s 36ms/step - loss: 0.9238 - acc: 0.6163 - val_loss: 0.8989 - val_acc: 0.6320

Epoch 00001: val_loss improved from inf to 0.89889, saving model to ./models/pant.best0514a_InceptionResNetV2.h5

lr=0.00002
Train on 25204 samples, validate on 2802 samples
Epoch 1/1
25204/25204 [==============================] - 872s 35ms/step - loss: 0.5945 - acc: 0.7475 - val_loss: 0.6593 - val_acc: 0.7234

Epoch 00001: val_loss improved from inf to 0.65926, saving model to ./models/pant.best0514a_InceptionResNetV2.h5
------------------------------------------------

label: collar  4 种预处理, 水平翻转,高斯噪声=20, 颜色抖动
model: collar.best0514a_InceptionResNetV2.h5
result: collar_0514a_InceptionResNetV2.csv

lr=0.001
Train on 32608 samples, validate on 3624 samples
Epoch 1/1
32608/32608 [==============================] - 1141s 35ms/step - loss: 0.7121 - acc: 0.7242 - val_loss: 0.8869 - val_acc: 0.7064

Epoch 00001: val_loss improved from inf to 0.88691, saving model to ./models/collar.best0514a_InceptionResNetV2.h5


lr=0.00002
Train on 32608 samples, validate on 3624 samples
Epoch 1/2
32608/32608 [==============================] - 1142s 35ms/step - loss: 0.2934 - acc: 0.8930 - val_loss: 0.4581 - val_acc: 0.8220

Epoch 00001: val_loss improved from inf to 0.45815, saving model to ./models/collar.best0514a_InceptionResNetV2.h5

Train on 32608 samples, validate on 3624 samples
Epoch 2/2
32608/32608 [==============================] - 1090s 33ms/step - loss: 0.1961 - acc: 0.9291 - val_loss: 0.4935 - val_acc: 0.8234

Epoch 00001: val_loss improved from inf to 0.49353, saving model to ./models/collar.best0514a_InceptionResNetV2.h5

```

>>> 18.5.13
```
label: sleeve  3 种预处理, 水平翻转,高斯噪声=20, 模糊边界给定权重
model: sleeve.best0513a_InceptionResNetV2.h5
result: sleeve_0513a_InceptionResNetV2.csv

lr=0.001
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1579s 34ms/step - loss: 1.1062 - acc: 0.4172 - val_loss: 0.9578 - val_acc: 0.4851

Epoch 00001: val_loss improved from inf to 0.95777, saving model to ./models/sleeve.best0513a_InceptionResNetV2.h5

lr=0.00002
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1587s 34ms/step - loss: 0.7149 - acc: 0.5699 - val_loss: 0.7849 - val_acc: 0.5487

Epoch 00001: val_loss improved from inf to 0.78493, saving model to ./models/sleeve.best0513a_InceptionResNetV2.h5
```

>>> 18.5.12
```
label: neckline  3 种预处理, 水平翻转,高斯噪声=20, 去掉边界模糊的图片
model: neckline.best0512a_InceptionResNetV2.h5
result: neckline_0512a_InceptionResNetV2.csv

lr=0.001
Train on 43428 samples, validate on 4827 samples
Epoch 1/1
43428/43428 [==============================] - 1501s 35ms/step - loss: 1.2617 - acc: 0.5685 - val_loss: 1.4588 - val_acc: 0.5370

Epoch 00001: val_loss improved from inf to 1.45882, saving model to ./models/neckline.best0512a_InceptionResNetV2.h5

lr=0.00002
Train on 43428 samples, validate on 4827 samples
Epoch 1/1
43428/43428 [==============================] - 1502s 35ms/step - loss: 0.6256 - acc: 0.7900 - val_loss: 0.7316 - val_acc: 0.7632
Epoch 00001: val_loss improved from inf to 0.73163, saving model to ./models/neckline.best0512a_InceptionResNetV2.h5

------------------------------------------------

label: skirt  3 种预处理, 水平翻转,高斯噪声=20, 去掉边界模糊的图片
model: skirt.best0512a_InceptionResNetV2.h5
result: skirt_0512a_InceptionResNetV2.csv

lr=0.001
Train on 31290 samples, validate on 3477 samples
Epoch 1/1
31290/31290 [==============================] - 1082s 35ms/step - loss: 0.8661 - acc: 0.6369 - val_loss: 0.9525 - val_acc: 0.6212

Epoch 00001: val_loss improved from inf to 0.95252, saving model to ./models/skirt.best0512a_InceptionResNetV2.h5

lr=0.00002
Train on 31290 samples, validate on 3477 samples
Epoch 1/1
31290/31290 [==============================] - 1080s 35ms/step - loss: 0.5314 - acc: 0.7807 - val_loss: 0.6430 - val_acc: 0.7400

Epoch 00001: val_loss improved from inf to 0.64299, saving model to ./models/skirt.best0512a_InceptionResNetV2.h5



------------------------------------------------

label: sleeve  3 种预处理, 水平翻转,高斯噪声=20, 去掉边界模糊的图片
model: sleeve.best0512a_InceptionResNetV2.h5
result: sleeve_0512a_InceptionResNetV2.csv

lr=0.001
没有得到信息, 模型得到了

lr=0.00002
Train on 39411 samples, validate on 4380 samples
Epoch 1/1
39411/39411 [==============================] - 1334s 34ms/step - loss: 0.7969 - acc: 0.6882 - val_loss: 0.8927 - val_acc: 0.6582

Epoch 00001: val_loss improved from inf to 0.89275, saving model to ./models/sleeve.best0512a_InceptionResNetV2.h5
```

>>> 18.5.11
```
label: collar  5 种预处理, 水平翻转,高斯噪声=0, 0.5, 旋转5°, 放大 5%
model: collar.best0511c_InceptionResNetV2.h5
result: collar_0511c_InceptionResNetV2.csv

lr=0.001
Train on 40760 samples, validate on 4530 samples
Epoch 1/1
40760/40760 [==============================] - 1382s 34ms/step - loss: 0.5765 - acc: 0.7825 - val_loss: 0.7275 - val_acc: 0.7446

Epoch 00001: val_loss improved from inf to 0.72749, saving model to ./models/collar.best0511d_InceptionResNetV2.h5

lr=0.00005
Train on 40760 samples, validate on 4530 samples
Epoch 1/1
40760/40760 [==============================] - 1381s 34ms/step - loss: 0.1943 - acc: 0.9298 - val_loss: 0.4335 - val_acc: 0.8430

Epoch 00001: val_loss improved from inf to 0.43350, saving model to ./models/collar.best0511d_InceptionResNetV2.h5
------------------------------------------------
label: collar  3 种预处理, 水平翻转,高斯噪声=0, 0.5
model: collar.best0511b_InceptionResNetV2.h5
result: collar_0511b_InceptionResNetV2.csv

lr=0.001
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 857s 35ms/step - loss: 0.6946 - acc: 0.7344 - val_loss: 0.6647 - val_acc: 0.7528

Epoch 00001: val_loss improved from inf to 0.66472, saving model to ./models/collar.best0511c_InceptionResNetV2.h5

lr=0.00005
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 852s 35ms/step - loss: 0.2859 - acc: 0.8992 - val_loss: 0.4152 - val_acc: 0.8341

Epoch 00001: val_loss improved from inf to 0.41521, saving model to ./models/collar.best0511c_InceptionResNetV2.h5

------------------------------------------------
label: skirt  3 种预处理, 水平翻转,高斯噪声=0.2
model: skirt.best0511b_InceptionResNetV2.h5
result: skirt_0511a_InceptionResNetV2.csv


Train on 33897 samples, validate on 3768 samples
Epoch 1/1
33897/33897 [==============================] - 1149s 34ms/step - loss: 0.9695 - acc: 0.5993 - val_loss: 0.6159 - val_acc: 0.4177

Epoch 00001: val_loss improved from inf to 0.61594, saving model to ./models/skirt.best0511b_InceptionResNetV2.h5

lr=0.00005
Train on 33897 samples, validate on 3768 samples
Epoch 1/1
33897/33897 [==============================] - 1165s 34ms/step - loss: 0.6192 - acc: 0.7448 - val_loss: 0.7330 - val_acc: 0.6982

Epoch 00001: val_loss improved from inf to 0.48408, saving model to ./models/skirt.best0511b_InceptionResNetV2.h5


------------------------------------------------
label: neckline  3 种预处理, 水平翻转,高斯噪声=0.2
model: neckline.best0511b_InceptionResNetV2.h5
result: neckline_0511a_InceptionResNetV2.csv

lr=0.001
Train on 44214 samples, validate on 4914 samples
Epoch 1/1
44214/44214 [==============================] - 1491s 34ms/step - loss: 1.2239 - acc: 0.5842 - val_loss: 0.7300 - val_acc: 0.7617

Epoch 00001: val_loss improved from inf to 0.72998, saving model to ./models/neckline.best0511b_InceptionResNetV2.h5

lr=0.00005
Train on 44214 samples, validate on 4914 samples
Epoch 1/1
44214/44214 [==============================] - 1482s 34ms/step - loss: 0.5785 - acc: 0.8030 - val_loss: 0.7244 - val_acc: 0.7576

Epoch 00001: val_loss improved from inf to 0.45518, saving model to ./models/neckline.best0511b_InceptionResNetV2.h5
------------------------------------------------
label: collar  3 种预处理, 水平翻转,高斯噪声=0.2
model: collar.best0511b_InceptionResNetV2.h5
result: collar_0511a_InceptionResNetV2.csv

lr=0.001
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 868s 35ms/step - loss: 0.6782 - acc: 0.7408 - val_loss: 0.8743 - val_acc: 0.7539

Epoch 00001: val_loss improved from inf to 0.87433, saving model to ./models/collar.best0511b_InceptionResNetV2.h5

lr=0.00002
Train on 24456 samples, validate on 2718 samples
Epoch 1/1
24456/24456 [==============================] - 844s 34ms/step - loss: 0.1765 - acc: 0.9366 - val_loss: 0.4586 - val_acc: 0.8377

Epoch 00001: val_loss improved from inf to 0.28553, saving model to ./models/collar.best0511b_InceptionResNetV2.h5

------------------------------------------------
label: sleeve  3 种预处理, 水平翻转,高斯噪声=0.2
model: sleeve.best0511b_InceptionResNetV2.h5
result: sleeve_0511a_InceptionResNetV2.csv

lr=0.001
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1605s 34ms/step - loss: 1.3519 - acc: 0.4605 - val_loss: 0.8489 - val_acc: 0.3410

Epoch 00001: val_loss improved from inf to 0.84893, saving model to ./models/sleeve.best0511b_InceptionResNetV2.h5

lr=0.00002
Train on 46668 samples, validate on 5187 samples
Epoch 1/1
46668/46668 [==============================] - 1605s 34ms/step - loss: 0.9027 - acc: 0.6242 - val_loss: 0.9742 - val_acc: 0.5962

Epoch 00001: val_loss improved from inf to 0.63554, saving model to ./models/sleeve.best0511b_InceptionResNetV2.h5
------------------------------------------------

label: sleeve  2 种预处理, 水平翻转+边缘填充
model: sleeve.best0511a_InceptionResNetV2.h5

lr=0.001
Train on 31112 samples, validate on 3458 samples
Epoch 1/1
31112/31112 [==============================] - 1090s 35ms/step - loss: 1.4208 - acc: 0.4326 - val_loss: 1.2573 - val_acc: 0.4896

Epoch 00001: val_loss improved from inf to 1.25727, saving model to ./models/sleeve.best0511a_InceptionResNetV2.h5

lr=0.00002
Train on 31112 samples, validate on 3458 samples
Epoch 1/1
31112/31112 [==============================] - 1084s 35ms/step - loss: 0.9926 - acc: 0.5849 - val_loss: 0.9975 - val_acc: 0.5844

Epoch 00001: val_loss improved from inf to 0.99745, saving model to ./models/sleeve.best0511a_InceptionResNetV2.h5
```

>>> 18.5.10
```
label: sleeve  2 种预处理, 水平翻转
model: sleeve.best0510_InceptionResNetV2.h5
result: sleeve_0510b_InceptionResNetV2.csv

lr=0.001
Train on 31112 samples, validate on 3458 samples
Epoch 1/1
31112/31112 [==============================] - 1071s 34ms/step - loss: 1.3743 - acc: 0.4509 - val_loss: 1.1990 - val_acc: 0.4974

Epoch 00001: val_loss improved from inf to 1.19905, saving model to ./models/sleeve.best0510_InceptionResNetV2.h5

lr=0.00002

Train on 31112 samples, validate on 3458 samples
Epoch 1/1
31112/31112 [==============================] - 1073s 34ms/step - loss: 0.9435 - acc: 0.6078 - val_loss: 0.9687 - val_acc: 0.5856

Epoch 00001: val_loss improved from inf to 0.96868, saving model to ./models/sleeve.best0510_InceptionResNetV2.h5

label: skirt  2 种预处理, 水平翻转
model: skirt.best0510_InceptionResNetV2.h5
result: skirt_0510b_InceptionResNetV2.csv

lr=0.001
Train on 22598 samples, validate on 2512 samples
Epoch 1/1
22598/22598 [==============================] - 796s 35ms/step - loss: 1.0424 - acc: 0.5717 - val_loss: 3.3417 - val_acc: 0.3372

Epoch 00001: val_loss improved from inf to 3.34166, saving model to ./models/skirt.best0510_InceptionResNetV2.h5

lr=0.00002
Train on 22598 samples, validate on 2512 samples
Epoch 1/1
22598/22598 [==============================] - 790s 35ms/step - loss: 0.6935 - acc: 0.7109 - val_loss: 0.7565 - val_acc: 0.6943

Epoch 00001: val_loss improved from inf to 0.75650, saving model to ./models/skirt.best0510_InceptionResNetV2.h5

label: neckline  2 种预处理, 水平翻转
model: neckline.best0510_InceptionResNetV2.h5
result: neckline_0510b_InceptionResNetV2.csv

lr=0.001
Train on 29476 samples, validate on 3276 samples
Epoch 1/1
29476/29476 [==============================] - 1018s 35ms/step - loss: 1.3818 - acc: 0.5226 - val_loss: 1.1583 - val_acc: 0.6200

Epoch 00001: val_loss improved from inf to 1.15834, saving model to ./models/neckline.best0510_InceptionResNetV2.h5

lr=0.00002

Train on 29476 samples, validate on 3276 samples
Epoch 1/1
29476/29476 [==============================] - 1020s 35ms/step - loss: 0.7425 - acc: 0.7479 - val_loss: 0.7571 - val_acc: 0.7454

Epoch 00001: val_loss improved from inf to 0.75712, saving model to ./models/neckline.best0510_InceptionResNetV2.h5


label: collar  2 种预处理, 水平翻转
model: collar.best0510_InceptionResNetV2.h5
result: collar_0510b_InceptionResNetV2.csv

lr=0.001
Epoch 1/1
16304/16304 [==============================] - 592s 36ms/step - loss: 0.7318 - acc: 0.7155 - val_loss: 1.3679 - val_acc: 0.5905

Epoch 00001: val_loss improved from inf to 1.36787, saving model to ./models/collar.best0510_InceptionResNetV2.h5

lr=0.00002
Train on 16304 samples, validate on 1812 samples
Epoch 1/1
16304/16304 [==============================] - 587s 36ms/step - loss: 0.3188 - acc: 0.8829 - val_loss: 0.4114 - val_acc: 0.8427

Epoch 00001: val_loss improved from inf to 0.41138, saving model to ./models/collar.best0510_InceptionResNetV2.h5


>>> 18.5.9
```
label: collar  8 种预处理
model: collar.best0509_InceptionResNetV2.h5
result: collar_0510_InceptionResNetV2.csv

lr=0.001
Epoch 1/2
65216/65216 [==============================] - 2219s 34ms/step - loss: 0.3390 - acc: 0.8704 - val_loss: 0.5891 - val_acc: 0.84699

lr=0.00002
Epoch 1/1
65216/65216 [==============================] - 2213s 34ms/step - loss: 0.0335 - acc: 0.9889 - val_loss: 0.6983 - val_acc: 0.8491

```

>>> 18.5.5
```
label: skirt lr=0.001
batch_size = 128

重新再训练, patience=10

重新训练 lr = 0.0001
model: skirt.best0506_InceptionResNetV2.h5
result: skirt_0506_InceptionResNetV2.csv

Epoch 1/32
 - 233s - loss: 0.5018 - acc: 0.7880 - val_loss: 0.7421 - val_acc: 0.7185

Epoch 00001: val_loss improved from inf to 0.74210, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 2/32
 - 234s - loss: 0.5188 - acc: 0.7910 - val_loss: 0.7334 - val_acc: 0.7401

Epoch 00002: val_loss improved from 0.74210 to 0.73341, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 3/32
 - 231s - loss: 0.4863 - acc: 0.8022 - val_loss: 0.7696 - val_acc: 0.7124

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 232s - loss: 0.4835 - acc: 0.8010 - val_loss: 0.7857 - val_acc: 0.7218

Epoch 00004: val_loss did not improve
Epoch 5/32
 - 232s - loss: 0.4366 - acc: 0.8175 - val_loss: 0.7687 - val_acc: 0.7341

Epoch 00005: val_loss did not improve
Epoch 6/32
 - 231s - loss: 0.4763 - acc: 0.8050 - val_loss: 0.7849 - val_acc: 0.7270

Epoch 00006: val_loss did not improve
Epoch 7/32
 - 231s - loss: 0.4237 - acc: 0.8279 - val_loss: 0.8461 - val_acc: 0.6999

Epoch 00007: val_loss did not improve
Epoch 8/32
 - 232s - loss: 0.4237 - acc: 0.8272 - val_loss: 0.7976 - val_acc: 0.7285

Epoch 00008: val_loss did not improve
Epoch 9/32
 - 231s - loss: 0.3947 - acc: 0.8363 - val_loss: 0.8159 - val_acc: 0.7281

Epoch 00009: val_loss did not improve
Epoch 10/32
 - 232s - loss: 0.4053 - acc: 0.8326 - val_loss: 0.8464 - val_acc: 0.7234

Epoch 00010: val_loss did not improve
Epoch 11/32
 - 232s - loss: 0.3735 - acc: 0.8471 - val_loss: 0.8638 - val_acc: 0.7213

Epoch 00011: val_loss did not improve
Epoch 12/32
 - 231s - loss: 0.3877 - acc: 0.8390 - val_loss: 0.9031 - val_acc: 0.7059

Epoch 00012: val_loss did not improve
Epoch 13/32
 - 232s - loss: 0.3535 - acc: 0.8597 - val_loss: 0.9168 - val_acc: 0.7133

Epoch 00013: val_loss did not improve
Epoch 14/32
 - 231s - loss: 0.3588 - acc: 0.8558 - val_loss: 0.9042 - val_acc: 0.7072

Epoch 00014: val_loss did not improve
Epoch 15/32
KeyboardInterrupt

- label: skirt lr = 0.0001
- batch_size = 64

Epoch 1/32
 - 282s - loss: 0.6792 - acc: 0.7262 - val_loss: 0.7144 - val_acc: 0.7140

Epoch 00001: val_loss improved from inf to 0.71437, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 2/32
 - 237s - loss: 0.6356 - acc: 0.7310 - val_loss: 0.7050 - val_acc: 0.7287

Epoch 00002: val_loss improved from 0.71437 to 0.70498, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 3/32
 - 237s - loss: 0.5907 - acc: 0.7528 - val_loss: 0.7188 - val_acc: 0.7285

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 237s - loss: 0.5912 - acc: 0.7543 - val_loss: 0.7160 - val_acc: 0.7337

Epoch 00004: val_loss did not improve
Epoch 5/32
 - 232s - loss: 0.5604 - acc: 0.7640 - val_loss: 0.7295 - val_acc: 0.7216

Epoch 00005: val_loss did not improve
Epoch 6/32
 - 231s - loss: 0.5673 - acc: 0.7640 - val_loss: 0.7326 - val_acc: 0.7316

Epoch 00006: val_loss did not improve
Epoch 7/32
 - 231s - loss: 0.5312 - acc: 0.7800 - val_loss: 0.7250 - val_acc: 0.7227

Epoch 00007: val_loss did not improve

- 重新训练一下 skirt 

Epoch 1/32
 - 116s - loss: 0.9106 - acc: 0.6143 - val_loss: 0.9058 - val_acc: 0.6255

Epoch 00001: val_loss improved from inf to 0.90577, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 2/32
 - 117s - loss: 0.9307 - acc: 0.6218 - val_loss: 1.0735 - val_acc: 0.5817

Epoch 00002: val_loss did not improve
Epoch 3/32
 - 118s - loss: 0.8986 - acc: 0.6179 - val_loss: 0.9504 - val_acc: 0.6182

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 117s - loss: 0.9315 - acc: 0.6080 - val_loss: 1.4038 - val_acc: 0.5047

Epoch 00004: val_loss did not improve
Epoch 5/32
 - 117s - loss: 0.9153 - acc: 0.6215 - val_loss: 0.9224 - val_acc: 0.6388

Epoch 00005: val_loss did not improve
Epoch 6/32
 - 118s - loss: 0.8488 - acc: 0.6491 - val_loss: 0.8776 - val_acc: 0.6323

Epoch 00006: val_loss improved from 0.90577 to 0.87763, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 7/32
 - 118s - loss: 0.8590 - acc: 0.6357 - val_loss: 0.9098 - val_acc: 0.6432

Epoch 00007: val_loss did not improve
Epoch 8/32
 - 118s - loss: 0.8559 - acc: 0.6509 - val_loss: 0.9355 - val_acc: 0.6139

Epoch 00008: val_loss did not improve
Epoch 9/32
 - 118s - loss: 0.8176 - acc: 0.6609 - val_loss: 0.8801 - val_acc: 0.6508

Epoch 00009: val_loss did not improve
Epoch 10/32
 - 118s - loss: 0.8124 - acc: 0.6594 - val_loss: 0.9318 - val_acc: 0.6562

Epoch 00010: val_loss did not improve
Epoch 11/32
 - 116s - loss: 0.8357 - acc: 0.6485 - val_loss: 0.9650 - val_acc: 0.6349

Epoch 00011: val_loss did not improve
Epoch 12/32
 - 115s - loss: 0.8488 - acc: 0.6506 - val_loss: 0.8621 - val_acc: 0.6616

Epoch 00012: val_loss improved from 0.87763 to 0.86211, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 13/32
 - 115s - loss: 0.7710 - acc: 0.6765 - val_loss: 0.9220 - val_acc: 0.6634

Epoch 00013: val_loss did not improve
Epoch 14/32
 - 115s - loss: 0.7841 - acc: 0.6786 - val_loss: 1.2593 - val_acc: 0.5785

Epoch 00014: val_loss did not improve
Epoch 15/32
 - 115s - loss: 0.7871 - acc: 0.6676 - val_loss: 0.8825 - val_acc: 0.6609

Epoch 00015: val_loss did not improve
Epoch 16/32
 - 114s - loss: 0.8744 - acc: 0.6545 - val_loss: 1.0847 - val_acc: 0.5781

Epoch 00016: val_loss did not improve
Epoch 17/32
 - 115s - loss: 0.8181 - acc: 0.6655 - val_loss: 0.8183 - val_acc: 0.6757

Epoch 00017: val_loss improved from 0.86211 to 0.81834, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 18/32
 - 115s - loss: 0.7675 - acc: 0.6879 - val_loss: 0.8909 - val_acc: 0.6598

Epoch 00018: val_loss did not improve
Epoch 19/32
 - 114s - loss: 0.7668 - acc: 0.6932 - val_loss: 0.8853 - val_acc: 0.6403

Epoch 00019: val_loss did not improve
Epoch 20/32
 - 115s - loss: 0.7588 - acc: 0.6864 - val_loss: 0.8621 - val_acc: 0.6396

Epoch 00020: val_loss did not improve
Epoch 21/32
 - 115s - loss: 0.7193 - acc: 0.6939 - val_loss: 1.0077 - val_acc: 0.6114

Epoch 00021: val_loss did not improve
Epoch 22/32
 - 115s - loss: 0.7522 - acc: 0.6871 - val_loss: 0.8986 - val_acc: 0.6652

Epoch 00022: val_loss did not improve
Epoch 23/32
 - 114s - loss: 0.7459 - acc: 0.6854 - val_loss: 0.8562 - val_acc: 0.6678

Epoch 00023: val_loss did not improve
Epoch 24/32
 - 115s - loss: 0.7385 - acc: 0.6971 - val_loss: 0.8463 - val_acc: 0.6565

Epoch 00024: val_loss did not improve
Epoch 25/32
 - 114s - loss: 0.7134 - acc: 0.7000 - val_loss: 0.8751 - val_acc: 0.6367

Epoch 00025: val_loss did not improve
Epoch 26/32
 - 115s - loss: 0.7066 - acc: 0.7081 - val_loss: 0.9576 - val_acc: 0.6515

Epoch 00026: val_loss did not improve
Epoch 27/32
 - 115s - loss: 0.7203 - acc: 0.7095 - val_loss: 0.9294 - val_acc: 0.6255

Epoch 00027: val_loss did not improve

Epoch 1/32
 - 167s - loss: 1.4022 - acc: 0.4261 - val_loss: 1.9211 - val_acc: 0.3803

Epoch 00001: val_loss improved from inf to 1.92114, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 2/32
 - 117s - loss: 1.2139 - acc: 0.4901 - val_loss: 1.9215 - val_acc: 0.3933

Epoch 00002: val_loss did not improve
Epoch 3/32
 - 118s - loss: 1.1143 - acc: 0.5309 - val_loss: 2.7244 - val_acc: 0.4501

Epoch 00003: val_loss did not improve
Epoch 4/32
 - 118s - loss: 1.1115 - acc: 0.5185 - val_loss: 1.2705 - val_acc: 0.5130

Epoch 00004: val_loss improved from 1.92114 to 1.27048, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 5/32
 - 117s - loss: 1.0575 - acc: 0.5661 - val_loss: 1.1581 - val_acc: 0.5593

Epoch 00005: val_loss improved from 1.27048 to 1.15809, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 6/32
 - 117s - loss: 1.0538 - acc: 0.5479 - val_loss: 1.0362 - val_acc: 0.5691

Epoch 00006: val_loss improved from 1.15809 to 1.03616, saving model to ./models/skirt.best0506_InceptionResNetV2.h5
Epoch 7/32
 - 115s - loss: 0.9803 - acc: 0.5863 - val_loss: 1.0990 - val_acc: 0.5777

Epoch 00007: val_loss did not improve
Epoch 8/32
 - 115s - loss: 1.0006 - acc: 0.5728 - val_loss: 1.0458 - val_acc: 0.5705

Epoch 00008: val_loss did not improve
Epoch 9/32
 - 115s - loss: 0.9449 - acc: 0.5994 - val_loss: 1.2687 - val_acc: 0.5083

Epoch 00009: val_loss did not improve
Epoch 10/32
 - 115s - loss: 1.0029 - acc: 0.5871 - val_loss: 1.0730 - val_acc: 0.6009

Epoch 00010: val_loss did not improve
Epoch 11/32
 - 115s - loss: 0.9686 - acc: 0.6069 - val_loss: 1.0743 - val_acc: 0.5665

Epoch 00011: val_loss did not improve





```

>>> 18.5.4
```
label: sleeve lr=0.0001
model: sleeve.best0505b_InceptionResNetV2.h5
result: sleeve_0505_InceptionResNetV2.csv

Epoch 1/32
 - 702s - loss: 0.2472 - acc: 0.9012 - val_loss: 0.2572 - val_acc: 0.9138

Epoch 00001: val_loss improved from inf to 0.25720, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 2/32
 - 652s - loss: 0.2127 - acc: 0.9160 - val_loss: 0.2483 - val_acc: 0.9120

Epoch 00002: val_loss improved from 0.25720 to 0.24825, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 3/32
 - 654s - loss: 0.2073 - acc: 0.9174 - val_loss: 0.2474 - val_acc: 0.9132

Epoch 00003: val_loss improved from 0.24825 to 0.24735, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 4/32
 - 654s - loss: 0.1845 - acc: 0.9265 - val_loss: 0.2415 - val_acc: 0.9213

Epoch 00004: val_loss improved from 0.24735 to 0.24153, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 5/32
 - 655s - loss: 0.1741 - acc: 0.9306 - val_loss: 0.2329 - val_acc: 0.9306

Epoch 00005: val_loss improved from 0.24153 to 0.23286, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 6/32
 - 653s - loss: 0.1601 - acc: 0.9363 - val_loss: 0.2344 - val_acc: 0.9311

Epoch 00006: val_loss did not improve
Epoch 7/32
 - 654s - loss: 0.1562 - acc: 0.9397 - val_loss: 0.2298 - val_acc: 0.9334

Epoch 00007: val_loss improved from 0.23286 to 0.22985, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 8/32
 - 654s - loss: 0.1420 - acc: 0.9439 - val_loss: 0.2299 - val_acc: 0.9358

Epoch 00008: val_loss did not improve
Epoch 9/32
 - 655s - loss: 0.1368 - acc: 0.9462 - val_loss: 0.2288 - val_acc: 0.9392

Epoch 00009: val_loss improved from 0.22985 to 0.22885, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 10/32
 - 654s - loss: 0.1282 - acc: 0.9502 - val_loss: 0.2214 - val_acc: 0.9439

Epoch 00010: val_loss improved from 0.22885 to 0.22136, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 11/32
 - 654s - loss: 0.1247 - acc: 0.9521 - val_loss: 0.2281 - val_acc: 0.9433

Epoch 00011: val_loss did not improve
Epoch 12/32
 - 643s - loss: 0.1106 - acc: 0.9588 - val_loss: 0.2244 - val_acc: 0.9450

Epoch 00012: val_loss did not improve
Epoch 13/32
 - 643s - loss: 0.1042 - acc: 0.9597 - val_loss: 0.2314 - val_acc: 0.9508

Epoch 00013: val_loss did not improve
Epoch 14/32
 - 642s - loss: 0.1122 - acc: 0.9599 - val_loss: 0.2394 - val_acc: 0.9468

Epoch 00014: val_loss did not improve
Epoch 15/32
KeyboardInterrupt


label: sleeve lr=0.001, 不读入内存
model: sleeve.best0505b_InceptionResNetV2.h5

Epoch 1/16
 - 647s - loss: 0.6100 - acc: 0.7448 - val_loss: 0.6528 - val_acc: 0.7251

Epoch 00001: val_loss improved from inf to 0.65276, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 2/16
 - 646s - loss: 0.5686 - acc: 0.7600 - val_loss: 0.5794 - val_acc: 0.7604

Epoch 00002: val_loss improved from 0.65276 to 0.57937, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 3/16
 - 647s - loss: 0.5592 - acc: 0.7675 - val_loss: 0.5185 - val_acc: 0.7905

Epoch 00003: val_loss improved from 0.57937 to 0.51847, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 4/16
 - 647s - loss: 0.5514 - acc: 0.7730 - val_loss: 0.4637 - val_acc: 0.8021

Epoch 00004: val_loss improved from 0.51847 to 0.46373, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 5/16
 - 644s - loss: 0.5304 - acc: 0.7825 - val_loss: 0.5055 - val_acc: 0.7824

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 642s - loss: 0.5070 - acc: 0.7894 - val_loss: 0.4995 - val_acc: 0.7957

Epoch 00006: val_loss did not improve
Epoch 7/16
 - 641s - loss: 0.5333 - acc: 0.7824 - val_loss: 0.4509 - val_acc: 0.8154

Epoch 00007: val_loss improved from 0.46373 to 0.45095, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 8/16
 - 642s - loss: 0.4651 - acc: 0.8106 - val_loss: 0.5088 - val_acc: 0.8044

Epoch 00008: val_loss did not improve
Epoch 9/16
 - 640s - loss: 0.4275 - acc: 0.8218 - val_loss: 0.5542 - val_acc: 0.7911

Epoch 00009: val_loss did not improve
Epoch 10/16
 - 636s - loss: 0.4129 - acc: 0.8300 - val_loss: 0.4051 - val_acc: 0.8443

Epoch 00010: val_loss improved from 0.45095 to 0.40514, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 11/16
 - 636s - loss: 0.4087 - acc: 0.8353 - val_loss: 0.5839 - val_acc: 0.7899

Epoch 00011: val_loss did not improve
Epoch 12/16
 - 636s - loss: 0.3808 - acc: 0.8449 - val_loss: 0.5084 - val_acc: 0.8131

Epoch 00012: val_loss did not improve
Epoch 13/16
 - 637s - loss: 0.3655 - acc: 0.8531 - val_loss: 0.3539 - val_acc: 0.8652

Epoch 00013: val_loss improved from 0.40514 to 0.35391, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 14/16
 - 637s - loss: 0.3487 - acc: 0.8565 - val_loss: 0.4189 - val_acc: 0.8559

Epoch 00014: val_loss did not improve
Epoch 15/16
 - 636s - loss: 0.3682 - acc: 0.8560 - val_loss: 0.3649 - val_acc: 0.8727

Epoch 00015: val_loss did not improve
Epoch 16/16

label: sleeve lr=0.001, 不读入内存

Epoch 1/16
 - 693s - loss: 1.6007 - acc: 0.3710 - val_loss: 1.3287 - val_acc: 0.4635

Epoch 00001: val_loss improved from inf to 1.32874, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 2/16
 - 646s - loss: 1.3272 - acc: 0.4666 - val_loss: 1.5292 - val_acc: 0.4595

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 645s - loss: 1.2215 - acc: 0.5033 - val_loss: 1.1626 - val_acc: 0.5260

Epoch 00003: val_loss improved from 1.32874 to 1.16263, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 4/16
 - 649s - loss: 1.1271 - acc: 0.5445 - val_loss: 1.2744 - val_acc: 0.4896

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 647s - loss: 1.0677 - acc: 0.5673 - val_loss: 1.0012 - val_acc: 0.5590

Epoch 00005: val_loss improved from 1.16263 to 1.00118, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 6/16
 - 646s - loss: 1.0229 - acc: 0.5810 - val_loss: 1.0943 - val_acc: 0.5712

Epoch 00006: val_loss did not improve
Epoch 7/16
 - 641s - loss: 0.9535 - acc: 0.6062 - val_loss: 0.9188 - val_acc: 0.6285

Epoch 00007: val_loss improved from 1.00118 to 0.91880, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 8/16
 - 641s - loss: 0.8940 - acc: 0.6282 - val_loss: 1.0467 - val_acc: 0.5990

Epoch 00008: val_loss did not improve
Epoch 9/16
 - 641s - loss: 0.8979 - acc: 0.6314 - val_loss: 0.8582 - val_acc: 0.6453

Epoch 00009: val_loss improved from 0.91880 to 0.85823, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 10/16
 - 640s - loss: 0.8526 - acc: 0.6426 - val_loss: 0.8528 - val_acc: 0.6522

Epoch 00010: val_loss improved from 0.85823 to 0.85277, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 11/16
 - 639s - loss: 0.8106 - acc: 0.6649 - val_loss: 0.7350 - val_acc: 0.6910

Epoch 00011: val_loss improved from 0.85277 to 0.73499, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 12/16
 - 638s - loss: 0.7535 - acc: 0.6832 - val_loss: 0.7103 - val_acc: 0.6962

Epoch 00012: val_loss improved from 0.73499 to 0.71031, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 13/16
 - 639s - loss: 0.7319 - acc: 0.6924 - val_loss: 0.6498 - val_acc: 0.7228

Epoch 00013: val_loss improved from 0.71031 to 0.64984, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 14/16
 - 642s - loss: 0.7526 - acc: 0.6918 - val_loss: 0.6691 - val_acc: 0.7176

Epoch 00014: val_loss did not improve
Epoch 15/16
 - 644s - loss: 0.6937 - acc: 0.7082 - val_loss: 0.6417 - val_acc: 0.7332

Epoch 00015: val_loss improved from 0.64984 to 0.64166, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5
Epoch 16/16
 - 644s - loss: 0.6192 - acc: 0.7386 - val_loss: 0.5541 - val_acc: 0.7731

Epoch 00016: val_loss improved from 0.64166 to 0.55407, saving model to ./models/sleeve.best0505b_InceptionResNetV2.h5

label: sleeve lr=0.001, 读入内存

Epoch 1/16
 - 556s - loss: 1.5667 - acc: 0.3864 - val_loss: 1.5734 - val_acc: 0.3904

Epoch 00001: val_loss improved from inf to 1.57340, saving model to ./models/sleeve.best0505_InceptionResNetV2.h5
Epoch 2/16
 - 509s - loss: 1.3092 - acc: 0.4695 - val_loss: 1.5397 - val_acc: 0.4158

Epoch 00002: val_loss improved from 1.57340 to 1.53966, saving model to ./models/sleeve.best0505_InceptionResNetV2.h5
Epoch 3/16
 - 506s - loss: 1.1722 - acc: 0.5247 - val_loss: 1.4668 - val_acc: 0.4488

Epoch 00003: val_loss improved from 1.53966 to 1.46680, saving model to ./models/sleeve.best0505_InceptionResNetV2.h5
Epoch 4/16
 - 506s - loss: 1.1137 - acc: 0.5467 - val_loss: 1.4962 - val_acc: 0.4257

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 507s - loss: 1.0316 - acc: 0.5796 - val_loss: 1.5884 - val_acc: 0.4268

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 506s - loss: 0.9689 - acc: 0.6025 - val_loss: 1.6827 - val_acc: 0.4193

Epoch 00006: val_loss did not improve
Epoch 7/16
 - 506s - loss: 0.9195 - acc: 0.6168 - val_loss: 1.4740 - val_acc: 0.4436

Epoch 00007: val_loss did not improve
Epoch 8/16
 - 507s - loss: 0.8729 - acc: 0.6415 - val_loss: 1.4780 - val_acc: 0.4320

Epoch 00008: val_loss did not improve

label: skirt lr=0.00001
model: skirt.best0505_InceptionResNetV2.h5
result: skirt_0505_InceptionResNetV2.csv

Epoch 1/16
 - 437s - loss: 0.6104 - acc: 0.7423 - val_loss: 0.8749 - val_acc: 0.6545

Epoch 00001: val_loss improved from inf to 0.87491, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 2/16
 - 371s - loss: 0.5973 - acc: 0.7500 - val_loss: 0.8848 - val_acc: 0.6521

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 372s - loss: 0.5885 - acc: 0.7558 - val_loss: 0.8916 - val_acc: 0.6537

Epoch 00003: val_loss did not improve
Epoch 4/16
 - 372s - loss: 0.5789 - acc: 0.7537 - val_loss: 0.8880 - val_acc: 0.6521

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 371s - loss: 0.5744 - acc: 0.7593 - val_loss: 0.8923 - val_acc: 0.6513

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 371s - loss: 0.5825 - acc: 0.7532 - val_loss: 0.8875 - val_acc: 0.6568

Epoch 00006: val_loss did not improve

label: skirt lr=0.0001

Epoch 1/16
 - 423s - loss: 0.6641 - acc: 0.7223 - val_loss: 0.8667 - val_acc: 0.6513

Epoch 00001: val_loss improved from inf to 0.86669, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 2/16
 - 371s - loss: 0.6064 - acc: 0.7422 - val_loss: 0.8934 - val_acc: 0.6481

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 373s - loss: 0.5693 - acc: 0.7633 - val_loss: 0.9070 - val_acc: 0.6473

Epoch 00003: val_loss did not improve
Epoch 4/16
 - 373s - loss: 0.5350 - acc: 0.7720 - val_loss: 0.9310 - val_acc: 0.6377

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 369s - loss: 0.5179 - acc: 0.7842 - val_loss: 0.9732 - val_acc: 0.6513

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 368s - loss: 0.4864 - acc: 0.7971 - val_loss: 0.9784 - val_acc: 0.6433

Epoch 00006: val_loss did not improve

label: skirt lr=0.001

Epoch 1/16
 - 420s - loss: 1.2495 - acc: 0.4782 - val_loss: 1.3784 - val_acc: 0.4936

Epoch 00001: val_loss improved from inf to 1.37843, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 2/16
 - 369s - loss: 1.0491 - acc: 0.5664 - val_loss: 2.5224 - val_acc: 0.4355

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 370s - loss: 0.9695 - acc: 0.5992 - val_loss: 1.1393 - val_acc: 0.5374

Epoch 00003: val_loss improved from 1.37843 to 1.13930, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 4/16
 - 370s - loss: 0.9202 - acc: 0.6154 - val_loss: 1.8909 - val_acc: 0.4849

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 370s - loss: 0.8965 - acc: 0.6292 - val_loss: 1.1380 - val_acc: 0.5374

Epoch 00005: val_loss improved from 1.13930 to 1.13804, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 6/16
 - 369s - loss: 0.8512 - acc: 0.6503 - val_loss: 1.0886 - val_acc: 0.5717

Epoch 00006: val_loss improved from 1.13804 to 1.08864, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 7/16
 - 370s - loss: 0.8052 - acc: 0.6658 - val_loss: 0.9911 - val_acc: 0.5900

Epoch 00007: val_loss improved from 1.08864 to 0.99107, saving model to ./models/skirt.best0505_InceptionResNetV2.h5
Epoch 8/16
 - 369s - loss: 0.7650 - acc: 0.6845 - val_loss: 1.1175 - val_acc: 0.5613

Epoch 00008: val_loss did not improve
Epoch 9/16
 - 368s - loss: 0.7574 - acc: 0.6826 - val_loss: 1.1278 - val_acc: 0.5947

Epoch 00009: val_loss did not improve
Epoch 10/16
 - 368s - loss: 0.7628 - acc: 0.6855 - val_loss: 1.0175 - val_acc: 0.5876

Epoch 00010: val_loss did not improve
Epoch 11/16
 - 368s - loss: 0.7106 - acc: 0.7036 - val_loss: 1.1034 - val_acc: 0.5748

Epoch 00011: val_loss did not improve
Epoch 12/16
 - 369s - loss: 0.7067 - acc: 0.7011 - val_loss: 1.1250 - val_acc: 0.5661

Epoch 00012: val_loss did not improve

```


>>> 18.5.3
```
label: neckline lr=0.0001
model: neckline.best0504_InceptionResNetV2.h5 使用初赛数据, 效果变差
round1: 初赛数据集,未作切分, val set 还是 round2 切分出来的

Epoch 1/16
 - 676s - loss: 0.5961 - acc: 0.8168 - val_loss: 0.7352 - val_acc: 0.7387

Epoch 00001: val_loss improved from inf to 0.73515, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 2/16
 - 631s - loss: 0.4598 - acc: 0.8469 - val_loss: 0.7421 - val_acc: 0.7345

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 640s - loss: 0.4272 - acc: 0.8546 - val_loss: 0.7558 - val_acc: 0.7291

Epoch 00003: val_loss did not improve
Epoch 4/16
 - 641s - loss: 0.3783 - acc: 0.8697 - val_loss: 0.7777 - val_acc: 0.7311

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 641s - loss: 0.3687 - acc: 0.8734 - val_loss: 0.8191 - val_acc: 0.7181

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 641s - loss: 0.3325 - acc: 0.8874 - val_loss: 0.8120 - val_acc: 0.7253

Epoch 00006: val_loss did not improve

label: neckline lr=0.0001
model: neckline.best0504_InceptionResNetV2.h5
result: neckline_0504_InceptionResNetV2.csv

Epoch 1/16
 - 811s - loss: 0.2286 - acc: 0.9213 - val_loss: 0.6961 - val_acc: 0.7923

Epoch 00001: val_loss improved from inf to 0.69614, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 2/16

label: neckline lr=0.001

datagen = ImageDataGenerator(
        featurewise_center = False, # set input mean to 0 over the dataset
        samplewise_center = False, # set each sample mean to 0
        featurewise_std_normalization = False, # divide inputs by std of the dataset
        samplewise_std_normalization = False, # divide each input by its std
        zca_whitening = False, # apply ZCA whitening
        rotation_range = 10, # randomly rotate images in the range (degrees, 0 to 180)
        zoom_range = 0.1, # randomly zoom image
        width_shift_range = 0.1, # randomly shift images horizontally (fraction of total width)
        height_shift_range = 0.1, # randomly shift images vertivally (fraction of total heigth)
        horizontal_flip = True, # randomly flip images
        vertical_flip = False,
        shear_range = 0.05,
        fill_mode = 'constant',
        cval = 0)

Epoch 1/16
 - 815s - loss: 1.8208 - acc: 0.3575 - val_loss: 2.2809 - val_acc: 0.3345

Epoch 00001: val_loss improved from inf to 2.28094, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 2/16
 - 766s - loss: 1.3000 - acc: 0.5487 - val_loss: 1.7465 - val_acc: 0.5516

Epoch 00002: val_loss improved from 2.28094 to 1.74652, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 3/16
 - 766s - loss: 1.0769 - acc: 0.6340 - val_loss: 1.1588 - val_acc: 0.6100

Epoch 00003: val_loss improved from 1.74652 to 1.15881, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 4/16
 - 765s - loss: 0.9479 - acc: 0.6797 - val_loss: 1.0693 - val_acc: 0.6427

Epoch 00004: val_loss improved from 1.15881 to 1.06927, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 5/16
 - 767s - loss: 0.8449 - acc: 0.7159 - val_loss: 0.9612 - val_acc: 0.6743

Epoch 00005: val_loss improved from 1.06927 to 0.96119, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 6/16
 - 768s - loss: 0.7666 - acc: 0.7363 - val_loss: 0.9965 - val_acc: 0.6571

Epoch 00006: val_loss did not improve
Epoch 7/16
 - 762s - loss: 0.7100 - acc: 0.7572 - val_loss: 1.0633 - val_acc: 0.6419

Epoch 00007: val_loss did not improve
Epoch 8/16
 - 767s - loss: 0.6502 - acc: 0.7762 - val_loss: 0.9050 - val_acc: 0.6939

Epoch 00008: val_loss improved from 0.96119 to 0.90497, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 9/16
 - 759s - loss: 0.6096 - acc: 0.7908 - val_loss: 0.9045 - val_acc: 0.6973

Epoch 00009: val_loss improved from 0.90497 to 0.90452, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 10/16
 - 767s - loss: 0.5651 - acc: 0.8036 - val_loss: 0.8270 - val_acc: 0.7110

Epoch 00010: val_loss improved from 0.90452 to 0.82696, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 11/16
 - 766s - loss: 0.5182 - acc: 0.8177 - val_loss: 0.8879 - val_acc: 0.7086

Epoch 00011: val_loss did not improve
Epoch 12/16
 - 767s - loss: 0.4926 - acc: 0.8305 - val_loss: 0.8001 - val_acc: 0.7315

Epoch 00012: val_loss improved from 0.82696 to 0.80015, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 13/16
 - 766s - loss: 0.4593 - acc: 0.8408 - val_loss: 0.8563 - val_acc: 0.7182

Epoch 00013: val_loss did not improve
Epoch 14/16
 - 767s - loss: 0.4245 - acc: 0.8549 - val_loss: 0.8209 - val_acc: 0.7393

Epoch 00014: val_loss did not improve
Epoch 15/16
 - 766s - loss: 0.3861 - acc: 0.8698 - val_loss: 0.7646 - val_acc: 0.7600

Epoch 00015: val_loss improved from 0.80015 to 0.76456, saving model to ./models/neckline.best0504_InceptionResNetV2.h5
Epoch 16/16
 - 765s - loss: 0.3745 - acc: 0.8691 - val_loss: 0.8624 - val_acc: 0.7225

Epoch 00016: val_loss did not improve


```

>>> 18.5.2
```

切分数据集 0.5 batch_size = 16
model: neckline.best.h5
results: neckline_0502a.csv

label: neckline lr=0.00001
Epoch 1/16
 - 455s - loss: 0.3031 - acc: 0.8990 - val_loss: 0.8342 - val_acc: 0.7472

Epoch 00001: val_loss improved from inf to 0.83416, saving model to ./models/neckline.best.h5
Epoch 2/16
 - 415s - loss: 0.2374 - acc: 0.9215 - val_loss: 0.8653 - val_acc: 0.7450

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 413s - loss: 0.1890 - acc: 0.9373 - val_loss: 0.9595 - val_acc: 0.7335

Epoch 00003: val_loss did not improve
Epoch 4/16
 - 414s - loss: 0.1560 - acc: 0.9478 - val_loss: 0.9878 - val_acc: 0.7382

Epoch 00004: val_loss did not improve

label: neckline lr=0.00005
Epoch 1/16
 - 449s - loss: 0.5268 - acc: 0.8193 - val_loss: 0.9287 - val_acc: 0.7090

Epoch 00001: val_loss improved from inf to 0.92872, saving model to ./models/neckline.best.h5
Epoch 2/16
 - 407s - loss: 0.3691 - acc: 0.8762 - val_loss: 0.9658 - val_acc: 0.7215

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 405s - loss: 0.2600 - acc: 0.9130 - val_loss: 1.1582 - val_acc: 0.6936

Epoch 00003: val_loss did not improve
Epoch 4/16
KeyboardInterrupt


label: neckline lr=0.0001
Epoch 1/16
- 473s - loss: 1.4607 - acc: 0.4971 - val_loss: 1.5557 - val_acc: 0.5784

Epoch 00001: val_loss improved from inf to 1.55571, saving model to ./models/neckline.best.h5
Epoch 2/16
- 418s - loss: 0.8752 - acc: 0.7064 - val_loss: 1.0119 - val_acc: 0.6634

Epoch 00002: val_loss improved from 1.55571 to 1.01191, saving model to ./models/neckline.best.h5
Epoch 3/16


label: neckline lr=0.001
切分数据集 0.5

Epoch 1/16
 - 620s - loss: 2.2025 - acc: 0.2067 - val_loss: 3.0229 - val_acc: 0.1583

Epoch 00001: val_loss improved from inf to 3.02294, saving model to ./models/neckline.best.h5
Epoch 2/16
 - 568s - loss: 2.2025 - acc: 0.2043 - val_loss: 3.0471 - val_acc: 0.2187

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 568s - loss: 2.2040 - acc: 0.2058 - val_loss: 3.4043 - val_acc: 0.1402

Epoch 00003: val_loss did not improve
Epoch 4/16
 - 568s - loss: 2.1982 - acc: 0.2074 - val_loss: 2.1521 - val_acc: 0.2236

Epoch 00004: val_loss improved from 3.02294 to 2.15212, saving model to ./models/neckline.best.h5
Epoch 5/16
 - 569s - loss: 2.2022 - acc: 0.2061 - val_loss: 2.1559 - val_acc: 0.2251

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 569s - loss: 2.1950 - acc: 0.2102 - val_loss: 2.1536 - val_acc: 0.2236

Epoch 00006: val_loss did not improve
Epoch 7/16
 - 570s - loss: 2.1981 - acc: 0.2071 - val_loss: 4.0002 - val_acc: 0.1925

Epoch 00007: val_loss did not improve


```

>>> 18.4.27
```
label: collar lr=0.0001
model: collar.best.h5
output: collar_0427a.csv

Epoch 1/16
 - 310s - loss: 0.2472 - acc: 0.9062 - val_loss: 0.4081 - val_acc: 0.8592

Epoch 00001: val_loss improved from inf to 0.40813, saving model to ./models/collar.best.h5
Epoch 2/16
 - 267s - loss: 0.1885 - acc: 0.9342 - val_loss: 0.4480 - val_acc: 0.8611

Epoch 00002: val_loss did not improve
Epoch 3/16
 - 268s - loss: 0.1635 - acc: 0.9411 - val_loss: 0.4224 - val_acc: 0.8666

Epoch 00003: val_loss did not improve
Epoch 4/16
 - 269s - loss: 0.1326 - acc: 0.9485 - val_loss: 0.4709 - val_acc: 0.8832

Epoch 00004: val_loss did not improve

label: collar lr=0.001

# 切分数据集
X_train, X_valid, y_train, y_valid = train_test_split(X, y, test_size=0.12, random_state=42)

datagen = ImageDataGenerator(
        featurewise_center = False, # set input mean to 0 over the dataset
        samplewise_center = False, # set each sample mean to 0
        featurewise_std_normalization = False, # divide inputs by std of the dataset
        samplewise_std_normalization = False, # divide each input by its std
        zca_whitening = False, # apply ZCA whitening
        rotation_range = 10, # randomly rotate images in the range (degrees, 0 to 180)
        zoom_range = 0.1, # randomly zoom image
        width_shift_range = 0.1, # randomly shift images horizontally (fraction of total width)
        height_shift_range = 0.1, # randomly shift images vertivally (fraction of total heigth)
        horizontal_flip = True, # randomly flip images
        vertical_flip = False,
        shear_range = 0.1,
        fill_mode = 'constant',
        cval = 0)

datagen.fit(X_train)

Epoch 1/16
 - 315s - loss: 1.0282 - acc: 0.5953 - val_loss: 0.9123 - val_acc: 0.6366

Epoch 00001: val_loss improved from inf to 0.91233, saving model to ./models/collar.best.h5
Epoch 2/16
 - 262s - loss: 0.6849 - acc: 0.7376 - val_loss: 0.8703 - val_acc: 0.6642

Epoch 00002: val_loss improved from 0.91233 to 0.87030, saving model to ./models/collar.best.h5
Epoch 3/16
 - 262s - loss: 0.5527 - acc: 0.7951 - val_loss: 0.6401 - val_acc: 0.7599

Epoch 00003: val_loss improved from 0.87030 to 0.64010, saving model to ./models/collar.best.h5
Epoch 4/16
 - 262s - loss: 0.5112 - acc: 0.8100 - val_loss: 0.7089 - val_acc: 0.7672

Epoch 00004: val_loss did not improve
Epoch 5/16
 - 262s - loss: 0.4484 - acc: 0.8330 - val_loss: 0.7080 - val_acc: 0.7682

Epoch 00005: val_loss did not improve
Epoch 6/16
 - 262s - loss: 0.4103 - acc: 0.8471 - val_loss: 0.5351 - val_acc: 0.8151

Epoch 00006: val_loss improved from 0.64010 to 0.53512, saving model to ./models/collar.best.h5
Epoch 7/16
 - 276s - loss: 0.3655 - acc: 0.8634 - val_loss: 0.5369 - val_acc: 0.8040

Epoch 00007: val_loss did not improve
Epoch 8/16
 - 262s - loss: 0.3566 - acc: 0.8703 - val_loss: 1.1898 - val_acc: 0.6421

Epoch 00008: val_loss did not improve
Epoch 9/16
 - 262s - loss: 0.3149 - acc: 0.8867 - val_loss: 0.6378 - val_acc: 0.8050

Epoch 00009: val_loss did not improve

```