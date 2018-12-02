# 基于SSD的人体检测并裁剪 caffe版本

提醒：谨慎使用，GPU模式没有经过测试，因为crestle上没有安装caffe

## 使用
- SSD h5模型下载 链接：https://pan.baidu.com/s/1c7cxIBlANZlnBedq3seh2g 密码：5h13
- 使用 Hansoluo0523_SSD_caffe_crop.ipynb 进行裁剪
- 可以选择 CPU 或者 GPU 模式运行

## 本地安装caffe与python的接口
- [Windows 安装](https://www.zhihu.com/question/34119328)
- [OS X 安装](http://caffe.berkeleyvision.org/install_osx.html) 
- 参考 [官方文档](http://caffe.berkeleyvision.org/tutorial/interfaces.html)
- Compile pycaffe by `make pycaffe`. Add the module directory to your $PYTHONPATH by `export PYTHONPATH=/path/to/caffe/python:$PYTHONPATH` or the like for import caffe.

## changelog
- 醉舟 20180523 init
