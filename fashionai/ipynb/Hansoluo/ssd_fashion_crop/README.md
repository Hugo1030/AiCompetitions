# 基于SSD的服饰检测并裁剪

## 文件目录
- models
    + 存放ssd模型文件，用来检测
- img
    + test 测试图片的文件夹
    + crop 裁剪后保存图片的文件夹

## 测试效果
- 速度：1~2s处理一张图片

## 使用
- SSD h5模型下载，两个模型检测效果差不多，模型1使用3000图片训练,模型2使用6000图片训练，推荐使用模型2
    + 模型1链接：https://pan.baidu.com/s/1VFZm-kcfCPX7b73j7p8AtA
    + 模型2链接：https://pan.baidu.com/s/1811BIGeAhIxNDM2ccL9TxQ
- 使用 Hansoluo0530_SSD_fashion_crop.ipynb 进行裁剪
- 可以使用 三种剪裁方式： upper上半身/lower下半身/full全身

## changelog
- 醉舟 20180530 init
- 醉舟 20180531 增加模型2