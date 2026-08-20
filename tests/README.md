# `tests/` 手工 QA 说明

AtelierTeX 采用显式本地/发布前 QA。测试由维护者在版本冻结、依赖升级和发布节点主动运行。

## `compile-smoke.ps1`

使用 XeLaTeX / LuaLaTeX 编译七个中性示例，并检查关键日志信号。

覆盖范围：

```text
gbt7714-acgn-profile    GB/T 7714-2025 + ATX-ACGN-REF 独立渲染
acgn-research-demo      ACGN 论文与跨媒介引用
multilingual-demo       多语种与字形覆盖
longform-demo           长文结构
narrative-demo          学术 + 叙事语义
visual-essay-demo       视觉论文
essay-longread-demo     随笔刊页与叙事照片接口
```

运行方式：

```powershell
pwsh -File tests/compile-smoke.ps1 -Engine xelatex
pwsh -File tests/compile-smoke.ps1 -Engine lualatex
pwsh -File tests/compile-smoke.ps1 -Engine both
```

两个 ACGN bibliography 示例使用 `biber` 与支持 `gb7714-2025` 的当前 `biblatex-gb7714-2015` 宏包。脚本先清理旧输出，再执行完整重建。

检查项：

- `Missing character:`；
- `Undefined control sequence`；
- `LaTeX Error:`；
- undefined citation；
- undefined reference；
- CJK 粗体被静默替换为常规字重；
- 最终 PDF 生成状态。

## `verify-boundary.ps1`

检查公共仓库内容是否符合项目族职责分层。

公共核心包含通用 ACGN 分类、媒体语义、通用日文字形、中性示例、公共文档与测试。具体出版物视觉和作者正文由各自项目管理。

## `render-readme-preview.ps1`

先调用 `compile-full-specimen.ps1` 编译三种标题页样张，再用 Poppler 将各自第一页输出为 240 dpi、白底、不透明 PNG：

```powershell
pwsh -File tests/render-readme-preview.ps1 -Engine xelatex
```

脚本同时检查 A4 像素尺寸、PNG 色彩类型和完整解码，输出位置为：

```text
docs/assets/rendered/ateliertex-feature-page1.png
docs/assets/rendered/ateliertex-symposium-page1.png
docs/assets/rendered/ateliertex-essay-page1.png
```

## 推荐运行节点

- `atelier.cls` 调整；
- 字体/CJK fallback 调整；
- 语言环境调整；
- ATX-ACGN-REF / bibliography renderer 调整；
- Profile 调整；
- 新增公共作者 API；
- 长表/浮动体调整；
- 新版本发布；
- 下游依赖 pin 更新。

## 视觉审版

以下内容变化时，同时人工查看 PDF：

- 字体；
- Media Tag；
- 参考文献断行；
- 标题页；
- 长表格；
- 浮动体；
- 原文/译文块；
- narrative 环境；
- 多语种段落。

发布级 QA 包含：**编译、日志、页面渲染、关键页人工审版**。
