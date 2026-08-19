# AtelierTeX 架构说明

AtelierTeX 采用两条正交轴线：**研究/文档语义**与**出版样式**。正文声明内容类型，Profile 决定呈现方式。

ACGN / 二次元 / 跨媒介研究是 AtelierTeX 的首要应用场景，因此游戏剧情、动画集数、漫画章节、歌曲、Live、卡面、PV 等来源语义进入公共核心；具体作品、角色、会议与论文进入对应下游仓库。

```mermaid
flowchart TD
    source["研究/文档源文件"] --> class["atelier.cls"]
    class --> semantics["稳定语义模块"]
    semantics --> acgn["ATX-ACGN-REF / 跨媒介来源语义"]
    class --> profile["版式 Profile"]
    semantics --> output["XeLaTeX / LuaLaTeX PDF"]
    acgn --> output
    profile --> output
```

## 1. 四层结构

### L1：文档类入口

`atelier.cls` 处理 Profile 选项、加载稳定语义模块，并提供标准 LaTeX 文档入口。

### L2：稳定语义模块

`atelier/` 保存字体、语言、叙事、图表、布局、书目等跨项目能力。

Bibliography 从 AtelierTeX 0.3 起由 **ATX-ACGN-REF 0.1** 统一 ACGN / 跨媒介引用语义，并以 GB/T 7714-2025 作为默认中文正式著录层。

```text
GAME / COMM / CARD / EVENT
ANIME / OVA / FILM
MANGA / NOVEL / VN
MUSIC / DRAMA CD / LIVE
PV / MV / STREAM
CHARACTER FILE / INTERVIEW / SOCIAL / FAN LOCATOR
```

### L3：基础 Profile

`profiles/` 描述视觉与阅读密度：

- `academic`：传统学术；
- `editorial`：编辑/期刊型；
- `narrative`：叙事型研究；
- `visual`：视觉证据优先。

ATX-ACGN-REF 与任意 Profile 组合使用。

### L4：下游出版与稿件

```text
manuscript
    ↓
publication profile
    ↓
AtelierTeX
```

具体会议、刊物、同人志和书籍视觉进入 publication profile；具体论文进入 manuscript。

## 2. 模块职责

| 模块 | 主要职责 | 典型输出 |
| --- | --- | --- |
| `core` | 元数据、标题钩子、链接、列表、基础间距 | 稳定文档入口 |
| `fonts` | Unicode 引擎、字体角色、CJK/Japanese 回退 | 多平台字符覆盖 |
| `languages` | 简中/繁中/日文/英文、原文与译文语义 | 多语种文本块 |
| `narrative` | 幕间、对白、题辞、场景分隔 | 小说式研究结构 |
| `figures` | 图像辅助、占位、证据型图注接口 | 视觉证据 |
| `tables` | `booktabs`、`tabularx`、跨页表格基础 | 长文表格 |
| `layout` | A4 长文几何、标题、页眉页脚基础 | 通用页面结构 |
| `bibliography` | BibLaTeX、GB/T 7714-2025、ATX-ACGN-REF renderer | 跨媒介书目 |
| `qa` | 草稿/核验辅助 | 发布前检查标记 |

## 3. 语义接口

作者接口描述研究功能：

```latex
\begin{AtelierOriginal}
原文……
\end{AtelierOriginal}
```

```latex
\begin{AtelierInterlude}{幕间}
……
\end{AtelierInterlude}
```

书目使用标准 BibLaTeX entry type 保存正式来源身份，`verba` 保存 ACGN Media Tag：

```bibtex
@software{example_commu,
  title = {角色剧情 STEP1 第8话},
  verba = {COMM · S1E08}
}
```

## 4. 学术结构与叙事结构

学术层使用 `section/subsection`，叙事层使用 `AtelierInterlude`、`AtelierDialogue`、`AtelierEpigraph` 等环境。二者可以在同一长文中交错组织。

## 5. ATX-ACGN-REF 引用结构

```text
GB/T 7714-2025 正式著录
        +
Atelier Media Tag
        +
媒介专属 locator
```

典型组合：

```text
@software    + COMM · S1E08
@video       + ANIME · EP03
@inbook      + MANGA · V03C27
@music       + MUSIC · TRACK01
@performance + LIVE · ACT2
```

完整规范见 [`ATX-ACGN-REF.md`](ATX-ACGN-REF.md)。

## 6. 字体架构

字体按角色组织：Latin Serif、Latin Sans、Mono、简中、繁中、日文、Display。跨项目常见的日文标点、旧字、异体和姓名字形由公共 fallback 语料覆盖。

详见 [`FONTS_AND_LANGUAGES.md`](FONTS_AND_LANGUAGES.md)。

## 7. 使用层级

```text
作者文稿 → 出版排版扩展 → AtelierTeX
```

AtelierTeX 提供通用语义与排版能力；出版排版扩展提供具体刊物或活动的视觉与元数据；作者文稿保存正文、图表和书目。

## 8. 项目文档层

用户与规范文档：

- `README.md`
- `PROJECT.md`
- `docs/USER_GUIDE.md`
- `docs/ATX-ACGN-REF.md`

开发与测试入口：

- `docs/development/README.md`
- `docs/DEVELOPER_GUIDE.md`
- `tests/README.md`

这样项目介绍、规范、实现和测试各自保持清晰层级。
