# AtelierTeX 使用说明书

本文面向准备直接使用 AtelierTeX 写长篇文章的作者。手册以 ACGN / 二次元 / 跨媒介研究为主要示例，同时覆盖一般人文、设计与叙事研究。

## 1. 环境准备

推荐环境：

- TeX Live 2026 或兼容发行版；
- XeLaTeX 或 LuaLaTeX；
- `latexmk`；
- `biber`；
- 支持 `gb7714-2025` 的当前 `biblatex-gb7714-2015` 宏包。

字体由框架按语言角色和可用性自动解析。

## 2. 最小工程

```text
my-paper/
├── main.tex
├── references.bib
└── AtelierTeX/
```

```latex
\documentclass[profile=editorial]{atelier}
\AtelierUseACGNBibliography
\addbibresource{references.bib}

\title{文章标题}
\subtitle{副标题}
\author{作者}

\begin{document}
\maketitle

\section{问题的提出}
正文从这里开始\cite{example_game}。

\begin{AtelierOriginal}
日本語の一次資料。
\end{AtelierOriginal}

\begin{AtelierTranslation}
对应的中文译文。
\end{AtelierTranslation}

\printbibliography
\end{document}
```

兄弟仓开发时，把 TeX 搜索路径写入构建脚本，确保每次编译都解析到明确的 AtelierTeX 版本。

## 3. 选择 Profile

```latex
\documentclass[profile=academic]{atelier}
\documentclass[profile=editorial]{atelier}
\documentclass[profile=narrative]{atelier}
\documentclass[profile=visual]{atelier}
```

- `academic`：传统论文与规范型研究；
- `editorial`：人文/设计期刊式长文；
- `narrative`：人物研究、游戏研究、文学评论、场景化论述；
- `visual`：截图、卡面、漫画分镜、视觉证据比例较高的论文。

ACGN 描述研究对象与来源；Profile 描述视觉与阅读节奏。

## 4. 长文拆分

十几页以上的文章建议拆成独立章节文件：

```text
content/
├── 00-frontmatter.tex
├── 01-introduction.tex
├── 02-primary-text.tex
├── 03-analysis.tex
├── 04-cross-media.tex
└── 05-conclusion.tex
```

`main.tex` 维护章节顺序：

```latex
\input{content/00-frontmatter}
\input{content/01-introduction}
\input{content/02-primary-text}
\input{content/03-analysis}
\input{content/04-cross-media}
\input{content/05-conclusion}
```

## 5. 多语种正文

### 日文

```latex
\begin{AtelierLanguage}{ja}
ままならない日々は終わらない。
\end{AtelierLanguage}
```

### 英文

```latex
\begin{AtelierLanguage}{en}
Curiosity can be studied as a relation between knowledge and uncertainty.
\end{AtelierLanguage}
```

### 繁体中文

```latex
\begin{AtelierLanguage}{zh-Hant}
這裡是一段繁體中文。
\end{AtelierLanguage}
```

### 原文与译文

```latex
\begin{AtelierOriginal}
日本語の原文。
\end{AtelierOriginal}

\begin{AtelierTranslation}
对应的中文译文。
\end{AtelierTranslation}
```

语言环境负责字形与排印习惯；Original / Translation 负责研究文本角色。

## 6. 学术结构与叙事结构

学术论证使用标准章节：

```latex
\section{……}
\subsection{……}
```

叙事层使用专门语义：

```latex
\begin{AtelierInterlude}{某个没有答案的下午}
……
\end{AtelierInterlude}
```

```latex
\begin{AtelierDialogue}
\AtelierSpeaker{A}
第一句。
\AtelierSpeaker{B}
第二句。
\end{AtelierDialogue}
```

```latex
\begin{AtelierEpigraph}{来源}
一句短题辞。
\end{AtelierEpigraph}
```

章节负责论证骨架，叙事环境负责阅读节奏和场景组织。

## 7. 图像与视觉证据

素材准备阶段可以使用占位图：

```latex
\AtelierPlaceholderFigure{这里将放入剧情截图}{fig:scene}
```

正式图像可分为：

- primary visual evidence：游戏、动画、漫画、卡面、设定图；
- analytical figure：作者自绘机制图、关系图、时间图；
- editorial image：承担跨媒介语境和节奏功能的图像。

图注建议包含来源、locator、图像在论证中的作用与必要版权信息。

## 8. 表格

短表使用 `booktabs` 风格；长表使用跨页机制。ACGN 论文常见表格包括：

- episode → evidence → claim；
- 角色关键词阶段变化；
- 动画 / 漫画 / 游戏改编差异；
- 歌曲 / 封面 / 剧情 / Live 对照；
- 原文核验状态；
- 作品时间线。

## 9. ATX-ACGN-REF 引用体系

### 默认入口

```latex
\AtelierUseACGNBibliography
\addbibresource{references.bib}
```

AtelierTeX 0.3 默认采用 **GB/T 7714-2025 + ACGN Media Index**。

### Media Tag

```bibtex
verba = {GAME}
verba = {COMM · S1E08}
verba = {ANIME · EP03}
verba = {MANGA · V03C27}
verba = {MUSIC · TRACK01}
verba = {LIVE · ACT2}
```

标准 BibLaTeX entry type 保存正式来源身份，`verba` 保存媒体导航语义。

### Locator

- 游戏：route / STEP / episode；
- 动画与视频：episode + timestamp；
- 漫画：volume / chapter / page；
- 小说：volume / chapter / page；
- 音频：track + timestamp；
- Live：date / act / song / timestamp；
- 卡面：card name / release / asset identifier；
- 网页与社媒：URL + publish date + access date。

```latex
\cite[00:12:31--00:12:46]{anime_ep03}
\cite[45--52]{manga_ch27}
```

完整规范与渲染形式见 [`ATX-ACGN-REF.md`](ATX-ACGN-REF.md)。

独立参考文献演示见：

[`../examples/gbt7714-acgn-profile/`](../examples/gbt7714-acgn-profile/)

### GB/T 7714-2015 兼容入口

```latex
\AtelierUseACGNBibliography2015
```

适合已经锁定 2015 版样式的旧稿件。

### 其他书目风格

```latex
\AtelierUseBibliography[style=authoryear]
\AtelierEnableMediaIndex
```

适合作者—年份制或其他期刊样式的媒介研究。

## 10. 字体兼容

框架按 Latin、简中、繁中、日文和 Display 角色管理字体。特殊字形可登记：

```latex
\AtelierDeclareJPCharFallback{髙}{9AD9}
```

详细机制见 [`FONTS_AND_LANGUAGES.md`](FONTS_AND_LANGUAGES.md)。

## 11. 编译

```powershell
latexmk -xelatex -halt-on-error -interaction=nonstopmode main.tex
latexmk -lualatex -halt-on-error -interaction=nonstopmode main.tex
```

使用 bibliography 时 `latexmk` 会调度 biber。

## 12. 推荐学习顺序

1. `examples/gbt7714-acgn-profile`：先看 ACGN 参考文献最终渲染；
2. `examples/acgn-research-demo`：看引用如何进入完整论文；
3. `examples/multilingual-demo`：看中日英繁体与字形；
4. `examples/narrative-demo`：看学术结构与小说式结构；
5. `examples/longform-demo`：看长文组织；
6. `examples/visual-essay-demo`：看视觉证据。

开发、测试、发布门与内部实现集中在 [`development/README.md`](development/README.md)。