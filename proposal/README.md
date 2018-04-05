# 文献综述开题报告外文翻译三合一模板

严格遵循 《附件2：浙江大学本科生毕业论文（设计）文献综述和开题报告（模板）》和《附件7：浙江大学本科生毕业论文（设计）编写规则》。已实现功能如下：

1. 实现自定义封面 `\makecover`
2. 每章独立参考文献
3. 每章等式独立编号
4. 页眉页脚完全遵循规则

## 使用说明

1. 将 `main.tex` 文件中
```tex
\documentclass[fangfont=STFANGSO.TTF,heifont=YaHeiConsolas.ttf]{zju-proposal}
```
的 `fangfont` 赋值为自己电脑上的仿宋字体名，`heifont` 赋值为自己电脑上的黑体字体名。
2. 完成自己的文献综述 `LiteratureReview.tex`，开题报告 `Proposal.tex`，以及外文翻译 `Translation.tex`
3. 对于习惯使用终端的 Linux 或 Mac 用户，直接运行 `make` 便可以编译，一切顺利的话，便可以生成 `main.pdf` 文件，运行 `make clean` 能够删除编译过程中产生的多余文件；对于使用 texstudio 等 IDE 的用户，选择 `xelatex` 编译就好了。
4. 根据需要自行合并外文原文和 `main.pdf`




