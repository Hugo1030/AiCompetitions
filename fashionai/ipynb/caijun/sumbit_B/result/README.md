## 初赛A
- pant_0325a.csv，切分数据集，InceptionResNetV2模型，acc 0.9123, val_acc 0.88
- lapel_0325a.csv,切分数据集，InceptionResNetV2模型，acc 0.9122, val_acc 0.8876
- pant_0328alldata.csv, 不切分数据集，InceptionResNetV2模型
- lapel_0328alldata.csv,不切分数据集，InceptionResNetV2模型

- pant_0329a.csv
=>pant_0328alldata.csv  
=>pant_0325a.csv  
<=pant_0329a.csv(pant_0328alldata.csv * 0.5+pant_0325a.csv * 0.5)  

- lapel_0329a.csv
=>lapel_0328alldata.csv  
=>lapel_0325a.csv  
<=lapel_0329a.csv(lapel_0328alldata.csv * 0.5+lapel_0325a.csv * 0.5)

- pant_0401a.csv，切分数据集，Xception模型，acc 0.95, val_acc 0.8873
- lapel_0401a.csv，切分数据集，Xception模型，acc 0.9667, val_acc 0.8923

=>pant_0401a.csv  
=>pant_0329a.csv  
<=pant_0329a.csv(pant_0329a.csv * 0.5+pant_0401a.csv * 0.5)  

=>lapel_0401a.csv  
=>lapel_0329a.csv  
<=lapel_0329a.csv(lapel_0329a.csv * 0.5+lapel_0401a.csv * 0.5)  

## 初赛B

=> pant_0418a.csv  xception切分训练集
=> pant_0418alldata.csv InceptionResNetV2全训练集
<= pant_0418b.csv (pant_0418a.csv * 0.5+pant_0418alldata.csv * 0.5)

=> lapel_0418a.csv  xception切分训练集
=> lapel_0418alldata.csv InceptionResNetV2全训练集
<= lapel_0418b.csv (lapel_0418a.csv * 0.5+lapel_0418alldata.csv * 0.5)

=> pant_0419_InceptionResNetV2.csv  InceptionResNetV2切分训练集
=> pant_0419Xception_alldata.csv Xception全训练集
<= pant_0419a.csv (pant_0419_InceptionResNetV2.csv * 0.5+pant_0419Xception_alldata.csv * 0.5)

=> lapel_0419_InceptionResNetV2.csv  InceptionResNetV2切分训练集
=> lapel_0419Xception_alldata.csv Xception全训练集
<= lapel_0419a.csv (lapel_0419_InceptionResNetV2.csv * 0.5+lapel_0419Xception_alldata.csv * 0.5)

=> pant_0419a.csv 
=> pant_0418b.csv 
<= pant_0420a.csv (pant_0419a.csv * 0.5+pant_0418b.csv * 0.5)

=> lapel_0419a.csv 
=> lapel_0418b.csv 
<= lapel_0420a.csv (lapel_0419a.csv * 0.5+lapel_0418b.csv * 0.5)

=> pant_0421a.csv  InceptionV3切分训练集
=> pant_0421alldata.csv InceptionV3全训练集
<= pant_0421b.csv (pant_0421a.csv * 0.5+pant_0421alldata.csv * 0.5)

=> lapel_0421a.csv  InceptionV3切分训练集
=> lapel_0421alldata.csv InceptionV3全训练集
<= lapel_0421b.csv (lapel_0421a.csv * 0.5+lapel_0421alldata.csv * 0.5)

=> pant_0420a.csv 
=> pant_0421b.csv 
<= pant_0421c.csv (pant_0420a.csv * 0.5+pant_0421b.csv * 0.5)

=> lapel_0420a.csv 
=> lapel_0421b.csv 
<= lapel_0421c.csv (lapel_0420a.csv * 0.5+lapel_0421b.csv * 0.5)




