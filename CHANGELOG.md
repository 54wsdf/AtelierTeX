# 版本变更记录

## 0.5.3 — 2026-08-20

- LuaLaTeX 的简中主字体、简中姓名角色与粗体改用同一字体链，避免姓名和相邻标题文字混用 Noto/Fandol。
- 为 `Noto Serif SC` 可变字体显式绑定 700 粗体轴，并补齐中文斜体替代，消除粗体/斜体上下文中的常规字重替代警告。
- 明确 XeLaTeX 为规范发布、分页冻结与 README 预览的默认引擎，LuaLaTeX 保留为兼容性目标。

## 0.5.2 — 2026-08-20

- 新增 `\AtelierSCGlyph`、`\AtelierTCGlyph` 与 `\AtelierJPGlyph`，允许共享汉字按内容语种显式选择 CJK 字形。
- 增加 U+7BE0 的简中/日文双角色回归样例，避免大字号标题被无条件日文字体 fallback 拆成混合字族。

## 0.5.1 — 2026-08-20

- 明确 LPPL-1.3c 的 `maintained` 状态、当前维护者与完整 Work 清单。
- 为全部类文件和样式文件补齐版权、SPDX、维护状态及 manifest 引用。
- 新增中文为主的许可范围说明，并加入未分类文件的发布前阻断检查。

## 0.5.0 — 2026-08-20

- 新增 `essay` 随笔长文 Profile 与同名标题页排版。
- 新增 deck、可选头图、不编号叙事照片及白底线框占位接口。
- 新增不对应真实稿件的通用随笔样张，并为三种标题页分别生成 PDF 与 PNG。
- 公共边界测试阻止已撤出稿件的标题、正文和路径重新进入仓库。

## 0.4.0 — 2026-08-18

- 发布 2172×724 不透明 PNG 刊头资产与 README 首页预览。
- 提供 `feature` 专题封面与 `symposium` 研讨会刊页两种并列标题页排版。
- 增加标题页排版注册表与公共元数据槽，便于后续注册更多平行排版。
- 两种排版分别编译独立 PDF，并生成 240 dpi、不透明 RGB A4 PNG。
- 渲染脚本调用 Poppler，并检查输出尺寸、色彩类型与完整解码。
- 统一完整样张与引用示例的标准书目路径，并完成 Biber 编译。
- 将对象级渲染目录与文件载体矩阵合并到 `docs/ATX-ACGN-REF.md`，原路径保留为兼容导航页。

## 0.3.0 — 2026-08-18

- 建立并推进 **ATX-ACGN-REF 0.4 — AtelierTeX ACGN 引用扩展规范**。
- 公共 ACGN 默认书目基线升级为 **GB/T 7714-2025**。
- `\AtelierUseACGNBibliography` 采用 `biber + gb7714-2025 + ATX Media Index`。
- 既有 GB/T 7714-2015 工程通过 `\AtelierUseACGNBibliographyLegacy` 保持兼容。
- Media Tag renderer 使用轻量浅灰标签，正式方括号文献类型继续由 GB/T 7714-2025 决定。
- ACGN / 跨媒介目录扩展到 60 余种对象与文件载体，包括游戏、剧情、动画、漫画、小说、音乐、Live、VTuber、网络内容、研究数据、代码仓库、Commit、PDF、DOCX、PPTX、XLSX、CSV、JSON、YAML、Notebook、图像、音视频、字幕与 Archive。
- 新增 `examples/full-specimen/`：10 页完整公共样张，收录 50 条真实公开来源或真实项目对象。
- 新增真实 PDF 产物与全页渲染图：`docs/assets/rendered/`。README 以 PDF 派生 PNG/JPEG 作为主要排版展示。
- 新增 AtelierTeX 通用刊头资产（当前入口为 `assets/ateliertex-masthead.png`）。
- 新增通用 Masthead API：`\AtelierSetMasthead`、`\AtelierSetMastheadWidth`、`\AtelierShowMasthead`、`\AtelierHideMasthead`。
- 修正字体 fallback：Latin serif/sans/mono 增加 Noto / DejaVu / Latin Modern 兜底，实际完整样张编译用于验证字体链。
- 新增 `docs/ATX-ACGN-REF-CATALOG.md`、`docs/ATX-ACGN-FILE-MATRIX.md`、`docs/REAL_WORLD_EXAMPLES.md` 与 `docs/WORD_COMPANION.md`。
- 新增 `PROJECT.md` 与 `CITATION.cff`，明确项目由 `54wsdf` 发起并维护。
- 开发实现与 QA 集中到 `docs/development/` 和 `tests/`，README 保持项目介绍、真实渲染、主要能力与用户入口。

## 0.2.0 — 2026-08-18

- 将项目公开定位明确为面向 ACGN / 二次元 / 跨媒介人文研究的多语种长篇论文基础模板，同时保持一般人文与设计研究泛用性。
- 新增 `\AtelierUseACGNBibliography` 与 `\AtelierEnableMediaIndex`。
- 约定 BibLaTeX `verba` 字段保存 Media Tag，正式 entry type 与引用样式保持独立。
- 建立第一版 GAME / COMM / CARD / EVENT / ANIME / MANGA / NOVEL / VN / MUSIC / LIVE / PV / STREAM 等来源语义。
- 新增 `examples/acgn-research-demo/`。

## 0.1.3 — 2026-08-18

- 稳定 XeLaTeX / LuaLaTeX 的 CJK/Japanese 字体回退路径。
- 将日文字体角色与简中主字体角色进一步分离。
- 扩展跨项目 CJK/Japanese 兼容字形映射。
- 采用显式手工 smoke / release QA。
- 补充基础框架、出版排版扩展与作者稿件的职责关系。
- 完成中文主文档体系。

## 0.1.2 — 2026-08-18

- 扩展可复用的 CJK/Japanese glyph fallback corpus。
- 将字形兼容作为公共基础设施维护。
- 保留 `\AtelierDeclareJPCharFallback` 作为下游扩展点。
- 优化 LuaLaTeX 的日文字体优先顺序。

## 0.1.1 — 2026-08-18

- 增加下游字形 fallback API。
- 记录 commit pin、双引擎语义兼容与分页可复现的区别。
- 明确基础框架、出版排版扩展与作者稿件的职责边界。

## 0.1.0 — 2026-08-17

- 建立模块化长篇文档类。
- 加入 XeLaTeX / LuaLaTeX 可移植字体处理。
- 加入多语种、叙事、图像、表格与书目语义接口。
- 提供 `academic`、`editorial`、`narrative`、`visual` 四种基础 profile。
- 提供中性示例与双引擎手工编译脚本。
