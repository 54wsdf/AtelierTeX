# AtelierTeX 项目定位

## 项目名称

**AtelierTeX**

## 项目性质

AtelierTeX 是一个面向 **ACGN / 二次元 / 跨媒介人文研究** 的开源 LaTeX 长篇论文基础框架，同时支持一般人文、艺术、设计、社会科学与叙事型研究写作。

项目由 **54wsdf** 发起并维护，公开仓库：

`https://github.com/54wsdf/AtelierTeX`

## 项目定位

AtelierTeX 提供一套可以长期承载 20–100 页以上研究写作的语义与出版底座，重点覆盖：

- 中文、日文、繁体中文、英文混排；
- 游戏剧情、动画集数、漫画章节、轻小说、视觉小说、歌曲、Live、卡面、PV、VTuber / Stream 与社交媒体等跨媒介来源；
- GB/T 7714-2025 与 ACGN 媒体引用的结合；
- 文件载体、数据对象、代码仓库和研究附件的统一引用；
- 学术章节与幕间、场景、对白、题辞等叙事结构；
- 视觉证据、截图、分析图、信息图和长表格；
- XeLaTeX / LuaLaTeX 与 CJK/Japanese 字形兼容；
- 通用 Masthead 与可替换 publication profile；
- 真实 PDF 渲染样张作为公开展示和版式回归依据。

## 四个主要组成

### 1. 长篇排版框架

`atelier.cls` 与 `atelier/*.sty` 提供字体、语言、叙事、图表、页面、Masthead 和书目等稳定语义。

### 2. ATX-ACGN-REF

**ATX-ACGN-REF 0.4** 是 AtelierTeX 维护的 ACGN / 跨媒介引用扩展规范。它以 GB/T 7714-2025 为正式著录底座，增加 Media Tag 与媒介专属 Locator，并覆盖 60 余种作品、媒体、网络、数据、软件和文件载体对象。

规范见 [`docs/ATX-ACGN-REF.md`](docs/ATX-ACGN-REF.md)。

### 3. Publication Profile

项目提供 `academic / editorial / narrative / visual / essay` 五种基础 Profile，并允许独立仓库开发具体期刊、会议、同人志和书籍视觉。`feature / symposium / essay` 三种标题页排版与正文 Profile 独立选择。

### 4. Word / DOCM Companion

ATX-ACGN-REF 计划提供 Word 前端，使不使用 LaTeX 的作者也能使用相同的 Media Tag、Locator、GB/T 7714-2025 字段与引用规则。设计见 [`docs/WORD_COMPANION.md`](docs/WORD_COMPANION.md)。

## 目标用户

- ACGN / anime / manga / game / light novel 研究者；
- 角色研究、粉丝文化与同人研究作者；
- 游戏研究、视觉文化、媒介研究与叙事研究作者；
- 需要中日英混排的中文论文作者；
- 需要大量图像证据、跨媒介书目和数字文件引用的长篇写作者；
- 希望建立可复用出版系统的独立研究者与研究社团。

## 公开输出

- LaTeX 文档类与稳定语义模块；
- ACGN 引用扩展规范；
- 60 余种 Media / Carrier Tag 目录；
- 可编译中性示例；
- 真实公开来源完整样张；
- PDF 与全页渲染图；
- 通用 Masthead；
- 多语种与字体兼容方案；
- 用户说明与 publication profile 接口。

## 实际渲染

完整公共样张标题页：

- [`docs/assets/rendered/ateliertex-feature-page1.png`](docs/assets/rendered/ateliertex-feature-page1.png)
- [`docs/assets/rendered/ateliertex-symposium-page1.png`](docs/assets/rendered/ateliertex-symposium-page1.png)
- [`docs/assets/rendered/ateliertex-essay-page1.png`](docs/assets/rendered/ateliertex-essay-page1.png)

源文件：[`examples/full-specimen/main.tex`](examples/full-specimen/main.tex)、[`examples/full-specimen-symposium/main.tex`](examples/full-specimen-symposium/main.tex) 与 [`examples/essay-longread-demo/main.tex`](examples/essay-longread-demo/main.tex)。

## 项目引用

GitHub 标准引用元数据见 [`CITATION.cff`](CITATION.cff)。

推荐项目引用：

> 54wsdf. *AtelierTeX: An ACGN-friendly Multilingual Long-form Editorial Framework*. 2026.

ATX-ACGN-REF 推荐引用：

> 54wsdf. *AtelierTeX ACGN Citation Profile (ATX-ACGN-REF 0.4)*. AtelierTeX Project, 2026.

## 许可证

本仓库自有源码、文档、示例、测试与项目生成的预览素材采用 **LPPL-1.3c**，维护状态为 `maintained`，当前维护者为 `54wsdf`。详见 [`LICENSE`](LICENSE)、[`LICENSE_SCOPE.md`](LICENSE_SCOPE.md) 与 [`manifest.txt`](manifest.txt)。
