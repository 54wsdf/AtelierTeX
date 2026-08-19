# `examples/` 示例说明

`examples/` 提供从最小功能验证到完整公开样张的一组可编译示例。引用相关内容以 `gbt7714-acgn-profile/` 为 canonical bibliography，`full-specimen/` 复用同一套书目数据展示完整页面。

## 1. `full-specimen/` — 完整公开样张

这是当前最完整的 AtelierTeX 展示工程，覆盖：

- 通用 AtelierTeX Masthead 与标题页；
- GB/T 7714-2025 + ATX-ACGN-REF 0.4；
- 60 余种 Media / Carrier Tag；
- 42 条 canonical bibliography 记录；
- 正文 `\cite`、作品内部 Locator 与最终 bibliography；
- 游戏、剧情、动画、漫画、轻小说、音乐、Live、标准、报告、预印本、数据集、专利、数据库、软件与代码仓库等对象；
- PDF / DOCX / PPTX / XLSX / CSV / JSON / YAML / IPYNB / 图片 / 音频 / 视频 / 字幕 / Archive 等载体反查；
- Word / DOCM Companion 的字段语义接口。

- Feature 源文件：[`full-specimen/main.tex`](full-specimen/main.tex)
- Symposium 源文件：[`full-specimen-symposium/main.tex`](full-specimen-symposium/main.tex)
- 书目数据：[`gbt7714-acgn-profile/references.bib`](gbt7714-acgn-profile/references.bib)
- Essay 源文件：[`essay-longread-demo/main.tex`](essay-longread-demo/main.tex)

README 展示三种排版各自生成的第一页 PNG；当前状态见 [`../docs/assets/rendered/RENDERING_STATUS.md`](../docs/assets/rendered/RENDERING_STATUS.md)。

## 2. `gbt7714-acgn-profile/` — Canonical Citation Showcase

这是引用体系的标准入口，专门验证 `\AtelierUseACGNBibliography`、Biber、`gb7714-2025` 与 Media Tag renderer，并且同时给出：

- 可复制的真实来源 `.bib` 记录；
- 普通 `\cite`；
- `\cite[Locator]{key}` 作品内部定位；
- 多来源并引；
- 最终参考文献渲染。

42 条 canonical bibliography 记录集中维护在 `references.bib`；尚未进入该书目库的 Media Tag 仍可在格式目录中查看字段结构与输出形态。

## 3. `acgn-research-demo/` — ACGN 论文正文

展示跨媒介书目、多语种 primary text 和普通分析段落如何组合成一篇文章。

## 4. `multilingual-demo/` — 多语种与字形

覆盖简体中文、繁体中文、日文、英文、CJK / Latin 混排、字体回退与特殊字形。

## 5. `narrative-demo/` — 学术结构 + 叙事结构

展示 `AtelierInterlude`、`AtelierDialogue`、`AtelierEpigraph` 与 `section/subsection` 的组合。

## 6. `longform-demo/` — 长篇组织

展示章节拆分、页面连续性、正文密度、长表格和图表关系。

## 7. `visual-essay-demo/` — 视觉论文

展示图片、占位图和 visual profile，适合动画截图、卡面、漫画分镜、设定图和分析图比例较高的研究。

## 编译

完整样张：

```powershell
latexmk -xelatex -halt-on-error -interaction=nonstopmode examples/full-specimen/main.tex
```

书目 canonical sample：

```powershell
latexmk -xelatex -halt-on-error -interaction=nonstopmode examples/gbt7714-acgn-profile/main.tex
```

双引擎发布门：

```powershell
pwsh -File tests/compile-smoke.ps1 -Engine both
```

涉及页面设计时，在日志通过后继续检查生成 PDF；README 对外展示以实际 PDF 渲染图为主。
