
## 重复图片查询结果
- ### [查询代码](https://bitbucket.org/du4ai/fashionai/src/59944941f206dd9ad17eab881a8cf5296a55d0d5/ipynb/Woody/woody_0401_duplicate_picture_check.ipynb?at=master&fileviewer=notebook-viewer%3Anbviewer)  

查出的索引是相对索引，也就是每个类型重新建立索引顺利之后的索引。

每个类型新建立的索引为如下代码：

```python
df_train = pd.read_csv('label.csv', header=None)
df_train.columns = ['image_id', 'class', 'label']

classes = ['collar_design_labels', 'neckline_design_labels', 'skirt_length_labels',
           'sleeve_length_labels', 'neck_design_labels', 'coat_length_labels', 'lapel_design_labels',
           'pant_length_labels']
 #表示collar_design_labels类型的建立新索引
 cur_class = classes[0]
 df_load = df_train[(df_train['class'] == cur_class)].copy()
 df_load.reset_index(inplace=True)
 del df_load['index']
 ```

 说明
 0:'collar_design_labels'  
 1: 'neckline_design_labels',   
 2:'skirt_length_labels',   
 3:'sleeve_length_labels',   
 4:'neck_design_labels',   
 5:'coat_length_labels',   
 6:'lapel_design_labels',   
 7:'pant_length_labels'

 - 重复图片如下
 > {0: [(57, 387), (387, 57), (843, 5304), (1479, 5828), (1789, 2389), (1949, 4748), (2254, 7063), (2389, 1789), (2429, 8350), (4206, 6521), (4728, 6774), (4748, 1949), (5009, 7114), (5304, 843), (5464, 7932), (5828, 1479), (6521, 4206), (6774, 4728), (7063, 2254), (7114, 5009), (7290, 7879), (7290, 8238), (7879, 7290), (7879, 8238), (7932, 5464), (8238, 7290), (8238, 7879), (8350, 2429)],

 >1: [(63, 11022), (669, 16699), (1002, 2571), (1184, 10020), (1764, 3524), (2571, 1002), (3524, 1764), (4692, 6906), (4824, 13840), (5772, 14244), (6236, 7331), (6906, 4692), (7331, 6236), (9534, 9544), (9544, 9534), (9940, 10175), (10020, 1184), (10175, 9940), (11022, 63), (11547, 14208), (11602, 14707), (13840, 4824), (14208, 11547), (14244, 5772), (14707, 11602), (16699, 669)],

 >2: [(265, 8275), (559, 2615), (997, 2088), (1072, 7561), (1601, 3309), (1652, 7548), (2088, 997), (2615, 559), (3309, 1601), (3942, 6657), (4553, 5810), (5131, 8473), (5810, 4553), (6136, 6857), (6367, 8225), (6657, 3942), (6857, 6136), (7548, 1652), (7561, 1072), (8225, 6367), (8275, 265), (8473, 5131)],

 >3: [(224, 9886), (1264, 11491), (1400, 4679), (1400, 12451), (3457, 10493), (4679, 1400), (4679, 12451), (4737, 5048), (5048, 4737), (5421, 11779), (6416, 7765), (7731, 8816), (7765, 6416), (8816, 7731), (9886, 224), (10493, 3457), (10869, 13291), (11491, 1264), (11779, 5421), (12451, 1400), (12451, 4679), (13291, 10869)],

 >4: [(190, 1482), (224, 4674), (233, 4618), (591, 2996), (762, 5284), (845, 2892), (979, 5368), (997, 3146), (1144, 3486), (1155, 1343), (1155, 2172), (1155, 3164), (1155, 4198), (1155, 5108), (1158, 4996), (1343, 1155), (1343, 2172), (1343, 3164), (1343, 4198), (1343, 5108), (1391, 2676), (1482, 190), (1516, 4877), (1756, 4955), (2172, 1155), (2172, 1343), (2172, 3164), (2172, 4198), (2172, 5108), (2368, 3356), (2676, 1391), (2814, 3938), (2892, 845), (2996, 591), (3146, 997), (3164, 1155), (3164, 1343), (3164, 2172), (3164, 4198), (3164, 5108), (3184, 4361), (3246, 5619), (3356, 2368), (3486, 1144), (3938, 2814), (4026, 4027), (4027, 4026), (4166, 4488), (4198, 1155), (4198, 1343), (4198, 2172), (4198, 3164), (4198, 5108), (4361, 3184), (4488, 4166), (4618, 233), (4674, 224), (4698, 5184), (4698, 5497), (4877, 1516), (4955, 1756), (4996, 1158), (5108, 1155), (5108, 1343), (5108, 2172), (5108, 3164), (5108, 4198), (5184, 4698), (5184, 5497), (5284, 762), (5368, 979), (5497, 4698), (5497, 5184), (5619, 3246)],

 >5: [(144, 7843), (411, 1282), (653, 10210), (764, 5613), (987, 1311), (1026, 9965), (1047, 6100), (1049, 5151), (1282, 411), (1311, 987), (1602, 8237), (1850, 6887), (2179, 2335), (2260, 8277), (2335, 2179), (2419, 11273), (2914, 8241), (3155, 6938), (3434, 8636), (3820, 11188), (4424, 10003), (5151, 1049), (5549, 7954), (5606, 10604), (5613, 764), (5763, 7767), (5801, 10274), (6100, 1047), (6794, 10676), (6887, 1850), (6938, 3155), (6986, 8271), (7647, 8445), (7767, 5763), (7843, 144), (7954, 5549), (8237, 1602), (8241, 2914), (8271, 6986), (8277, 2260), (8445, 7647), (8636, 3434), (8785, 9063), (9063, 8785), (9965, 1026), (10003, 4424), (10210, 653), (10274, 5801), (10604, 5606), (10640, 10850), (10676, 6794), (10850, 10640), (11188, 3820), (11273, 2419)],

 >6: [(310, 5858), (490, 534), (534, 490), (730, 4532), (1452, 2024), (2024, 1452), (2038, 5980), (2128, 5087), (2275, 4082), (2275, 5890), (3304, 3645), (3317, 5077), (3499, 5221), (3645, 3304), (4082, 2275), (4082, 5890), (4135, 6439), (4189, 6556), (4532, 730), (4994, 6086), (4994, 6969), (5077, 3317), (5087, 2128), (5221, 3499), (5347, 5528), (5528, 5347), (5858, 310), (5890, 2275), (5890, 4082), (5980, 2038), (6086, 4994), (6086, 6969), (6439, 4135), (6556, 4189), (6969, 4994), (6969, 6086)],

 >7: [(766, 1068), (1068, 766), (1416, 1723), (1723, 1416), (2458, 6456), (2631, 6199), (4626, 4725), (4725, 4626), (5168, 6650), (5486, 6635), (6199, 2631), (6456, 2458), (6635, 5486), (6650, 5168)]}


重复图片但是label不同的id名单如下：

neckline_design_label
```

 [['Images/neckline_design_labels/13ea4faeba2847502b4b144e6411935d.jpg','neckline_design_labels', 'nynnnnnnnn']]
 [['Images/neckline_design_labels/c2c06de736b0b62726b8efa57ce7326a.jpg','neckline_design_labels', 'nnnnnnnnyn']]

```
neck_design_labels

```
 [['Images/neck_design_labels/9c792087cbbcaab304284b0b20cce6c9.jpg'
  'neck_design_labels' 'nnynn']]
[['Images/neck_design_labels/211177bcccf3bad5af28931612f88322.jpg'
  'neck_design_labels' 'nnnyn']]
[['Images/neck_design_labels/29146871d56e5fc84c270505a51ba724.jpg'
  'neck_design_labels' 'nynnn']]
[['Images/neck_design_labels/b65f2c20c8e5c670173dc2c79dfd08a5.jpg'
  'neck_design_labels' 'nnmyn']]

```  

coat_length_labels

```
[['Images/coat_length_labels/c34f1769092e7727e96cd3eb85ee5d10.jpg'
  'coat_length_labels' 'nnnnnnyn']]
[['Images/coat_length_labels/2866d9f9d2a5cd4402772a9069e9fc81.jpg'
  'coat_length_labels' 'nnnnnymn']]

```
pant_length_labels
```
[['Images/pant_length_labels/71ec4bc5acf96822b15890479923c61a.jpg'
  'pant_length_labels' 'nnynnn']]
[['Images/pant_length_labels/5e8cd4eaf5013ade3e086aa174e71b29.jpg'
  'pant_length_labels' 'nnmynn']]
```