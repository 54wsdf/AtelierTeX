# `full-specimen/` 完整渲染样张

这个目录保存 AtelierTeX `feature` 专题封面的完整公开样张源文件。`symposium` 研讨会刊页通过 [`../full-specimen-symposium/main.tex`](../full-specimen-symposium/main.tex) 复用相同正文与书目。它们用于展示和回归检查：

- 通用 Masthead；
- A4 长篇页面结构；
- 60 余种 ACGN / 数字文件 Media / Carrier Tag；
- 与 [`../gbt7714-acgn-profile/references.bib`](../gbt7714-acgn-profile/references.bib) 共用的 **42 条标准书目记录**；
- 正文 `\cite`、作品内部 Locator 与最终参考文献的完整链路；
- 长表与跨页表格；
- 多语种正文；
- 文件扩展名反查；
- Word / DOCM Companion 接口说明。

样张复用标准书目中的 42 条记录，并把 `.bib` 输入、正文 `\cite`、Locator、Media Tag 与最终 GB/T 输出放在同一条可编译链路中。未进入标准书目的类型继续由格式目录说明字段结构。

## 编译

从仓库根目录运行：

```powershell
pwsh -File tests/compile-full-specimen.ps1 -Engine xelatex
```

双引擎：

```powershell
pwsh -File tests/compile-full-specimen.ps1 -Engine both
```

生成位置：

```text
build/xelatex/full-specimen/main.pdf
build/xelatex/full-specimen-symposium/main.pdf
build/lualatex/full-specimen/main.pdf
build/lualatex/full-specimen-symposium/main.pdf
```

## 渲染流程

标题页预览采用以下流程：

```text
full-specimen/main.tex
        ↓
XeLaTeX / LuaLaTeX + Biber
        ↓
PDF 可打开性与页数检查
        ↓
PDFium / Poppler 逐页渲染
        ↓
人工检查标题页、长表、参考文献和多语种页面
        ↓
生成对应 README 预览图
```

README 中的标题页截图均由这个流程产生。

## 当前状态

2026-08-18 已完成标准书目与完整样张源的同步。当前样张可通过 XeLaTeX / LuaLaTeX 与 Biber 生成 7 页 PDF；正式 GB/T 7714-2025 输出仍以安装 `gb7714-2025` 的 TeX 环境为准。

两种标题页预览的状态记录见 [`../../docs/assets/rendered/RENDERING_STATUS.md`](../../docs/assets/rendered/RENDERING_STATUS.md)。
