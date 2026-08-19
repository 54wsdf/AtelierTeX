# `profiles/` 版式配置说明

`profiles/` 保存 AtelierTeX 自带的五种基础版式。Profile 负责阅读密度、留白、标题层级和图文节奏；正文语义保持一致。题名页由独立的 `titlelayout=...` 选择，因此正文 Profile 与首页排版可以组合使用。

作者通过：

```latex
\documentclass[profile=editorial]{atelier}
```

选择版式。

## Profile 一览

### `academic.sty`

适合传统论文、技术报告与方法论文。

特点：

- 较高信息密度；
- 规整章节层级；
- 克制留白；
- 传统学术图表关系。

### `editorial.sty`

适合人文、艺术、设计类期刊式长文，也是多数 ACGN 长篇研究的稳健起点。

特点：

- 清晰编辑节奏；
- 舒展段落与章节留白；
- 正文、引文、图像、叙事片段形成阅读波形；
- 完整学术结构。

### `narrative.sty`

适合人物研究、游戏研究、文学评论、文化研究和场景化叙述。

特点：

- 突出幕间、对话、题辞；
- 适合长段连续阅读；
- 学术章节与小说式结构并行。

### `visual.sty`

适合动画截图、游戏画面、卡面、漫画分镜、版式分析与信息图比例较高的论文。

特点：

- 图像获得更高页面权重；
- 图文关系更灵活；
- 适合视觉论文和图像证据研究。

### `essay.sty`

适合文化随笔、公开长文、观察札记与学术框架内的叙事型文章。

```latex
\documentclass[profile=essay,titlelayout=essay]{atelier}
\AtelierDeck{一句承担阅读入口、而非摘要功能的导语。}
```

`essay` 保留传统长文的首行缩进、章节、图表与参考文献基础设施。`titlelayout=essay` 在公共刊头和元数据基础上增加 deck 与可选头图；正文照片可用 `\AtelierPhoto`，需要编号和正文引用的证据图继续使用 `\AtelierFigure`。

## Publication Profile

基础 Profile 提供通用视觉倾向。具体期刊、会议、同人志或书籍可以在独立 publication profile 中加入：

- 专属标题页；
- Logo；
- 品牌颜色；
- 页眉页脚；
- media tag renderer；
- 投稿元数据。

独立 publication profile 可以建立在任一基础 Profile 之上，再加入自己的标题页元数据、叙事视觉和参考文献标签外观。

## 开发原则

Profile 主要重设视觉参数：字号、段距、留白、标题、图表密度与叙事环境呈现。稳定语义继续由 `atelier/` 核心模块维护。

单篇稿件的局部设计可以留在 manuscript；跨项目、跨出版物复用的视觉逻辑适合进入独立 publication profile。

## 切换测试

一个结构良好的稿件在不同 Profile 间切换时应保持：

- 章节结构一致；
- 引用一致；
- 原文、译文、叙事语义完整；
- 图表完整；
- ACGN media semantics 完整；
- 视觉节奏随 Profile 改变。

这项测试可以直接检验正文语义与表现层的分离程度。
