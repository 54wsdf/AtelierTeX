# ATX-ACGN-REF Word Companion 设计草案

AtelierTeX 的 LaTeX 实现适合熟悉 TeX 的作者；面向 Word 用户，项目计划提供一套 **Word Companion**，让同一套 ACGN 引用规范可以在 `.docx/.docm/.dotm` 工作流中使用。

## 1. 推荐交付形态

未来建议同时提供：

```text
AtelierTeX-ACGN.dotm        可复用的 Word 宏模板
ATX-ACGN-REF-Demo.docm      带示例数据和操作按钮的演示文档
ATX-ACGN-REF-Schema.json    与 LaTeX 共用的数据字段定义
```

`.dotm` 适合长期作为模板安装；`.docm` 适合直接打开学习、复制和填写。

## 2. 设计目标

Word 用户可以完成：

- 新增 ACGN 来源；
- 选择 Media Tag；
- 录入 episode / chapter / page / timestamp；
- 插入正文引用；
- 一键生成 GB/T 7714-2025 + ATX-ACGN-REF 参考文献；
- 导入 / 导出 BibLaTeX；
- 导入 / 导出 JSON / CSV；
- 在 Word 与 AtelierTeX 之间交换同一来源数据库。

## 3. 共用字段

Word 与 LaTeX 共用以下抽象字段：

```text
id
citation_key
title
subtitle
creator
organization
date
published_at
accessed_at
object_type
media_tag
carrier_format
locator
version
platform
language
url
doi
isbn
rights
verification
notes
```

其中：

```text
object_type   = 正式资源身份
media_tag     = GAME / COMM / ANIME / MANGA / MUSIC ...
carrier_format= PDF / DOCX / MP4 / PNG / CSV ...
locator       = episode / page / timestamp / route / track ...
```

## 4. Word Ribbon 设计

建议新增 Ribbon：

```text
AtelierTeX ACGN
├── 新建来源
├── 插入引用
├── 编辑 Locator
├── 引用管理器
├── 生成参考文献
├── 刷新全部引用
├── 导入 BibTeX
├── 导出 BibTeX
├── 导入 JSON/CSV
├── 导出 JSON/CSV
└── 检查文献
```

## 5. 新建来源表单

表单第一步选择对象类别：

```text
游戏
动画 / 视频
漫画 / 小说
音乐 / 音频
Live / Stage
官方网页
社交媒体
研究文献
数据 / 软件
数字文件
```

第二步选择具体 Media Tag：

```text
GAME
COMM
ANIME · EP
MANGA · CH
MUSIC · TRACK
LIVE
CHARACTER FILE
FAN LOCATOR
...
```

第三步根据类型动态显示字段。例如 `ANIME · EP` 自动显示：

```text
Series
Episode
Episode title
Date
Platform / publisher
Timestamp
URL
Access date
```

## 6. Locator 编辑器

Word Companion 可以提供专门的 Locator 控件：

### 游戏

```text
STEP: 1
Episode: 08
Title: 失败的重量
→ COMM · S1E08
```

### 动画

```text
Episode: 03
Start: 00:12:31
End: 00:12:46
→ ANIME · EP03 · 00:12:31-00:12:46
```

### 漫画

```text
Volume: 03
Chapter: 27
Pages: 45-66
→ MANGA · V03C27 · pp.45-66
```

### Live

```text
Date: 2026-12-20
Act: 2
Song: 05
→ LIVE · ACT2 · SONG05
```

## 7. 参考文献渲染

Word 输出目标与 LaTeX 保持一致：

```text
[12]  COMM · S1E08  Example Studio. 角色A 亲爱度剧情 STEP1 第8话
      「失败的重量」[CP/OL]. Example Game, 2026.
```

Media Tag 通过字符样式 `ATX Media Tag` 控制；正式文献正文通过 `ATX Bibliography` 控制。

推荐 Word Styles：

```text
ATX Bibliography
ATX Media Tag
ATX Citation
ATX Locator
ATX Original
ATX Translation
ATX Figure Caption
```

## 8. 数据存储

推荐使用 Word Custom XML Part 保存 canonical source records，并用 Content Controls 作为编辑界面。

结构示例：

```xml
<atx:source id="SRC-MEDIA-EXAMPLE-001">
  <atx:title>示例来源</atx:title>
  <atx:mediaTag>COMM · S1E08</atx:mediaTag>
  <atx:objectType>game_episode</atx:objectType>
  <atx:locator>STEP1 / E08</atx:locator>
</atx:source>
```

VBA 负责：

- 表单；
- 字段验证；
- 文中引用刷新；
- 参考文献排序；
- JSON / BibLaTeX 导入导出。

## 9. 与 Word 自带 Citation Manager 的关系

Word 自带 Bibliography Manager 可以继续用于传统文献；ATX-ACGN-REF Companion 主要处理 Word 原生类型很难表达的：

```text
COMM / GAME episode
ANIME episode + timestamp
MANGA chapter
CARD / CG
MUSIC version
LIVE act/song
FAN LOCATOR
复杂数字文件与 evidence locator
```

后续可以研究将部分标准图书、期刊、论文条目同步到 Word 自带 Sources.xml。

## 10. 与 Zotero / CSL 的接口

未来可增加：

```text
CSL JSON import/export
Zotero Better BibTeX import/export
RIS import/export
```

ATX-specific 字段可通过 `note`、`extra` 或独立 sidecar JSON 保留，避免在跨软件交换时丢失 `media_tag` 和 `locator`。

## 11. 文件引用助手

Word Companion 可提供“从文件建立来源”按钮：

```text
选择 PDF / DOCX / PPTX / XLSX / CSV / JSON / PNG / MP4 / ZIP
        ↓
读取文件名、扩展名、修改日期
        ↓
用户选择对象身份
        ↓
填写责任者、题名、版本、locator
        ↓
生成 canonical source record
```

文件扩展名只作为 `carrier_format`，用户继续选择实际对象身份。

## 12. 安全与宏策略

未来 `.docm/.dotm` 需要：

- VBA 源码完整公开；
- 宏数字签名或明确 checksum；
- 不联网执行隐式下载；
- 文件扫描只读取用户明确选择的路径；
- 导入数据先预览再写入；
- 参考文献数据库可以另存为 JSON 纯文本备份。

## 13. 建议开发阶段

### Phase 1 — Static Word Template

- Word Styles；
- 标题/正文/原文/译文/图注样式；
- 手工 media tag；
- 示例参考文献。

### Phase 2 — `.docm` Citation Demo

- 新建来源表单；
- 插入 citation；
- 生成 bibliography；
- JSON export。

### Phase 3 — `.dotm` Reusable Template

- Ribbon；
- source manager；
- locator editor；
- BibLaTeX / CSL JSON exchange。

### Phase 4 — Cross-editor Compatibility

```text
Word ↔ JSON ↔ AtelierTeX
Word ↔ BibLaTeX
Word ↔ Zotero / CSL
结构化资料库 ↔ JSON ↔ Word / LaTeX
```

## 14. 最终目标

ATX-ACGN-REF 保持一个规范，两套主要编辑前端：

```text
ATX-ACGN-REF
   ├── AtelierTeX / LaTeX
   └── Word Companion (.dotm + .docm)
```

作者选择自己熟悉的写作工具，最终 Media Tag、Locator、GB/T 7714-2025 参考文献结构和来源数据保持一致。
