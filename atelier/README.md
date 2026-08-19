# `atelier/` 模块说明

`atelier/` 是 AtelierTeX 的稳定语义核心。`atelier.cls` 统一加载这些模块，作者通过公开语义接口写作。

AtelierTeX 0.2 将 ACGN / 二次元 / 跨媒介研究作为首要场景，因此游戏剧情、动画集数、漫画章节、歌曲、Live、卡面、PV 等跨项目研究语义由公共核心统一提供。

## 模块一览

| 文件 | 作用 | 典型接口 / 能力 |
| --- | --- | --- |
| `core.sty` | 文档基础设施 | 元数据、标题钩子、颜色、链接、基础间距 |
| `fonts.sty` | 字体与字符兼容 | Xe/Lua 双引擎、CJK 字体角色、fallback、`\AtelierDeclareJPCharFallback` |
| `languages.sty` | 多语种语义 | `AtelierLanguage`、`AtelierOriginal`、`AtelierTranslation` |
| `narrative.sty` | 小说式/叙事结构 | `AtelierInterlude`、`AtelierDialogue`、`AtelierEpigraph` |
| `figures.sty` | 图像接口 | 证据型图像、占位图、图注辅助 |
| `tables.sty` | 表格基础 | `booktabs`、`tabularx`、跨页长表 |
| `layout.sty` | 通用长文页面结构 | A4 页面、标题层级、页眉页脚基础 |
| `bibliography.sty` | 通用书目 + ACGN 跨媒介语义 | `\AtelierUseBibliography`、`\AtelierUseACGNBibliography`、media index |
| `qa.sty` | 草稿与核验辅助 | draft / verification 标记 |

## `bibliography.sty` 的 ACGN 职责

公共 media semantics：

```text
GAME / COMM / CARD / EVENT
ANIME / OVA / FILM
MANGA / NOVEL / VN
MUSIC / DRAMA CD / LIVE
PV / MV / STREAM
CHARACTER FILE / CREATOR FILE / INTERVIEW / SOCIAL / FAN LOCATOR
```

标准 BibLaTeX entry type 保存正式来源身份，`verba` 保存媒体标签，citation postnote 保存页码、章节、episode 与 timestamp。

中文 ACGN 研究入口：

```latex
\AtelierUseACGNBibliography
```

详细规范见 [`../docs/ACGN_BIBLIOGRAPHY.md`](../docs/ACGN_BIBLIOGRAPHY.md)。

## 模块关系

```text
atelier.cls
   ├── core
   ├── fonts
   ├── languages
   ├── narrative
   ├── figures
   ├── tables
   ├── layout
   ├── selected profile
   ├── bibliography
   └── qa
```

Profile 重设 presentation；语义模块保持作者 API 一致。publication profile 可以把 `COMM / STEP1·08`、`ANIME / EP03` 等公共标签渲染成自己的视觉系统。

## 能力归属

适合进入公共核心的能力：

- 简中 / 繁中 / 日文语言角色；
- 通用游戏 / 动画 / 漫画 / 音乐引用语义；
- 多项目复用的日文旧字 fallback；
- 通用跨页证据表；
- 叙事型研究环境；
- 通用视觉证据接口。

其他内容按使用层级分布：

| 内容 | 位置 |
| --- | --- |
| 品牌、Logo、出版物标题页 | 出版排版扩展 |
| 论文正文、图表与书目 | 作者文稿 |
| 截图、录屏、媒体与网页快照 | 作者自行管理的资料目录 |

## 作者接口稳定性

公开命令和环境属于 AtelierTeX 作者 API。长期维护优先采用：

- 新增兼容别名；
- 增加可选参数；
- 不改变作者接口的实现升级；
- 版本化的不兼容变更。

公共 API 的重大调整同步更新 CHANGELOG、说明书与示例。

## 相关文档

- [`../docs/ACGN_BIBLIOGRAPHY.md`](../docs/ACGN_BIBLIOGRAPHY.md)：ACGN 引用与 locator；
- [`../docs/USER_GUIDE.md`](../docs/USER_GUIDE.md)：作者使用说明；
- [`../docs/architecture.md`](../docs/architecture.md)：整体架构；
- [`../docs/FONTS_AND_LANGUAGES.md`](../docs/FONTS_AND_LANGUAGES.md)：字体与语言后端；
- [`../docs/DEVELOPER_GUIDE.md`](../docs/DEVELOPER_GUIDE.md)：开发维护。
