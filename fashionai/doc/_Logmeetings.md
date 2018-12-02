>>> 18.5.24

链接:https://pan.baidu.com/s/1KId3gm05zaqeBJWkl96lyQ  密码:u21b

## Done:
- 第 2 个 epoch, lr = 0.0001 和 0.00005 有没有区别? 无 
- 边缘填充有没有效果? 有
- finetune有没有效果? 没有
- 全数据有没有效果? 有或不明显
- skirt/sleeve 裁剪有没有效果? 反效果
- collar/neckline 裁剪有没有效果? 线下正面, 线上负面
- 4 种预处理是否比 3 种要好? 是的  
- early stop 有没有效果? 待测试
- 两轮有没有效果? 线上测试有
- keras 还是 Opencv? opencv
- tta 有没有效果? 有
- 伪标签有没有效果? 略微负面效果
- 改变 batch_size 有什么影响? 16 略好于 32
- l2 正则? 有效果
- label smoothing? 效果待测试

## Todo:
- 模型融合
- 多尺度训练
- label smoothing
- 多标签, 引入新的维度测试
- 把原图放入 crop 进行训练
- 5 crop 测试

## Todo

>>> 18.5.17
链接:https://pan.baidu.com/s/1FvnZXqH0ffkLL9jrZzSCVw  密码:ccck

## Done:
- opencv 图片预处理: 直方图/边缘锐化
- TTA
- 训练分两阶段
- 两阶段 finetune

## Todo:
- 醉舟:
    - yolo/ssd 图片  heatmap
    - finetune 代码及论文上传
    - 迅速存储/读取代码
    - label smoothing
    - 生成伪标签: 切出部分测试集, 放入训练集再次训练

>>> 18.5.2

链接:https://pan.baidu.com/s/1Nom2XKk3MnGWid5M_eC9QQ  密码:z6mi

## Done:
- 沥川:
    - 数据预处理保存为图片, 打印出来看
    - 训练 baseline 模型
- 阿虎:
    - 使用 GoogleCloud 配置 GPU 环境
    - 用 batch 进行迭代的思想, 避免 memory error 的问题
- 蔡俊:
    - 对图片进行分类存储, 并从硬盘直接读取, 避免内存溢出的问题
- 醉舟:
    - pytorch , 使用 densenet, 针对错误分类进一步增强处理, 两个阶段训练模型
- 田兴业:
    - ZOOpt, 做模型融合, 优化目标不可导

## Todo:
    - 明天先提交一版 baseline


>>> 18.4.22

链接:https://pan.baidu.com/s/11QuD_iIopsRHqv0g4kex0A  密码:8few

>>> 18.4.19

链接:https://pan.baidu.com/s/1Cb1qWtvl28LUFsR3Ex_fqw  密码:oy53

## Done:
- 沥川:
    - 下一步属性标签竞赛任务介绍
    - 时间要求说明
- 醉舟:
    - 数据增强, 裁剪探索, 减少噪音, 将关键区域裁剪出来

- 阿虎:
    - 图片的背景和前景分离, 然后在衣服上进行标注
    - 优化器的使用，先用Adam训，再用SGD训练
- 蔡俊:
    - 针对错误预测情况, 做特定的数据增强

## Todo:
    - 沥川将下一阶段任务发布成 issue , 大家认领感兴趣方向进一步探索
    - 沥川将属性标签, 阿虎将关键点的代码整理成脚本, 为 21 号提交代码做准备


>>> 18.4.8

Done:
- 关键点 baseline 的 CodeReview
- 关键点下一步技术路线探索

Todo:
- @Caijun 修改服饰标签 loss 函数, 测试效果
- @OMlalala 使用 fast.ai 猫狗的 fine-tune 手法, 训练测试服饰标签竞赛项目
- 进一步探索关键点比赛的优秀技术路线, 提高成绩


>>> 18.3.29

- 链接:https://pan.baidu.com/s/16I5UlIT-Db-PwmsI71mxgQ  
- 密码:2z16

Done:

- Code Review
- TTA
- 模型融合

Todo:

- 想办法提高单模成绩
- 测试其他模型进行融合


>>> 18.3.22

- 链接:https://pan.baidu.com/s/1l5EBQ-VoqvPeScRgGr4c6w  
- 密码:jx8f

Done:

- Code Review
- Baseline 和 数据增强
- PaperSpace 讲解

Todo:

- 完成数据增强版本线上测试
- 研究模型融合
- 针对误差进行研究

>>> 18.3.18

- 链接:https://pan.baidu.com/s/1T41sjrQuxWPnzovnlQjI3g  
- 密码:172o

Done:

- bitb 5 人上限需扩容
- 介绍算力租用及购买情况
- 确定参赛项目, 服饰属性标签识别
- 介绍参赛细则和比赛内容

TODO:

- Bitb 仓库权限升级
- 熟悉 FashionAI全球挑战赛——服饰属性标签识别并完成 baseline 构建
- Baseline 本地算力需求测试
- Paperspace , Crestle 租用服务器测试
- 探索更多其他平台性价比情况