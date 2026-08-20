# AtelierTeX 开发与维护说明

本文面向准备修改 AtelierTeX 核心的维护者。用户写作流程见 [`../USER_GUIDE.md`](../USER_GUIDE.md)。

## 1. 开发重点

AtelierTeX 维护工作主要覆盖：

1. 作者 API 稳定；
2. 多语种与长文可靠；
3. ATX-ACGN-REF 与跨媒介来源语义；
4. 内容与 publication presentation 分层；
5. XeLaTeX / LuaLaTeX 内容兼容；
6. 下游 publication profile 扩展；
7. 视觉能力演进。

## 2. 模块归属

- 文档元数据、全局命令 → `core.sty`
- 字体、字符、引擎 → `fonts.sty`
- 语言、原文、译文 → `languages.sty`
- 幕间、对白、题辞 → `narrative.sty`
- 图像与图注 → `figures.sty`
- 表格 → `tables.sty`
- 页面、标题、页眉页脚 → `layout.sty`
- BibLaTeX、GB/T 7714-2025、ATX-ACGN-REF → `bibliography.sty`
- 草稿/核验辅助 → `qa.sty`

Publication-specific presentation 进入独立 profile 仓库。

## 3. 作者 API

作者接口以研究语义命名，例如：

```latex
\begin{AtelierOriginal}
...
\end{AtelierOriginal}
```

```latex
\AtelierUseACGNBibliography
```

新增公共 API 时检查：多项目复用价值、与现有语义的关系、参数兼容性、Profile 可重定义性、示例覆盖和文档覆盖。

## 4. ATX-ACGN-REF 实现

公共规范见 [`../ATX-ACGN-REF.md`](../ATX-ACGN-REF.md)。

实现结构：

```text
BibLaTeX entry type  → 正式来源身份
GB/T 7714-2025       → 正式中文著录
verba media tag      → ACGN 媒体导航
citation locator     → episode / chapter / page / timestamp / route
```

具体字段与 renderer 见 [`BIBLIOGRAPHY_IMPLEMENTATION.md`](BIBLIOGRAPHY_IMPLEMENTATION.md)。

## 5. Profile 开发

基础 Profile 负责字号、段距、标题、留白、图表密度和叙事环境呈现。独立 publication profile 可以继续叠加标题页、品牌资产、投稿元数据和 media-tag renderer。

## 6. 字体系统

修改 `fonts.sty` 时同时测试：

- Windows 常见字体环境；
- TeX Live 自带字体环境；
- XeLaTeX；
- LuaLaTeX；
- 简中、繁中、日文；
- 中日英混合书目；
- 特殊姓名字形；
- `Missing character`；
- PDF 文本复制与提取。

逐字符 fallback 由真实缺字案例推动。

## 7. 手工测试

```powershell
pwsh -File tests/compile-smoke.ps1 -Engine both
pwsh -File tests/verify-boundary.ps1
```

当前七个示例：

- `gbt7714-acgn-profile`：GB/T 7714-2025 + ATX-ACGN-REF；
- `acgn-research-demo`：ACGN 论文组合；
- `multilingual-demo`：多语种与字符覆盖；
- `longform-demo`：长文结构；
- `narrative-demo`：学术/叙事正交；
- `visual-essay-demo`：视觉论文。
- `essay-longread-demo`：随笔长文、图片与标题页接口。

版式相关改动同时人工查看渲染 PDF。

## 8. 版本管理

- patch：bug、字体覆盖、文档、兼容性；
- minor：新增稳定语义能力、规范版本或 Profile 能力；
- major：作者 API 的系统性升级。

发布同步更新 `\ProvidesClass` / `\ProvidesPackage`、CHANGELOG、规范、用户文档和示例。

## 9. 下游依赖 Pin

推荐升级流程：

1. AtelierTeX 完成改动；
2. 七个示例双引擎 smoke test；
3. publication profile smoke test；
4. 真实长稿双引擎测试；
5. 关键页视觉检查；
6. 更新下游 `DEPENDENCY_LOCK.md`。

## 10. 发布检查

- [ ] 七个示例 XeLaTeX 通过；
- [ ] 七个示例 LuaLaTeX 通过；
- [ ] `Missing character` 为 0；
- [ ] `Undefined control sequence` 为 0；
- [ ] 严重 `LaTeX Error` 为 0；
- [ ] ATX-ACGN-REF 渲染正常；
- [ ] 公共边界检查通过；
- [ ] 关键页面人工审版；
- [ ] CHANGELOG、规范和说明书同步；
- [ ] 下游 profile 与至少一个真实长稿实测。
