# GB/T 7714-2025 + ACGN 真实来源引用演示

# GB/T 7714-2025 + ACGN Real-World Citation Showcase

这个目录是 ATX-ACGN-REF 0.4 的 canonical citation showcase。它同时演示三件事：`.bib` 怎么写、正文怎么 `\cite`、最终 bibliography 怎么渲染。  
This directory is the canonical citation showcase for ATX-ACGN-REF 0.4. It demonstrates the complete workflow from `.bib` metadata to in-text `\cite` commands and the rendered bibliography.

当前 `references.bib` 包含 **42 条记录**。ACGN 部分优先采用作品官方站、发行方、出版社和创作者/厂商官方页面；普通学术与技术部分优先采用出版社、标准组织、大学机构库、数据集主页和软件项目官方页面。  
The current `references.bib` contains **42 records**. ACGN entries primarily use official work pages, publishers, labels, and first-party project pages; academic and technical entries use publishers, standards bodies, institutional repositories, dataset pages, and software project sources.

`FAN LOCATOR` 当前保留为 format fixture，用于验证字段和渲染结构；实际论文应替换为经过核验的具体来源。  
`FAN LOCATOR` is retained as a format fixture for field and rendering tests; real papers should replace it with a verified source.

## 当前覆盖 / Coverage

ACGN / media：`GAME`、`CHARACTER FILE`、`COMM`、`PV`、`SETTING FILE`、`MAP`、`EVENT`、`MUSIC TRACK`、`MUSIC SINGLE`、`MV`、`NEWS`、`LIVE`、`AUDIO FILE`、`WEB MANGA`、`ANIME EP`、`MANGA VOL`、`NOVEL VOL`、`INTERVIEW`。

ACGN / media: `GAME`, `CHARACTER FILE`, `COMM`, `PV`, `SETTING FILE`, `MAP`, `EVENT`, `MUSIC TRACK`, `MUSIC SINGLE`, `MV`, `NEWS`, `LIVE`, `AUDIO FILE`, `WEB MANGA`, `ANIME EP`, `MANGA VOL`, `NOVEL VOL`, and `INTERVIEW`.

一般文献 / General bibliography：`JOURNAL`、`BOOK`、`CONFERENCE`、`THESIS`、`REPORT`、`STANDARD`、`DATASET`、`PATENT`、`NEWSPAPER`、`DATABASE`、`PREPRINT`。

General bibliography: `JOURNAL`, `BOOK`, `CONFERENCE`, `THESIS`, `REPORT`, `STANDARD`, `DATASET`, `PATENT`, `NEWSPAPER`, `DATABASE`, and `PREPRINT`.

数字对象 / Digital objects：`JSON`、`CSV`、`YAML`、`DOCX/PPTX/XLSX`、`PNG`、`SVG`、`WEBVTT`、`ZIP`、`IPYNB`、`RELEASE`、`REPOSITORY`。

Digital objects: `JSON`, `CSV`, `YAML`, `DOCX/PPTX/XLSX`, `PNG`, `SVG`, `WEBVTT`, `ZIP`, `IPYNB`, `RELEASE`, and `REPOSITORY`.

## 正文引用 / In-text citations

```latex
普通引用 / Basic citation:
\cite{gakumas_game}

作品内定位 / Internal work locator:
\cite[STEP1 / Episode 8]{hiro_commu_step1_08}

动画单集 / Anime episode:
\cite[Episode 1]{umamusume_anime_ep01}

多来源并引 / Multiple sources:
\cite{hiro_song_koukei,hiro_1st_single}
```

渲染结构 / Rendering model：

```text
[顺序号 / No.]  ATX MEDIA TAG  GB/T 7714-2025 正式著录 / formal entry + ATX LOCATOR
```

## 编译 / Build

```powershell
latexmk -xelatex -halt-on-error -interaction=nonstopmode examples/gbt7714-acgn-profile/main.tex
```

或 / or：

```powershell
latexmk -lualatex -halt-on-error -interaction=nonstopmode examples/gbt7714-acgn-profile/main.tex
```

推荐 TeX Live 2026、Biber，以及提供 `gb7714-2025` 的当前 biblatex-gb7714 包。旧环境会由 AtelierTeX 回退到 GB/T 7714-2015 compatibility renderer；`@preprint` 的完整正式渲染以 2025 样式为准。  
Recommended environment: TeX Live 2026, Biber, and a current biblatex-gb7714 package providing `gb7714-2025`. Older environments fall back to AtelierTeX's GB/T 7714-2015 compatibility renderer; full `@preprint` rendering requires the 2025 style.

## 对应规范 / Related documents

- [`../../docs/ATX-ACGN-REF.md`](../../docs/ATX-ACGN-REF.md)
- [`对象级渲染目录`](../../docs/ATX-ACGN-REF.md#object-catalog)
- [`文件与载体矩阵`](../../docs/ATX-ACGN-REF.md#file-matrix)
- [`../../docs/REAL_WORLD_EXAMPLES.md`](../../docs/REAL_WORLD_EXAMPLES.md)
