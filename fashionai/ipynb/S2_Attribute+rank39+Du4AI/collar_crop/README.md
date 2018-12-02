# 基于人脸区域 裁剪 neck 图片

## 文件目录
- data
    + ssd ssd模型和权重文件，用来人脸区域检测
- ultis
    + face_detector.py  ssd进行人脸检测的脚本
- image 
    + test 测试图片的文件夹
    + crop 裁剪后保存图片的文件夹

## 测试效果
- 人脸都能比较好的检测出来

## 使用
- 直接使用 Hansoluo0521_neck_image_face_crop.ipynb 文件运行
- crop函数为定义裁剪的函数，目前是将人脸区域的中心点下移 h/2 高度，再扩展宽度为 3w，可能不够用，可以适当进行调整
- 最后一段代码为主程序，可以手动修改图片路径

## changelog
- 醉舟 20180521 init
