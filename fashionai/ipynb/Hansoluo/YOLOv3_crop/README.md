# 利用YOLOv3检测人物，裁剪图片

## 如何使用
- 下载[yolo.h5](https://pan.baidu.com/s/1eZEa-ZkKYkoeuesYhKIQGg)文件到data目录
- 直接使用 Hansoluo0521_yolo3_crop.ipynb 文件运行
- 最后一段代码为主程序，可以手动修改图片路径

## 文件目录
- data
    + coco_classes.txt  coco数据集的类别
    + yolo.h5 预训练模型的权重数据
- model
    + darknet53.py  yolo使用的model
    + yolo_model.py yolo进行目标检测的脚本
- image 
    + test 测试图片文件夹
    + crop 裁剪后保存图片的文件夹

## 测试效果
- 8个类别衣服都选了一张典型图片进行测试
    - 发现有人的在图片里可以检测，然后做裁剪
    - 只有衣服没有人的无法做裁剪
- 目前为yolov3版的h5模型，精度比较高，但速度稍慢一点
- 有尝试过用yolov3_tiny版的h5模型，速度快，但是精度差，所以不用

## changelog
- 醉舟 20180521 init
