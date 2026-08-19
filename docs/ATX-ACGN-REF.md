# ATX-ACGN-REF 0.4

## AtelierTeX ACGN 引用扩展规范
## AtelierTeX ACGN Citation Profile

**规范名称 / Profile name**：AtelierTeX ACGN Citation Profile  
**规范编号 / Version**：ATX-ACGN-REF 0.4  
**宿主项目 / Host project**：AtelierTeX  
**发起与维护 / Maintainer**：54wsdf  
**基础著录标准 / Base bibliographic standard**：GB/T 7714-2025  
**参考实现 / Reference implementation**：AtelierTeX 0.3 + BibLaTeX / `gb7714-2025`  
**发布日期 / Release date**：2026-08-18

**文档状态 / Document status**：本文件是 ATX-ACGN-REF 的唯一权威维护入口；对象级示例与文件载体反查均已并入本文。原目录路径仅作为兼容导航保留。

This file is the single authoritative entry for ATX-ACGN-REF. Object-level examples and file-carrier lookup are maintained here; the former document paths remain as compatibility redirects.

ATX-ACGN-REF 面向 ACGN、二次元与跨媒介研究，为传统参考文献体系补充媒体对象身份和作品内部定位。GB/T 7714-2025 提供正式著录层；ATX Media Tag 描述对象是什么；ATX Locator 描述引用落在对象内部的哪里。  
ATX-ACGN-REF extends conventional bibliography practice for ACGN and cross-media research. GB/T 7714-2025 provides the formal bibliographic layer; ATX Media Tag identifies the media object; ATX Locator identifies the cited position inside that object.

## 1. 三层结构 / Three-layer model

```text
[顺序号 / No.]  ATX MEDIA TAG  GB/T 7714-2025 正式著录 / formal entry  +  ATX LOCATOR
```

| 层 / Layer | 内容 / Content | 作用 / Purpose |
| --- | --- | --- |
| GB/T 7714-2025 | 责任者、题名、出版/发布信息、正式文献类型与载体 / creator, title, publication or release metadata, formal document type and carrier | 正式参考文献著录 / formal bibliography |
| ATX Media Tag | `GAME`、`COMM`、`ANIME`、`MANGA`、`MUSIC`、`LIVE` 等 / labels such as `GAME`, `COMM`, `ANIME`, `MANGA`, `MUSIC`, `LIVE` | 媒体对象识别 / media-object identification |
| ATX Locator | STEP、episode、chapter、page、timestamp、route、track、asset ID、version、commit | 对象内部精确定位 / precise internal location |

## 2. GB/T 7714-2025 正式类型 / Formal document types

```text
M   图书 / Monograph
J   期刊 / Journal
N   报纸 / Newspaper
C   会议录 / Conference proceedings
D   学位论文 / Thesis or dissertation
R   报告 / Report
S   标准 / Standard
P   专利 / Patent
EB  网站、网页 / Electronic resource or webpage
A   档案 / Archive
CM  地图 / Cartographic material
DS  数据集 / Dataset
PP  预印本 / Preprint
G   汇编 / Collection
CP  计算机程序 / Computer program
DB  数据库 / Database
Z   其他 / Other
```

`ANIME`、`MUSIC`、`COMM`、`CARD`、`LIVE` 等属于 ATX Media Tag，并不替代 GB/T 文献类型。正式方括号仍按底层对象选择 `[CP/OL]`、`[EB/OL]`、`[M]`、`[S/OL]`、`[DS/OL]`、`[PP/OL]`、`[Z/OL]` 等形式。  
ATX tags such as `ANIME`, `MUSIC`, `COMM`, `CARD`, and `LIVE` do not replace the underlying GB/T document type. Formal bracketed identifiers continue to follow the source object, for example `[CP/OL]`, `[EB/OL]`, `[M]`, `[S/OL]`, `[DS/OL]`, `[PP/OL]`, and `[Z/OL]`.

## 3. Media / Carrier Tag 总目录 / Media and carrier tag catalog

### 3.1 游戏与互动媒体 / Games and interactive media

| Tag | 中文定义 | English definition |
| --- | --- | --- |
| `GAME` | 游戏本体 | base game |
| `GAME VERSION` | 特定版本或发行版本 | specific release or version |
| `DLC` | 下载内容 | downloadable content |
| `PATCH` | 补丁或更新 | patch or update |
| `SEASON` | 赛季或季节性内容 | seasonal content |
| `COMM` | 角色交流、亲爱度剧情等分段叙事 | character communication or affection-story segment |
| `STORY` | 一般剧情单元 | story unit |
| `ROUTE` | 分支路线 | narrative route |
| `VN ROUTE` | 视觉小说路线 | visual-novel route |
| `EVENT` | 游戏内活动 | in-game event |
| `CARD` | 卡牌、卡面或角色卡 | card or character-card object |
| `CG` | 事件 CG 或静态视觉资产 | event CG or static visual asset |
| `COSTUME` | 服装对象 | costume object |
| `3D MODEL` | 三维角色或场景模型 | 3D character or scene model |
| `ASSET` | 其他可定位游戏资产 | other locatable game asset |

### 3.2 动画、电影与视频 / Animation, film, and video

| Tag | 中文定义 | English definition |
| --- | --- | --- |
| `ANIME` | 动画作品整体 | complete anime work |
| `ANIME EP` | 动画单集 | anime episode |
| `WEB ANIME` | 网络动画 | web animation |
| `SHORT` | 短片 | short-form video |
| `OVA` | 原创动画录像 | original video animation |
| `OAD` | 随出版物发行的动画 | original animation disc |
| `FILM` | 电影或剧场版 | film or theatrical feature |
| `TRAILER` | 预告片 | trailer |
| `PV` | 宣传影片 | promotional video |
| `CM` | 商业广告或短宣传片 | commercial or short advertisement |
| `MV` | 音乐录像 | music video |
| `CLIP` | 视频片段 | video clip |
| `STREAM` | 直播或串流节目 | livestream or streaming program |
| `VTUBER STREAM` | VTuber 直播 | VTuber livestream |
| `VIDEO FILE` | 本地或归档视频文件 | local or archived video file |
| `SUBTITLE` | 字幕文件 | subtitle file |

### 3.3 漫画、小说与出版物 / Manga, novels, and publications

| Tag | 中文定义 | English definition |
| --- | --- | --- |
| `MANGA VOL` | 漫画单行本 | manga volume |
| `MANGA CH` | 漫画章节 | manga chapter |
| `WEB MANGA` | 网络漫画章节或页面 | web manga chapter or page |
| `NOVEL VOL` | 小说卷册 | novel volume |
| `NOVEL CH` | 小说章节 | novel chapter |
| `WEB NOVEL` | 网络小说章节 | web-novel chapter |
| `SETTING BOOK` | 设定资料集 | setting book |
| `ARTBOOK` | 画集 | art book |
| `GUIDEBOOK` | 攻略或导览资料 | guidebook |
| `FANBOOK` | fan book | fan book |
| `DIGITAL BOOKLET` | 数字小册子 | digital booklet |
| `DOUJIN` | 同人出版物 | doujin publication |

### 3.4 音乐、声音与演出 / Music, audio, and performance

| Tag | 中文定义 | English definition |
| --- | --- | --- |
| `MUSIC SINGLE` | 单曲 | single |
| `MUSIC ALBUM` | 专辑 | album |
| `MUSIC TRACK` | 单个曲目 | track |
| `OST` | 原声音乐 | original soundtrack |
| `DRAMA CD` | Drama CD | drama CD |
| `AUDIO DRAMA` | 网络或数字音声剧 | digital audio drama |
| `RADIO` | 广播节目 | radio program |
| `PODCAST` | 播客 | podcast |
| `AUDIO FILE` | 音频文件 | audio file |
| `LIVE` | 现场演出 | live performance |
| `LIVE VIDEO` | 现场录像 | live-performance video |
| `STAGE` | 舞台剧 | stage production |
| `MUSICAL` | 音乐剧 | musical |
| `READING` | 朗读剧或 reading performance | staged reading |

### 3.5 官方资料、网络内容与社区 / Official materials, web content, and community sources

| Tag | 中文定义 | English definition |
| --- | --- | --- |
| `CHARACTER FILE` | 官方角色档案 | official character profile |
| `SETTING FILE` | 设定资料 | setting material |
| `CREATOR FILE` | 创作者资料 | creator profile |
| `INTERVIEW` | 采访 | interview |
| `NEWS` | 新闻或官方资讯 | news item |
| `PRESS RELEASE` | 新闻稿 | press release |
| `SOCIAL` | 社交媒体帖文 | social-media post |
| `VTALENT FILE` | 虚拟艺人或 VTuber 档案 | virtual-talent or VTuber profile |
| `WIKI` | Wiki 条目 | wiki entry |
| `FAN LOCATOR` | 用于发现章节、话数或资源位置的索引 | fan-maintained locator for discovering episode, chapter, or asset positions |
| `FAN STUDY` | 粉丝研究或整理资料 | fan study or compiled research note |
| `FORUM` | 论坛讨论串 | forum thread |
| `WEB ARCHIVE` | 网页存档 | archived webpage |

### 3.6 研究、数据、软件与代码 / Research, data, software, and code

| Tag | 中文定义 | English definition |
| --- | --- | --- |
| `STANDARD` | 标准 | standard |
| `REPORT` | 报告 | report |
| `PREPRINT` | 预印本 | preprint |
| `DATASET` | 数据集 | dataset |
| `DATABASE` | 数据库 | database |
| `SOFTWARE` | 软件 | software |
| `APP` | 应用程序 | application |
| `REPOSITORY` | 代码或资料仓库 | repository |
| `RELEASE` | 软件发布版本 | release |
| `COMMIT` | 提交记录 | commit |
| `ISSUE` | Issue | issue |
| `PR` | Pull Request | pull request |
| `CODE` | 代码文件或代码单元 | code object |
| `NOTEBOOK` | 计算笔记本 | computational notebook |
| `ARCHIVE` | 归档包或归档对象 | archive package or archived object |

### 3.7 文件载体与研究附件 / File carriers and research attachments

```text
PDF / DOCX / PPTX / XLSX / CSV / JSON / YAML / XML / IPYNB
PNG / JPEG / SVG / MP3 / WAV / FLAC / MP4 / MOV / MKV
VTT / SRT / ZIP / TAR / TEX / BIB / MD / RST
```

这些标签描述文件载体或研究附件格式，不直接替代底层来源的正式文献类型。  
These tags describe file carriers or research-attachment formats; they do not replace the formal bibliographic type of the underlying source.

- 按对象查看最终形式 / Object-level rendering rules：[附录 A：对象级渲染目录](#object-catalog)
- 按文件后缀反查 / File-extension lookup：[附录 B：文件与载体矩阵](#file-matrix)

## 4. Locator 体系 / Locator system

```text
COMM · STEP1 / EP08
ROUTE · A / CH05 / ENDING TRUE
ANIME · EP03 · 00:12:31-00:12:46
MANGA · V03 / CH27 / pp.45-66
NOVEL · V02 / CH05 / pp.123-151
MUSIC · TRACK01 / Solo ver.
DRAMA CD · DISC1 / TRACK03 / 00:08:10-00:09:04
LIVE · 2026-12-20 / ACT2 / SONG05
CARD · SSR / asset-id
DATASET · v2.1 / sheet / field
RELEASE · v0.4 / filename
COMMIT · full SHA
```

Locator 用于标记对象内部的位置，例如剧情步骤、话数、章节、页码、时间戳、路线、曲目、版本或 commit。在 BibLaTeX 正文引用中，推荐使用 postnote 保存与当前论证直接相关的 Locator。  
A locator identifies a position inside the cited object, such as a story step, episode, chapter, page, timestamp, route, track, version, or commit. In BibLaTeX in-text citations, the postnote is the preferred place for the locator relevant to the current argument.

```latex
\cite[STEP1 / Episode 8]{hiro_commu_step1_08}
\cite[Episode 1]{umamusume_anime_ep01}
```

## 5. 文件载体规则 / File-carrier rules

```text
PDF   → 期刊论文 / 报告 / 标准 / 预印本 / 设定集 / 网页导出
        Journal article / report / standard / preprint / setting book / web export

MP4   → 动画 / PV / MV / Live 录像 / 采访 / 直播存档
        Anime / PV / MV / live recording / interview / archived stream

PNG   → 卡面 / CG / 截图 / 图表 / 官方视觉资产
        Card art / CG / screenshot / figure / official visual asset

XLSX  → 数据集 / 实验结果 / 索引 / 调查表
        Dataset / experiment output / index / survey table

JSON  → 数据集 / API 输出 / Schema / 元数据
        Dataset / API output / schema / metadata

ZIP   → 软件 Release / 数据快照 / Archive
        Software release / data snapshot / archive
```

文件扩展名描述载体；来源对象身份决定正式著录。  
A file extension describes the carrier; the identity of the source object determines the formal bibliography entry.

## 6. BibLaTeX 输入与正文引用 / BibLaTeX input and in-text citation

示例 `.bib` 条目 / Example `.bib` entry：

```bibtex
@software{gakumas_game,
  author  = {{Bandai Namco Entertainment Inc.}},
  title   = {学園アイドルマスター},
  date    = {2024-05-16},
  url     = {https://gakuen.idolmaster-official.jp/},
  verba   = {GAME},
  langid  = {japanese}
}
```

正文引用 / In-text citation：

```latex
\cite{gakumas_game}
\cite[STEP1 / Episode 8]{hiro_commu_step1_08}
```

`verba` 保存 ATX Media Tag；postnote 保存本次引用所需的 Locator；其余标准字段继续由 BibLaTeX 与 GB/T renderer 处理。  
`verba` stores the ATX Media Tag; the postnote stores the locator for the current citation; standard bibliographic fields remain under BibLaTeX and the GB/T renderer.

## 7. 真实来源样例 / Real-world examples

当前 canonical bibliography 包含 42 条记录，涵盖 ACGN primary sources、一般学术文献、标准、数据集、软件与数字对象。  
The current canonical bibliography contains 42 records covering ACGN primary sources, conventional academic literature, standards, datasets, software, and digital objects.

逐条来源 / Source-by-source index：[`REAL_WORLD_EXAMPLES.md`](REAL_WORLD_EXAMPLES.md)  
可复制 `.bib`、正文 `\cite` 与 bibliography / Reusable `.bib`, in-text `\cite`, and rendered bibliography：[`../examples/gbt7714-acgn-profile/`](../examples/gbt7714-acgn-profile/)

## 8. 完整样张与 Masthead / Complete specimen and Masthead

完整样张 / Complete specimen：[`../examples/full-specimen/main.tex`](../examples/full-specimen/main.tex)  
Canonical bibliography：[`../examples/gbt7714-acgn-profile/references.bib`](../examples/gbt7714-acgn-profile/references.bib)

AtelierTeX 默认项目 Masthead 为 `assets/ateliertex-masthead.png`。

The default AtelierTeX project Masthead is `assets/ateliertex-masthead.png`.

```latex
\AtelierSetMasthead{assets/my-project-banner.png}
\AtelierSetMastheadWidth{0.88\textwidth}
\AtelierShowMasthead
\AtelierHideMasthead
```

Publication Profile 可以替换成自己的刊物或活动标识。  
A publication profile may replace this slot with its own publication or event identity.

## 9. Word / DOCM Companion

ATX-ACGN-REF 的 Media Tag、Locator 和 GB/T 7714-2025 字段可复用于未来 Word `.docm` 前端，包括来源类型、Locator、引文插入、参考文献生成、字段校验与 LaTeX 数据互换。  
The Media Tag, Locator, and GB/T 7714-2025 fields are designed for reuse by a future Word `.docm` companion, including source types, locators, citation insertion, bibliography generation, field validation, and LaTeX data exchange.

设计文档 / Design document：[`WORD_COMPANION.md`](WORD_COMPANION.md)

## 10. 项目引用 / Citing the profile

> 54wsdf. *AtelierTeX ACGN Citation Profile (ATX-ACGN-REF 0.4)*. AtelierTeX Project, 2026.

项目仓库 / Repository：`54wsdf/AtelierTeX`  
引用元数据 / Citation metadata：[`../CITATION.cff`](../CITATION.cff)

---

<a id="object-catalog"></a>

## 附录 A：对象级渲染目录 / Object-level rendering catalog

本附录按研究对象给出**最终参考文献中建议看到的形态**。其中的结构化条目用于说明 Media Tag、正式著录和 Locator 的组合；可编译的 42 条公开来源记录统一维护在 [`../examples/gbt7714-acgn-profile/references.bib`](../examples/gbt7714-acgn-profile/references.bib)。

> 通用结构：`[顺序号]  MEDIA TAG  正式 GB/T 7714-2025 著录 + locator`

### 一、游戏与互动媒体

#### GAME — 游戏本体

```text
[1]  GAME  EXAMPLE STUDIO. 星海学园偶像计划[CP/OL].
     Example Studio, 2026[2026-08-18].
```

建议记录：version / platform / server / release date。

#### COMM — 游戏剧情 / 角色剧情

```text
[2]  COMM · S1E08  EXAMPLE STUDIO. 角色A 亲爱度剧情 STEP1 第8话
     「失败的重量」[CP/OL]. 星海学园偶像计划, 2026.
```

#### STORY — 主线章节

```text
[3]  STORY · CH12  EXAMPLE STUDIO. 主线第12章「星光之前」[CP/OL].
     星海学园偶像计划, 2026.
```

#### ROUTE — 视觉小说 / 路线剧情

```text
[4]  ROUTE · TRUE  EXAMPLE STUDIO. 角色B True Route 第5章[CP/OL].
     Example Visual Novel, 2026.
```

#### EVENT — 游戏活动

```text
[5]  EVENT · SUMMER26  EXAMPLE STUDIO. 夏日限定活动「海边的约定」[CP/OL].
     2026-08-01—2026-08-15.
```

#### DLC / PATCH / SEASON

```text
[6]  DLC · AFTER STORY  EXAMPLE STUDIO. After Story Expansion[CP/OL]. 2026.
[7]  PATCH · v2.4.1     EXAMPLE STUDIO. Version 2.4.1 Release Notes[EB/OL]. 2026.
```

#### CARD

```text
[8]  CARD · SSR · A001  EXAMPLE STUDIO. SSR「未完成のステージ」[图像/OL].
     星海学园偶像计划, 2026. Asset ID: A001.
```

#### CG / COSTUME / 3D MODEL

```text
[9]   CG · SCENE18        EXAMPLE STUDIO. Scene 18 Key Visual[图像/OL]. 2026.
[10]  COSTUME · C042      EXAMPLE STUDIO. Costume C042「白昼夢」[数字资源]. 2026.
[11]  3D MODEL · M017     EXAMPLE STUDIO. Character Model M017[数字资源]. 2026.
```

### 二、动画、电影与视频

#### ANIME — 动画系列

```text
[12]  ANIME  EXAMPLE ANIMATION COMMITTEE. 星海物語[V]. 2026.
```

#### ANIME · EP — 动画单集

```text
[13]  ANIME · EP03  EXAMPLE ANIMATION COMMITTEE. 星海物語 第3话
      「未完成的舞台」[V/OL]. 2026.
```

正文镜头定位：

```text
00:12:31-00:12:46
```

#### WEB ANIME / SHORT / OVA / OAD

```text
[14]  WEB ANIME · EP02  EXAMPLE PROJECT. Web Short 第2话[V/OL]. 2026.
[15]  OVA · EP01        EXAMPLE PROJECT. 特别篇[V]. 2026.
[16]  OAD · VOL05       EXAMPLE PROJECT. 单行本第5卷附录动画[V]. 2026.
```

#### FILM

```text
[17]  FILM  EXAMPLE FILM COMMITTEE. 剧场版 星海物語[V]. 2026.
```

#### PV / CM / TRAILER / MV

```text
[18]  PV · 1ST       EXAMPLE PROJECT. 第1弹PV[V/OL]. 2026.
[19]  CM · 15SEC     EXAMPLE PROJECT. 15秒电视广告[V/OL]. 2026.
[20]  TRAILER · 02   EXAMPLE PROJECT. Main Trailer 2[V/OL]. 2026.
[21]  MV · TRACK01   EXAMPLE PROJECT. 「光の輪郭」Music Video[V/OL]. 2026.
```

#### STREAM / VTUBER

```text
[22]  STREAM · 2026-08-18  EXAMPLE PROJECT. 2周年情报生配信[V/OL]. 2026.
[23]  VTUBER · STREAM      EXAMPLE CHANNEL. 3D Live 配信[V/OL]. 2026.
```

建议 Locator：channel / date / timestamp / segment。

### 三、漫画、小说与出版物

#### MANGA · VOL

```text
[24]  MANGA · V03  示例作者. 星海物語[M]. 第3卷. 东京: Example Press, 2026.
```

#### MANGA · CH

```text
[25]  MANGA · V03C27  示例作者. 第27话「明日仍然会来」[M]//星海物語.
      第3卷. 东京: Example Press, 2026: 45-66.
```

#### WEB MANGA

```text
[26]  WEB MANGA · C01  示例作者. 星海物語 第1话[EB/OL]. 2026-07-03.
```

#### NOVEL / WEB NOVEL

```text
[27]  NOVEL · V02  示例作者. 星海物語[M]. 第2卷. 东京: Example Bunko, 2026.
[28]  NOVEL · C05  示例作者. 第5章「夜明け」[M]//星海物語. 第2卷: 123-151.
[29]  WEB NOVEL · C31  示例作者. 第31章[EB/OL]. 2026.
```

#### SETTING BOOK / ARTBOOK / GUIDEBOOK / FANBOOK

```text
[30]  SETTING BOOK  EXAMPLE PROJECT. 星海物語公式設定資料集[M]. 2026.
[31]  ARTBOOK       EXAMPLE PROJECT. 星海物語 Visual Archive[M]. 2026.
[32]  GUIDEBOOK     EXAMPLE PROJECT. Official Guidebook[M]. 2026.
[33]  FANBOOK       EXAMPLE PROJECT. 1st Anniversary Fanbook[M]. 2026.
```

#### DOUJIN

```text
[34]  DOUJIN · C108  示例社团. 星海研究ノート[M]. 第2版. Comic Market 108, 2026.
```

#### DIGITAL BOOKLET

```text
[35]  DIGITAL BOOKLET  EXAMPLE PROJECT. 学园数字宣传册[EB/OL]. 2026.
      Locator: p.12 / Campus Map.
```

### 四、音乐、声音与演出

#### MUSIC / ALBUM

```text
[36]  MUSIC · SINGLE  示例角色. 1st Single「光の輪郭」[A]. Example Records, 2026.
[37]  ALBUM           Example Project. Season Collection Vol.1[A]. 2026.
```

#### MUSIC · TRACK / OST

```text
[38]  MUSIC · TRACK01  示例作词者, 示例作曲者. 光の輪郭[A/OL]. 2026.
[39]  OST · D1T05      示例作曲者. Stage Theme[A]. Original Soundtrack, 2026.
```

#### DRAMA CD / AUDIO DRAMA

```text
[40]  DRAMA CD · T03  Example Project. Drama CD Vol.1 Track 03[A]. 2026.
[41]  AUDIO DRAMA · E05  Example Project. Web Audio Drama 第5回[A/OL]. 2026.
```

Locator：track + timestamp。

#### RADIO / PODCAST

```text
[42]  RADIO · E12    Example Radio Committee. 第12回[A/OL]. 2026.
[43]  PODCAST · E27  Example Studio. Production Talk #27[A/OL]. 2026.
```

#### LIVE / STAGE / MUSICAL / READING

```text
[44]  LIVE · ACT2       Example Project 2nd Live[现场演出]. 2026-12-20.
[45]  LIVE · VIDEO      Example Project 2nd Live[V/OL]. 2026. 01:22:11-01:26:44.
[46]  STAGE · ACT1      星海物語 Stage[现场演出]. 2026.
[47]  MUSICAL · ACT2    星海物語 Musical[现场演出]. 2026.
[48]  READING · SCENE4  星海朗读剧[现场演出]. 2026.
```

### 五、官方网页、新闻与社区

#### CHARACTER / SETTING / CREATOR FILE

```text
[49]  CHARACTER FILE  EXAMPLE PROJECT. 角色A[EB/OL]. Official Site, 2026.
[50]  SETTING FILE    EXAMPLE PROJECT. 世界观设定[EB/OL]. Official Site, 2026.
[51]  CREATOR FILE    EXAMPLE PROJECT. 制作团队[EB/OL]. Official Site, 2026.
```

#### INTERVIEW

```text
[52]  INTERVIEW  示例制作人. 制作访谈[EB/OL]. Example Media, 2026.
```

视频访谈可增加 timestamp。

#### NEWS / PRESS RELEASE

```text
[53]  NEWS           EXAMPLE PROJECT. 2周年更新公告[EB/OL]. 2026-08-18.
[54]  PRESS RELEASE  EXAMPLE COMPANY. New Project Announcement[R/OL]. 2026.
```

#### SOCIAL

```text
[55]  SOCIAL · X  EXAMPLE PROJECT. 官方X帖子[EB/OL]. 2026-08-18.
```

Locator：account / post ID / URL / date。

#### FAN LOCATOR / FAN STUDY / WIKI / FORUM

```text
[56]  FAN LOCATOR  示例整理者. 角色A剧情话数索引[EB/OL]. 2026.
[57]  FAN STUDY    示例作者. 关于角色A的长期成长结构[EB/OL]. 2026.
[58]  WIKI         Example Wiki. Character A[EB/OL]. Revision 2026-08-18.
[59]  FORUM · #218 Example Forum. Thread #218[EB/OL]. 2026.
```

### 六、研究文献与一般文献

ATX-ACGN-REF 可以和普通 GB/T 7714 文献共存。

#### JOURNAL / BOOK / THESIS / REPORT / STANDARD / PREPRINT

```text
[60]  作者. 论文题名[J]. 期刊, 2026, 12(3): 1-20.
[61]  作者. 图书题名[M]. 北京: 出版社, 2026.
[62]  作者. 学位论文题名[D]. 北京: 某大学, 2026.
[63]  机构. 研究报告[R/OL]. 2026.
[64]  发布机构. 标准题名[S]. 2026.
[65]  作者. 预印本题名[PP/OL]. 2026.
```

GB/T 7714-2025 已新增预印本文献类型与 `PP` 标识，AtelierTeX 直接沿用正式标准层。

### 七、数据、软件与代码

#### DATASET

```text
[66]  DATASET · CSV   Example Lab. Experiment Dataset[DS/OL]. Version 2.1, 2026.
[67]  DATASET · XLSX  Example Lab. Survey Workbook[DS/OL]. Sheet: responses, 2026.
[68]  DATASET · JSON  Example API. Metadata Snapshot[DS/OL]. 2026-08-18.
```

#### SOFTWARE / APP

```text
[69]  SOFTWARE · v3.2  Example Team. Example Toolkit[CP/OL]. Version 3.2, 2026.
[70]  APP · APK         Example Team. Example App[CP/OL]. Android build 2026.08.
```

#### REPO / RELEASE / COMMIT / ISSUE / PR

```text
[71]  REPO     Example Team. Example Repository[CP/OL]. GitHub, 2026.
[72]  RELEASE  Example Team. Example v2.0.0[CP/OL]. 2026-08-18.
[73]  COMMIT · a1b2c3d  Example Team. Fix citation renderer[CP/OL]. 2026.
[74]  ISSUE · #42       Example Repository. ACGN locator discussion[EB/OL]. 2026.
[75]  PR · #57          Example Repository. Add manga chapter support[EB/OL]. 2026.
```

#### CODE / NOTEBOOK

```text
[76]  CODE · PY       Example Author. analysis.py[CP/OL]. 2026.
[77]  NOTEBOOK · IPYNB Example Author. episode-analysis.ipynb[CP/OL]. 2026.
```

### 八、数字文件与附件

#### PDF

```text
[78]  PDF · REPORT  Example Institute. Research Report[R/OL]. 2026. Carrier: PDF.
```

PDF 也可以承载期刊论文、标准、预印本、设定集或宣传册；正式类型随被引用对象变化。

#### DOCX / DOCM

```text
[79]  DOCX · MANUSCRIPT  Example Author. Working Manuscript[未刊稿]. Version 4, 2026.
[80]  DOCM · TEMPLATE    AtelierTeX Project. ATX-ACGN Word Companion[软件文档]. 2026.
```

#### PPTX

```text
[81]  PPTX · SLIDES  Example Speaker. Cross-media Research Talk[演示文稿].
      Example Conference, 2026. Slide 18.
```

#### XLSX / CSV / JSON / YAML / XML

```text
[82]  XLSX · DATASET  Example Lab. Survey Workbook[数据集]. Sheet2!A1:H250.
[83]  CSV · DATASET   Example Lab. Episode Matrix[数据集]. Version 1.4.
[84]  JSON · API DATA Example Platform. API Snapshot[数据集]. 2026-08-18.
[85]  YAML · CONFIG   Example Project. Metadata Schema[软件文档]. Version 2.
[86]  XML · CORPUS    Example Project. Subtitle Corpus[数据集]. Version 1.
```

#### 图片文件

```text
[87]  PNG · CARD      Example Project. SSR「未完成のステージ」[图像]. Asset A001.
[88]  JPG · SCREENSHOT Example Project. Scene 18 Screenshot[图像]. Episode E08.
[89]  SVG · DIAGRAM   Example Author. Relationship Diagram[图像]. Version 3.
[90]  PSD · SOURCE ART Example Studio. Key Visual Source Asset[数字资源]. 2026.
```

#### 音频 / 视频 / 字幕

```text
[91]  FLAC · MUSIC     Example Artist. Track 01[A]. Lossless release.
[92]  MP3 · PODCAST    Example Podcast. Episode 5[A/OL]. 00:18:20-00:19:04.
[93]  MP4 · ANIME      Example Animation. Episode 3[V]. 00:12:31-00:12:46.
[94]  MKV · LIVE       Example Live Recording[V]. Act2 / Song05.
[95]  SRT · SUBTITLE   Official Subtitle File[字幕文件]. Cue 182-190.
[96]  ASS · SUBTITLE   Subtitle Script[字幕文件]. Dialogue lines 210-224.
```

#### Archive

```text
[97]  ZIP · RELEASE   Example Team. Dataset Bundle v2.1[数据包]. SHA-256: ...
[98]  7Z · ARCHIVE    Example Project. Web Archive Package[归档包]. 2026.
```

### 九、网页归档与时间性资源

#### WEB ARCHIVE

```text
[99]  WEB ARCHIVE · 2026-08-18  Example Project. Character Page[EB/OL].
      Archived snapshot, 2026-08-18.
```

#### 动态页面

```text
[100]  NEWS · LIVE PAGE  Example Project. Event Live Page[EB/OL].
       Accessed 2026-08-18 20:15 +08:00.
```

对于会持续更新的页面，访问时间、snapshot date 和 archive pointer 能显著增强可复核性。

### 十、本地资料与可复核性

参考文献负责让读者找到引用对象。研究者如需保存网页快照、媒体文件或数据副本，可在自己的资料目录中记录文件名、来源、日期、版本与校验值。

建议关联：

```text
参考文献条目标识
      ↕
Media Tag + Locator
      ↕
文件名 + 日期 + SHA-256（可选）
      ↕
作者自行管理的资料文件
```

完整扩展名反查表见 [附录 B：文件与载体矩阵](#file-matrix)。

---

<a id="file-matrix"></a>

## 附录 B：文件与载体矩阵 / File and carrier matrix

本附录作为 **ATX-ACGN-REF** 的文件/载体反查表，解决一个常见问题：研究者手里拿到的往往先是一个 `.pdf`、`.mp4`、`.png` 或 `.zip`，然后才需要判断它在参考文献里应该被视为什么对象。

### 1. 三层识别法

```text
被引用对象（intellectual / media object）
        +
文件/物理载体（carrier / file format）
        +
精确定位（locator）
```

例如：

```text
动画第3话 + MP4 + 00:12:31-00:12:46
漫画第27话 + PDF/EPUB + pp.45-66
游戏剧情第8话 + app client + STEP1/E08
官方设定集 + PDF + p.32
数据集 + CSV/XLSX + version/sheet/range
```

正式 GB/T 7714 文献类型以“被引用对象”的出版/资源身份为基础；文件扩展名主要描述载体和获取方式。

### 2. ACGN / 媒介对象总表

#### 游戏与互动媒体

| 对象 | ATX Tag | 常见载体 | 推荐 BibLaTeX 起点 | Locator |
| --- | --- | --- | --- | --- |
| 游戏本体 | `GAME` | app / PC client / console / web | `@software` | version / platform |
| 游戏剧情 | `COMM · SxEyy` | client / video archive | `@software` | STEP / episode / title |
| 主线章节 | `STORY · CHxx` | client | `@software` | chapter / section |
| 路线剧情 | `ROUTE · NAME` | VN / game client | `@software` | route / chapter / ending |
| DLC / 扩展包 | `DLC` | package / client | `@software` | DLC name / version |
| Patch / Season | `PATCH` / `SEASON` | client / release notes | `@software` / `@online` | version / date |
| 游戏活动 | `EVENT` | client / official page | `@software` / `@online` | event / episode / date |
| 卡面 | `CARD` | PNG/JPG/WebP / client | `@image` | card / rarity / asset ID |
| CG | `CG` | PNG/JPG/WebP | `@image` | scene / asset ID |
| 服装 / 3D 模型 | `COSTUME` / `3D MODEL` | client / GLTF/FBX/BLEND | `@image` / `@software` | asset / costume ID |
| 游戏内物品 / UI | `ASSET` | image / client | `@image` | asset ID / screen |

#### 动画、电影与视频

| 对象 | ATX Tag | 常见载体 | BibLaTeX 起点 | Locator |
| --- | --- | --- | --- | --- |
| 动画系列 | `ANIME` | broadcast / BD / stream | `@video` | season / series |
| 动画单集 | `ANIME · EPxx` | MP4/MKV/WebM/BD | `@video` | episode + timestamp |
| Web Anime / Short | `WEB ANIME` / `SHORT` | stream | `@video` | episode + timestamp |
| OVA / OAD | `OVA` / `OAD` | BD/DVD/stream | `@video` | episode + timestamp |
| 剧场版 | `FILM` | cinema / BD / stream | `@movie` | timestamp |
| Trailer | `TRAILER` | web video | `@video` | timestamp |
| PV / CM | `PV` / `CM` | web video | `@video` | timestamp |
| MV | `MV` | web video | `@video` | timestamp |
| 官方 Clip | `CLIP` | web video | `@video` | timestamp |
| 直播 / 配信 | `STREAM` | live archive | `@video` / `@online` | date + timestamp |
| VTuber 配信 | `VTUBER · STREAM` | live archive | `@video` / `@online` | channel / date / timestamp |

#### 漫画、小说与出版物

| 对象 | ATX Tag | 常见载体 | BibLaTeX 起点 | Locator |
| --- | --- | --- | --- | --- |
| 漫画单行本 | `MANGA · Vxx` | print / EPUB / PDF | `@book` | volume |
| 漫画单话 | `MANGA · Cxx` | magazine / web / EPUB | `@inbook` / `@article` | chapter + page |
| Web 漫画 | `WEB MANGA` | web page / image viewer | `@online` / `@inbook` | episode / page |
| 轻小说卷 | `NOVEL · Vxx` | print / EPUB / MOBI | `@book` | volume |
| 小说章节 | `NOVEL · Cxx` | book / EPUB | `@inbook` | chapter + page |
| Web Novel | `WEB NOVEL` | HTML | `@online` | chapter / update date |
| 设定集 | `SETTING BOOK` | print / PDF | `@book` | page / section |
| 画集 | `ARTBOOK` | print / PDF | `@book` | page / plate |
| 公式 Guidebook | `GUIDEBOOK` | print / PDF | `@book` | page / section |
| Fanbook | `FANBOOK` | print / PDF | `@book` | page |
| 同人志 | `DOUJIN` | print / PDF | `@book` / `@misc` | event / edition / page |
| 数字宣传册 | `DIGITAL BOOKLET` | PDF / web viewer | `@online` / `@book` | page |

#### 音乐、声音与舞台

| 对象 | ATX Tag | 常见载体 | BibLaTeX 起点 | Locator |
| --- | --- | --- | --- | --- |
| Single / Album | `MUSIC` / `ALBUM` | CD / FLAC / streaming | `@music` | catalog / release |
| 单曲目 | `MUSIC · TRACKxx` | CD / stream | `@music` | track / version |
| OST | `OST` | CD / stream | `@music` | disc / track |
| Drama CD | `DRAMA CD` | CD / audio file | `@audio` | track + timestamp |
| 广播剧 | `AUDIO DRAMA` | stream / MP3 | `@audio` | episode + timestamp |
| 广播节目 | `RADIO` | broadcast / archive | `@audio` | episode + timestamp |
| Podcast | `PODCAST` | RSS / MP3 | `@audio` / `@online` | episode + timestamp |
| Live | `LIVE` | event / BD / stream | `@performance` | date / act / song |
| Live 录像 | `LIVE · VIDEO` | BD / MP4 / stream | `@video` | date + timestamp |
| 舞台剧 | `STAGE` | live / BD / stream | `@performance` / `@video` | act / scene / timestamp |
| Musical | `MUSICAL` | live / BD / stream | `@performance` / `@video` | act / song |
| 朗读剧 | `READING` | event / audio/video | `@performance` / `@video` | act / timestamp |

#### 官方网页与社区资料

| 对象 | ATX Tag | 常见载体 | BibLaTeX 起点 | Locator |
| --- | --- | --- | --- | --- |
| 角色档案 | `CHARACTER FILE` | HTML | `@online` | page / version |
| 世界观设定页 | `SETTING FILE` | HTML / PDF | `@online` | page / section |
| 创作者档案 | `CREATOR FILE` | HTML | `@online` | page |
| 访谈 | `INTERVIEW` | HTML / video / magazine | `@online` / `@article` / `@video` | page / timestamp |
| 官方新闻 | `NEWS` | HTML | `@online` | date / page |
| 新闻稿 | `PRESS RELEASE` | HTML / PDF | `@online` / `@report` | date / page |
| 社媒帖子 | `SOCIAL` | web post | `@online` | post URL / date |
| Wiki | `WIKI` | HTML | `@online` | revision / section |
| 玩家攻略 | `FAN LOCATOR` | HTML | `@online` | section / episode |
| 玩家长文 / Note | `FAN STUDY` | HTML | `@online` | article / section |
| Forum / Thread | `FORUM` | HTML | `@online` | thread / post ID |
| 网页归档 | `WEB ARCHIVE` | WARC / archived HTML | `@online` | snapshot date |

### 3. 数字文件格式矩阵

#### 文档与电子出版

| 扩展名 / 形式 | 先判断什么 | 常见对象身份 | 推荐记录 |
| --- | --- | --- | --- |
| `.pdf` | PDF 中的知识对象是什么 | 论文、报告、标准、书、设定集、预印本、宣传册 | 按对象身份著录 + `format=PDF` 可选 |
| `.epub` / `.mobi` / `.azw3` | 电子书身份 | 漫画、小说、设定集 | `@book/@inbook` + edition/version |
| `.docx` / `.docm` | 是否正式发布、是否只是工作稿 | 报告、稿件、官方附件、内部文档 | `@report/@unpublished/@online` 按发布状态 |
| `.pptx` / `.pptm` | 是否公开演讲/会议材料 | slides、发布会、讲座 | `@unpublished/@online` + `SLIDES` tag |
| `.txt` / `.md` | 文本来源身份 | README、transcript、source text | `@online/@software/@misc` |

#### 表格、数据与机器可读文件

| 扩展名 | 对象 | 推荐 BibLaTeX | ATX Tag / locator |
| --- | --- | --- | --- |
| `.xlsx` / `.xls` | spreadsheet / dataset | `@dataset` | `DATASET · SHEET` + sheet/range |
| `.csv` / `.tsv` | tabular dataset | `@dataset` | `DATASET · CSV` + version/rows |
| `.json` | dataset / API dump / metadata | `@dataset` / `@software` | `DATASET · JSON` / `API DATA` |
| `.yaml` / `.yml` | metadata / config / dataset | `@dataset` / `@software` | `DATASET · YAML` / `CONFIG` |
| `.xml` | metadata / corpus / feed | `@dataset` / `@online` | `DATASET · XML` |
| `.sqlite` / `.db` | database snapshot | `@dataset` | `DATABASE` + version/schema |
| `.parquet` / `.feather` | analytical dataset | `@dataset` | `DATASET` + version |

#### 图片与设计文件

| 扩展名 | 常见对象 | 推荐 BibLaTeX | ATX Tag |
| --- | --- | --- | --- |
| `.png` / `.jpg` / `.jpeg` / `.webp` / `.tiff` | screenshot、card、CG、illustration | `@image` | `CARD / CG / IMAGE / SCREENSHOT` |
| `.svg` | vector illustration / diagram | `@image` | `ILLUSTRATION / DIAGRAM` |
| `.psd` / `.clip` / `.kra` / `.ai` | source artwork / design asset | `@image` / `@software` | `SOURCE ART / DESIGN ASSET` |
| `.blend` / `.fbx` / `.gltf` / `.glb` | 3D asset/model | `@software` / `@dataset` | `3D MODEL` |

#### 音频

| 扩展名 | 常见对象 | 推荐 BibLaTeX | Locator |
| --- | --- | --- | --- |
| `.wav` / `.flac` / `.mp3` / `.m4a` / `.ogg` | song、drama、radio、podcast | `@music/@audio` | track / timestamp |
| cue sheet | CD track map | source metadata | disc / track |

#### 视频与字幕

| 扩展名 | 常见对象 | 推荐 BibLaTeX | Locator |
| --- | --- | --- | --- |
| `.mp4` / `.mkv` / `.webm` / `.mov` | anime、PV、Live、stream archive | `@video/@movie` | episode / timestamp |
| `.srt` / `.ass` / `.ssa` / `.vtt` | subtitle / caption file | underlying video + optional derived record | timestamp / cue ID |
| transcript `.txt/.json` | transcript / ASR output | derived asset / evidence | timestamp span |

#### 软件与包

| 扩展名 / 形式 | 对象 | 推荐 BibLaTeX | ATX Tag |
| --- | --- | --- | --- |
| `.apk` / `.ipa` | app release / game build | `@software` | `GAME / APP / RELEASE` |
| `.exe` / `.msi` / `.dmg` | desktop software | `@software` | `SOFTWARE / RELEASE` |
| `.zip` / `.7z` / `.rar` / `.tar.gz` | archive / release bundle | `@software/@dataset/@online` | `ARCHIVE / RELEASE` |
| Git repository | source repository | `@software` | `REPO` |
| Git release / tag | software release | `@software` | `RELEASE` |
| Git commit | exact code state | `@software` / `@online` | `COMMIT · <short SHA>` |
| Issue / PR | development discussion | `@online` | `ISSUE / PR` |
| `.py` / `.R` / `.ipynb` | source code / notebook | `@software` | `CODE / NOTEBOOK` |

### 4. 文件扩展名在文献表中的角色

ATX-ACGN-REF 建议把文件扩展名用于以下场景：

- 区分同一资源的 PDF / EPUB / HTML 版本；
- 说明下载数据的 CSV / XLSX / JSON 格式；
- 说明视觉证据来自 PNG / SVG / source art；
- 说明软件 release 的 package 类型；
- 在作者自己的文件清单中进行精确版本追踪。

参考文献表的主标识仍围绕作品/资源身份与 media tag 展开。

### 5. Word / LaTeX 共用字段

未来 Word Companion 与 LaTeX 版本共同使用以下抽象字段：

```text
id
title
creator
organization
date
media_tag
object_type
carrier_format
locator
url
accessed_at
version
language
rights
verification
```

LaTeX 通过 BibLaTeX 映射这些字段；Word `.dotm/.docm` 通过内容控件 / VBA / custom XML 映射同一字段。

### 6. 文件层引用检查

面对任意一个文件，按以下顺序识别：

1. 它代表的作品/资源是什么？
2. 这是原始作品、官方副文本、研究文献、数据还是派生文件？
3. 它的物理/数字载体是什么？
4. 最小可复核 locator 是什么？
5. 是否存在更正式的发布日期、版本、责任者、DOI/URL？
6. 是否需要记录本地文件名、保存日期或校验值？

这套步骤适用于 ACGN 研究，也适用于一般数字人文与跨媒介研究。
