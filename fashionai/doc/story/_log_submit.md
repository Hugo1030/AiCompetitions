## ensemble
>>> 18.5.31
=> neckline_0531a_InceptionResNetV2.csv 全数据 round2 两轮 lr
=> neckline_0531a_Xception.csv 全数据 round2 两轮 lr
<= neckline_0531a.csv

=> collar_0531a_InceptionResNetV2.csv 全数据 round2 两轮 lr
=> collar_0531a_Xception.csv 全数据 round2 两轮 lr
<= collar_0531a.csv

=> skirt_0531a_InceptionResNetV2.csv 全数据 round2 两轮 lr
=> skirt_0531a_Xception.csv 全数据 round2 两轮 lr
<= skirt_0531a.csv

>>> 18.5.30
=> skirt_0527a_InceptionResNetV2.csv 全数据 round2
=> skirt_0530a_Xception.csv 全数据 round2 两轮 lr
<= skirt_0530a.csv

=> collar_0530a_InceptionResNetV2.csv 全数据 round2
=> collar_0527a_Xception 全数据 round2
<= collar_0530a.csv

>>> 18.5.29
=> skirt_0529b_InceptionResNetV2.csv 全数据 round2
=> skirt_0528a_Xception.csv 全数据 round2
<= skirt_0529c.csv

=> skirt_0529b_InceptionResNetV2.csv 全数据 round2
=> skirt_0529a_Xception.csv label smooth
<= skirt_0529b.csv

=> skirt_0529a_InceptionResNetV2.csv 切分数据 round2
=> skirt_0529a_Xception.csv label smooth
<= skirt_0529a.csv

=> sleeve_0529a_InceptionResNetV2.csv 切分数据 round2
=> sleeve_0528b_Xception.csv label smooth round2
<= sleeve_0529b.csv

=> sleeve_0527a_InceptionResNetV2.csv 
=> sleeve_0528b_Xception.csv
<= sleeve_0529a.csv


>>> 18.5.28
=> sleeve_0528a_InceptionResNetV2.csv
=> sleeve_0528b_Xception.csv
<= sleeve_0528b.csv

=> collar_0527a_InceptionResNetV2.csv
=> collar_0527a_Xception.csv =>  collar.best0527a_Xception.h5
<= collar_0527a.csv

=> neckline_0527a_InceptionResNetV2.csv
=> neckline_0527a_Xception.csv
<= neckline_0527a.csv

=> skirt_0527a_InceptionResNetV2.csv
=> skirt_0528a_Xception.csv
<= skirt_0528a.csv

=> sleeve_0527a_InceptionResNetV2.csv
=> sleeve_0528a_Xception.csv
<= sleeve_0528a.csv

>>> 18.6.2
df_submit.to_csv('./result/submit_0602a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0602a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0602a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0602a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0602a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0601_xcept_incept_3.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0602_xcept_incept_3.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0602a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0602a.csv', header=None)
>>> 18.6.1
df_submit.to_csv('./result/submit_0601c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0601b.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0601b.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0601b.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0601b.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0601_xcept_incept_3.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0601_xcept_incept_2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0601a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0601a.csv', header=None)


df_submit.to_csv('./result/submit_0601a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0601a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0601a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0601a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0601a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0601_xcept_incept_1.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0601_xcept_incept_1.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0601a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0601a.csv', header=None)

>>> 18.5.31
df_submit.to_csv('./result/submit_0531b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0531a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0531_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

df_submit.to_csv('./result/submit_0531a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0531a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0530_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

>>> 18.5.30
df_submit.to_csv('./result/submit_0530c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0530a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0530_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

df_submit.to_csv('./result/submit_0530b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0528a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0530_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

df_submit.to_csv('./result/submit_0530a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0530a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0529c.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

>>> 18.5.29
df_submit.to_csv('./result/submit_0529c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0529b.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)


df_submit.to_csv('./result/submit_0529b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0529a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529b.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)


df_submit.to_csv('./result/submit_0529a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0528a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0529a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

>>> 18.5.28
```
df_submit.to_csv('./result/submit_0528c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0528a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0528b.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

df_submit.to_csv('./result/submit_0528b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0528a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0528a.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)

df_submit.to_csv('./result/submit_0528a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0528a.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0528a.csv', header=None)
```

>>> 18.5.27
```
df_submit.to_csv('./result/submit_0527c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0527a.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0527a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0527_Xception_round2.csv', header=None)


df_submit.to_csv('./result/submit_0527b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0526a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0526a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0527_xcept_incept.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0527_xcept_incept.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0527_Xception_round2.csv', header=None)

df_submit.to_csv('./result/submit_0527a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0526a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0526a_InceptionResNetV2.csv', header=None) val_loss: 0.6738 - val_acc: 0.7944
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0525_Inception_065.csv', header=None) val_loss: 1.4333 - val_acc: 0.6632 ，tta 也是0.66+
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0527_Xception_round2.csv', header=None) 0.795提升到了0.805,tta从0.90提升到了0.95
```

>>> 18.5.26
```
df_submit.to_csv('./result/submit_0526c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0526a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0526a_InceptionResNetV2.csv', header=None) val_loss: 0.6738 - val_acc: 0.7944
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0525_Inception_065.csv', header=None) val_loss: 1.4333 - val_acc: 0.6632 ，tta 也是0.66+
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None)


df_submit.to_csv('./result/submit_0526b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0526a_InceptionResNetV2.csv', header=None) val_loss: 0.6738 - val_acc: 0.7944
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0525_Inception_066.csv', header=None) val_loss: 1.4333 - val_acc: 0.6632 ，tta 也是0.66+
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None)


df_submit.to_csv('./result/submit_0526a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0525_Inception_066.csv', header=None) val_loss: 1.4333 - val_acc: 0.6632 ，tta 也是0.66+
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None)
```

>>> 18.5.25
```
df_submit.to_csv('./result/submit_0525c.csv', header=None, index=False) 0.9229 / 0.7975

df_collar = pd.read_csv('../../raw/result/collar_0525a_Xception.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0525a.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0525a.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0525a_Xception.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0525_Inception_065.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None)


df_submit.to_csv('./result/submit_0525b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.7463 - val_acc: 0.7309 tta: 0.7460
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.8197 - val_acc: 0.6780 - tta: 0.6871
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)  val_acc: 0.85+  val_loss: 0.4663
df_coat = pd.read_csv('../../raw/result/coat_0525_Inception_065.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+


df_submit.to_csv('./result/submit_0525a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.7463 - val_acc: 0.7309 tta: 0.7460
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.8197 - val_acc: 0.6780 - tta: 0.6871
df_neck = pd.read_csv('../../raw/result/neck_0524_85_resnet_clip_w_h.csv', header=None)  val_acc: 0.85+  val_loss: 0.4663
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+
```

>>> 18.5.24
```
df_submit.to_csv('./result/submit_0524c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.6747 - val_acc: 0.8017 tta: 0.9145
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.7463 - val_acc: 0.7309 tta: 0.7460
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.8197 - val_acc: 0.6780 - tta: 0.6871
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+

df_submit.to_csv('./result/submit_0524b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.7463 - val_acc: 0.7309 tta: 0.7460
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.8197 - val_acc: 0.6780 - tta: 0.6871
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+


df_submit.to_csv('./result/submit_0524a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0524a_InceptionResNetV2.csv', header=None) val_loss: 0.8197 - val_acc: 0.6780 - tta: 0.6871
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+
```

>>> 18.5.23
```
df_submit.to_csv('./result/submit_0523c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0523c_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+

df_submit.to_csv('./result/submit_0523b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0523b_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+


df_submit.to_csv('./result/submit_0523a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0523a_InceptionResNetV2.csv', header=None) val_loss: 0.3993 - val_acc: 0.8797 tta: 0.9801
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+
```

>>> 18.5.22
```
df_submit.to_csv('./result/submit_0522c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.4660 - val_acc: 0.8510
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h: val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0522_91_resnet_multi_label.csv', header=None) h: val_acc=0.91
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) 0.93+



df_submit.to_csv('./result/submit_0522b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0522b_InceptionResNetV2.csv', header=None) val_loss: 0.4485 - val_acc: 0.8698 tta: 0.8830
df_neckline = pd.read_csv('../../raw/result/neckline_0522a_InceptionResNetV2.csv', header=None) val_loss: 0.6754 - val_acc: 0.8007 tta: 0.8186
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None) h:val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None) val_loss: 1.4149 - val_acc: 0.6445
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95+
df_pant = pd.read_csv('../../raw/result/pant_0519a_InceptionResNetV2.csv', header=None) val_acc: val_loss: 0.7355 - val_acc: 0.7823

df_submit.to_csv('./result/submit_0522a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0522b_InceptionResNetV2.csv', header=None) val_loss: 0.4485 - val_acc: 0.8698 tta: 0.8830
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h:val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None) val_loss: 1.4149 - val_acc: 0.6445
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95+
df_pant = pd.read_csv('../../raw/result/pant_0522_InceptionResNetV2_round2.csv', header=None) val_acc: 0.93+
```

>>> 18.5.21
```
df_submit.to_csv('./result/submit_0521c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.4660 - val_acc: 0.8510
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h:val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None) val_loss: 1.4149 - val_acc: 0.6445
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95+
df_pant = pd.read_csv('../../raw/result/pant_0521_InceptionResNetV2_round2.csv', header=None) val_acc: 0.91+

df_submit.to_csv('./result/submit_0521b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None) val_loss: 0.4660 - val_acc: 0.8510
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.6408 - val_acc: 0.7900
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None) val_loss: 0.7220 - val_acc: 0.7357
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None) val_loss: 0.9060 - val_acc: 0.6667 - tta: 0.6818 
df_neck = pd.read_csv('../../raw/result/neck_0521_84_resnet_clip_w_h.csv', header=None)  h:val_loss: 0.4593 - val_acc: 0.8431
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None) val_loss: 1.4149 - val_acc: 0.6445
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None) val_acc: 0.95
df_pant = pd.read_csv('../../raw/result/pant_0519a_InceptionResNetV2.csv', header=None) val_loss: 0.7355 - val_acc: 0.7823

df_submit.to_csv('./result/submit_0521a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0521a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0519a_InceptionResNetV2.csv', header=None)
```

>>> 18.5.20
```
df_submit.to_csv('./result/submit_0520a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0519a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0519a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/lapel_0520_InceptionResNetV2_round2.csv', header=None)
```

>>> 18.5.19

```
df_submit.to_csv('./result/submit_0519b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0519a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0519a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0519a_InceptionResNetV2.csv', header=None)

df_submit.to_csv('./result/submit_0519a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0519a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0519a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0519a_InceptionResNetV2.csv', header=None)

```
>>> 18.5.18
```
df_submit.to_csv('./result/submit_0518c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518b_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518b_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0518b_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515a_InceptionResNetV2.csv', header=None)

df_submit.to_csv('./result/submit_0518b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0518b_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0518a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515a_InceptionResNetV2.csv', header=None)

df_submit.to_csv('./result/submit_0518a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0516a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0516a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0518a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0518a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515a_InceptionResNetV2.csv', header=None)
```

>>> 18.5.17
```
df_submit.to_csv('./result/submit_0517a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0517a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0516a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0516a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515a_InceptionResNetV2.csv', header=None)
```


>>> 18.5.16
```
df_submit.to_csv('./result/submit_0516c.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0516a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0516a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0516a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515a_InceptionResNetV2.csv', header=None)

df_submit.to_csv('./result/submit_0516b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0516a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0511a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0511a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0516_82_resnet_clip.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515_08672_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515_InceptionResNetV2_add_filp.csv', header=None)

df_submit.to_csv('./result/submit_0516a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0516a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0511a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0511a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0516a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515_81_Xception.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515_08672_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515_InceptionResNetV2_add_filp.csv', header=None)
```

>>> 18.5.15
```
submits: df_submit.to_csv('./result/submit_0515b.csv', header=None, index=False)

df_collar.columns = ['image_id', 'class', 'result']
df_neckline.columns = ['image_id', 'class', 'result']
df_skirt.columns = ['image_id', 'class', 'result']
df_sleeve.columns = ['image_id', 'class', 'result']
df_neck.columns = ['image_id', 'class', 'result']
df_coat.columns = ['image_id', 'class', 'result']
df_lapel.columns = ['image_id', 'class', 'result']
df_pant.columns = ['image_id', 'class', 'result']

submits: df_submit.to_csv('./result/submit_0515a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0511a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0511a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0511a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0511a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0515a_InceptionResNetV2.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0515a_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0515a_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0515a_InceptionResNetV2.csv', header=None)
```

>>> 18.5.14
```
submits: df_submit.to_csv('./result/submit_0514b.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0511a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0511a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0511a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0511a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0509_81_Xception.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0514_08672_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0503_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0503_InceptionResNetV2.csv', header=None)
------------------------------------
submits: df_submit.to_csv('./result/submit_0514a.csv', header=None, index=False)

df_collar = pd.read_csv('../../raw/result/collar_0511a_InceptionResNetV2.csv', header=None)
df_neckline = pd.read_csv('../../raw/result/neckline_0511a_InceptionResNetV2.csv', header=None)
df_skirt = pd.read_csv('../../raw/result/skirt_0511a_InceptionResNetV2.csv', header=None)
df_sleeve = pd.read_csv('../../raw/result/sleeve_0511a_InceptionResNetV2.csv', header=None)
df_neck = pd.read_csv('../../raw/result/neck_0509_81_Xception.csv', header=None)
df_coat = pd.read_csv('../../raw/result/coat_0513_InceptionResNetV2.csv', header=None)
df_lapel = pd.read_csv('../../raw/result/lapel_0503_InceptionResNetV2.csv', header=None)
df_pant = pd.read_csv('../../raw/result/pant_0514_InceptionResNetV2_round2.csv', header=None)
```