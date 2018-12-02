# 基于SSD的人体检测并裁剪

## 文件目录
- data
    + ssd 存放ssd模型和权重文件，用来检测
- ultis
    + ssd_detector.py  ssd进行检测的脚本，被设定为只检测人体
- image 
    + test 测试图片的文件夹
    + crop 裁剪后保存图片的文件夹

## 测试效果
- 效果好的奇怪，连没有人只有衣服的都能检测为人体
- 速度也非常快，0.5s处理一张图片

## 使用
- SSD h5模型下载 链接：https://pan.baidu.com/s/1c7cxIBlANZlnBedq3seh2g 密码：5h13
- 使用 Hansoluo0522_SSD_crop.ipynb 进行裁剪

## changelog
- 醉舟 20180522 init
