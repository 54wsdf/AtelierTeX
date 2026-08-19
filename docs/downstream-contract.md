# 下游仓库与依赖关系说明

AtelierTeX 作为公共排版基础设施，为 publication profile 与 manuscript 提供稳定语义、字体、多语种、叙事、图表和 ACGN 书目能力。项目族通过清晰的职责分层保持可复现性与长期维护性。

## 1. 推荐项目族结构

```text
workspace/
├── AtelierTeX/                 # 公共排版核心
├── publication-profile/        # 某刊物/会议/书籍视觉层
└── manuscript/                 # 某一篇论文或长文正文
```

公共构建链：

```text
排版链： manuscript → publication-profile → AtelierTeX
```

Manuscript 保留完成编译所需的正文、图表与书目子集，因此正式稿件可以独立构建。

## 2. 版本锁定

正式稿件和 publication profile 建议记录：

- AtelierTeX commit SHA 或 release tag；
- publication profile commit SHA；
- 出版基准引擎；
- TeX Live 版本；
- 关键字体环境。

这组信息能够追踪分页、断行、字体和 API 变化来源。

## 3. Publication Profile 职责

Publication Profile 负责：

- 标题页与刊头；
- 章节视觉；
- 页眉页脚；
- 原文、译文、幕间、对白的专属样式；
- ACGN media tag 的 renderer；
- 投稿元数据；
- 品牌颜色、Logo 与视觉资产；
- 少量 publication-specific 字形扩展。

通用字体、语言、叙事和 bibliography 语义继续由 AtelierTeX 提供。

## 4. Manuscript 职责

Manuscript 保存：

- 正文；
- 章节拆分；
- 本稿使用的 `.bib`；
- 论证图表；
- 稿件级来源审计；
- 投稿信息；
- 构建脚本与依赖锁。

它面向一篇具体作品，并保持可独立编译。

## 5. 字形兼容

AtelierTeX 维护跨项目 CJK / Japanese 兼容语料，覆盖：

- 日文标点与特殊假名；
- 历史字形、旧字、异体字；
- CJK Compatibility Ideographs；
- 姓名、地名与书目高频特殊字形。

下游可追加：

```latex
\AtelierDeclareJPCharFallback{字符}{UNICODE十六进制}
```

具有跨项目复用价值的字符可提升到公共兼容表。

## 6. 双引擎兼容

### 内容兼容

XeLaTeX 与 LuaLaTeX 共同验证：

- 正文；
- 多语种原文/译文；
- ACGN media tag；
- 图表；
- 引用与参考文献；
- 章节结构。

### 分页复现

正式逐页复现版本通过锁定以下环境获得：

```text
Engine
TeX distribution
Font set
AtelierTeX revision
Publication profile revision
```

一个引擎可作为正式出版基准，另一个引擎用于内容兼容验证。

## 7. QA 策略

AtelierTeX 使用手工发布门：

```powershell
pwsh -File tests/compile-smoke.ps1 -Engine both
pwsh -File tests/verify-boundary.ps1
```

推荐运行节点：

- 字体或语言后端调整；
- 公共 API 调整；
- ACGN bibliography 调整；
- 下游依赖 pin 更新；
- 发布；
- 投稿与归档。

## 8. 内容存储地图

| 内容 | 推荐位置 |
| --- | --- |
| 通用 LaTeX、ACGN taxonomy、多语种、字形兼容 | AtelierTeX |
| 标题页、Logo、品牌视觉、publication renderer | publication profile |
| 正文、图表、本稿书目、稿件审计 | manuscript |

## 9. 新功能归属判断

```text
通用排版/语言/字体/ACGN引用能力 → AtelierTeX
出版物视觉/品牌/投稿元数据         → publication profile
具体论文正文/图表/本稿书目         → manuscript
```

这个职责映射可直接用于未来新增仓库、论文和 publication profile。
