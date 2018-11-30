# Pyenv 简述

## 感觉
> 可以这么理解 pyenv

- 这是一个专门通过 env 参数的自动调节来指向不同 py 版本运行环境的巧妙工具
- 自动化安装多个版本的 py 到用户指定目录中
- 一般是 ~/.pyenv 中
- 配合 pyenv-virtualenvwrapper 插件,就可以高速合理的建立/删除 工程运行环境
    + pyenv install --list 可以观察到可以安装的 版本支持
    + pyenv install 3.6.3 安装好 Py3.6.3
    + pyenv virtualenv 3.6.3 AI363 将标准环境复制虚拟一个专用环境
- 进入我们的工程目录
    + pyenv local AI363 
    + 即完成绑定运行环境

本质上:

    通过 .python-version 环境声明文件
    来自动感知并切换版本环境

即, pyenv 只作了两件事儿:

- 管理多个本地用户级 py 版本环境
- 通过 .python-version 自动切换当前运行版本环境

这样就作到了版本环境和工程分离

## 参考:

- [pyenv/pyenv: Simple Python version management](https://github.com/pyenv/pyenv)
- [yyuu/pyenv-virtualenvwrapper](file:///Users/zoomq/mnt/KuaiPan/zScrapBook/zqSCM/data/20150715101434/index.html)
