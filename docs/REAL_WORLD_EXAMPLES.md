# ATX-ACGN-REF 真实公开来源索引

本页对应 [`examples/gbt7714-acgn-profile/`](../examples/gbt7714-acgn-profile/) 的 canonical citation showcase。当前公共 `.bib` 共 42 条记录，目标是同时验证 **GB/T 7714-2025 正式著录层 + ATX Media Tag + ATX Locator**。

`FAN LOCATOR` 目前只保留一个 format-only fixture，用来验证字段结构。它不作为事实证据来源。

## A. 学園アイドルマスター / 篠澤広 / 音乐与 Live

| Media Tag | 真实对象 | 来源 |
| --- | --- | --- |
| `GAME` | 《学園アイドルマスター》游戏本体 | 学園アイドルマスター公式サイト |
| `CHARACTER FILE` | 篠澤 広官方角色档案 | 学園アイドルマスター公式サイト |
| `COMM · STEP1/EP08` | 篠澤 広亲爱度剧情 STEP1 第8话 | 游戏客户端；作品入口使用官方游戏站 |
| `PV` | 篠澤 広角色页面所载官方 PV | 学園アイドルマスター公式サイト |
| `SETTING FILE` | 初星学園デジタルパンフレット | 学園アイドルマスター公式サイト |
| `MAP · CAMPUS` | 初星学園パンフレット中的学園マップ | 学園アイドルマスター公式サイト |
| `EVENT · INTERACTIVE` | 初星学園入学試験！ | 学園アイドルマスター公式サイト |
| `MUSIC · TRACK` | 《光景》Streaming & DL | 学園アイドルマスター Label 公式サイト |
| `MUSIC · SINGLE` | 篠澤広 1st Single《光景》 | 学園アイドルマスター Label 公式サイト |
| `MV` | 官方 YouTube 连续 MV 公布，含篠澤広《光景》 | 学園アイドルマスター Label 公式サイト |
| `NEWS` | 有村麻央、紫雲清夏、篠澤広 1st Single 发布公告 | 学園アイドルマスター Label 公式サイト |
| `LIVE` | 学園アイドルマスター DEBUT LIVE 初 TOUR -初恋公演- | アイドルマスター官方 Live 页面 |
| `AUDIO FILE` | 《一体いつから》Instrumental 音源数据公开 | 学園アイドルマスター Label 公式サイト |
| `WEB MANGA · INDEX` | 学園アイドルマスター Comics 页面 | 学園アイドルマスター公式サイト |

这组示例覆盖作品本体、作品内部剧情节点、角色档案、官方副文本、数字宣传册、虚构校园地图、音乐发行、MV、新闻、演出、音频文件与 Web 漫画入口。作品内部定位使用 `STEP / Episode / track / map section` 等 Locator。

## B. 动画、漫画、轻小说与创作访谈

| Media Tag | 真实对象 | 来源 |
| --- | --- | --- |
| `ANIME · EP01` | TV动画《ウマ娘 プリティーダービー》第1R《夢のゲートっ！》 | 动画官方 Story 页面 |
| `MANGA VOL · V01` | ツガノガク《涼宮ハルヒの憂鬱》第1卷 | KADOKAWA 书目页 |
| `NOVEL VOL · V01` | 谷川流《涼宮ハルヒの憂鬱》 | KADOKAWA 书目页 |
| `INTERVIEW` | Ask the Developer Vol. 11: Super Mario Bros. Wonder | Nintendo 官方开发者访谈 |

这一组主要验证 episode、volume 与 interview 的引用方式。漫画和轻小说使用出版物正式身份，在线商品页只承担可核验元数据入口。

## C. 普通学术文献与 GB/T 类型

| Media Tag | 真实对象 | 权威来源 |
| --- | --- | --- |
| `JOURNAL` | Mnih et al., *Human-level control through deep reinforcement learning* | Nature |
| `BOOK` | Sutton & Barto, *Reinforcement Learning: An Introduction*, 2nd ed. | MIT Press |
| `CONFERENCE` | Vaswani et al., *Attention Is All You Need* | NeurIPS Proceedings |
| `THESIS` | Grant Van Horn, *Towards a Visipedia* | CaltechTHESIS |
| `REPORT` | NIST AI Risk Management Framework 1.0 | NIST |
| `STANDARD · GB/T 7714` | GB/T 7714-2025《信息与文献 参考文献著录规则》 | 全国标准信息公共服务平台 |
| `DATASET` | Iris | UCI Machine Learning Repository |
| `PATENT` | Page, *Method for node ranking in a linked database* | US6285999B1 / Google Patents |
| `NEWSPAPER` | 绮云《简单的问题指向数学的真相》 | 《中国科学报》/ 科学网 |
| `DATABASE` | dblp computer science bibliography | dblp |
| `PREPRINT` | Vaswani et al., arXiv:1706.03762 | arXiv |

`@preprint` 是 GB/T 7714-2025 对应实现中的正式演示项。旧 TeX 环境使用 2015 compatibility renderer 时，样例会保留该 BibTeX 记录但不强制打印；2025 renderer 下进入完整参考文献表。

## D. 文件格式、数据载体与软件工程对象

| Media Tag | 真实对象 | 权威来源 |
| --- | --- | --- |
| `JSON · STANDARD` | RFC 8259 | RFC Editor |
| `CSV · FORMAT` | RFC 4180 | RFC Editor |
| `YAML · SPEC` | YAML 1.2.2 | YAML Language Development Team |
| `DOCX / PPTX / XLSX` | ECMA-376 Office Open XML | Ecma International |
| `PNG · STANDARD` | PNG Specification (Third Edition) | W3C |
| `SVG · STANDARD` | SVG 2 | W3C |
| `SUBTITLE · WEBVTT` | WebVTT | W3C |
| `ARCHIVE · ZIP` | .ZIP File Format Specification | PKWARE |
| `IPYNB` | Jupyter Notebook Format | Project Jupyter |
| `RELEASE` | Python 3.14.0 | Python Software Foundation |
| `REPOSITORY` | `54wsdf/AtelierTeX` | GitHub |
| `REPOSITORY · BIBLATEX` | `hushidong/biblatex-gb7714-2025` | GitHub |

文件后缀本身不是正式文献类型。ATX 把 `.json`、`.png`、`.ipynb`、`.zip` 等信息放到 Media / Carrier Tag 与 Locator 层，GB/T 正式类型仍按标准、数据集、软件、网页、报告等对象身份确定。

## E. 正文引用形式

```latex
% 普通引用
\cite{gakumas_game}

% 作品内部定位
\cite[STEP1 / Episode 8]{hiro_commu_step1_08}

% 动画单集
\cite[Episode 1]{umamusume_anime_ep01}

% 多项来源并引
\cite{hiro_song_koukei,hiro_1st_single}
```

参考文献最终结构：

```text
[顺序号]  ATX MEDIA TAG  GB/T 7714-2025 正式著录  +  ATX LOCATOR
```

## F. 目录与书目库的边界

本页只索引 canonical bibliography 已收录的公开记录。其他 Media Tag 的字段结构与最终输出形态见 [`ATX-ACGN-REF.md` 的对象级渲染目录](ATX-ACGN-REF.md#object-catalog)；条目进入 canonical bibliography 后，再在本页增加对应索引。
