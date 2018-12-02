### 180408
- 参加周会 
- Todo: 使用 fast.ai 猫狗的 fine-tune 手法, 训练测试服饰标签竞赛项目

### 180409
期望: 将图片集, 构造成 猫狗识别 的文件架构
- 读取 fashionAI warm_up 数据
- 数据预处理
- 图片更名, 遇到更名问题. 停止.

### 180410
现状: skirt_length_labels 的属性值有 11 类
> 探索
- 是否训练集和测试集, 每个文件夹里面各有 11 个文件夹?
- 换一组图片集测试代码. 从 google images 下载 2 类图片各 20 张
- 代码跑完, 证实: 确实需要图片更名
- 遇到新问题: 部分代码报错或无图像

资料:
[hardikvasa/google-images-download](https://github.com/hardikvasa/google-images-download)

