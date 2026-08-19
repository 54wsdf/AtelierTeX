# ATX-ACGN-REF 实现说明

本文记录 AtelierTeX ACGN 引用扩展规范的 BibLaTeX 实现细节。规范与最终渲染见 [`../ATX-ACGN-REF.md`](../ATX-ACGN-REF.md)。

## 1. 基础样式

AtelierTeX 0.3 默认入口：

```latex
\AtelierUseACGNBibliography
```

对应：

```text
backend = biber
style = gb7714-2025
gbtype = true
sorting = none
url = true
doi = true
```

维护 GB/T 7714-2015 既有工程时使用：

```latex
\AtelierUseACGNBibliography2015
```

## 2. Media Tag 字段

公共约定使用：

```bibtex
verba = {MEDIA TAG}
```

原因是 `verba` 可以作为独立导航字段，不改变标准 BibLaTeX entry type。

典型组合：

```text
@software    + GAME / COMM / VN
@video       + ANIME / PV / MV / STREAM
@movie       + FILM
@book        + MANGA / NOVEL / DOUJIN
@inbook      + MANGA chapter / NOVEL chapter
@music       + MUSIC
@audio       + DRAMA CD
@performance + LIVE
@image       + CARD / CG
@online      + CHARACTER FILE / INTERVIEW / SOCIAL / FAN LOCATOR
@dataset     + DATASET
```

## 3. Renderer

当前默认 renderer：

```latex
\newcommand{\AtelierMediaTag}[1]{%
  \begingroup
  \setlength{\fboxsep}{1.6pt}%
  \colorbox{black!6}{\sffamily\scriptsize\strut #1}%
  \endgroup
}
```

并在每条 bibliography item 开头输出 `verba`：

```latex
\AtEveryBibitem{%
  \iffieldundef{verba}{}{\printfield{verba}\hspace{0.55em}}%
}
```

Publication Profile 可以通过 `\renewcommand{\AtelierMediaTag}` 改变标签视觉。

## 4. Locator

ATX-ACGN-REF 将 locator 分成两种：

### 稳定对象级 locator

适合进入 media tag 或题名：

```text
COMM · S1E08
ANIME · EP03
MANGA · V03C27
MUSIC · TRACK01
```

### 引用级 locator

适合 citation postnote：

```latex
\cite[00:12:31--00:12:46]{anime_ep03}
\cite[45--66]{manga_ch27}
```

## 5. GAME / COMM

```bibtex
@software{example_commu_08,
  author   = {{Example Studio}},
  title    = {角色A 亲爱度剧情 STEP1 第8话「失败的重量」},
  subtitle = {Example Game},
  year     = {2026},
  url      = {https://example.invalid/game},
  urldate  = {2026-08-18},
  verba    = {COMM · S1E08},
  langid   = {japanese}
}
```

## 6. ANIME / VIDEO

```bibtex
@video{example_anime_ep03,
  author   = {{Example Animation Committee}},
  title    = {Example Animation 第3话「未完成的舞台」},
  year     = {2026},
  verba    = {ANIME · EP03},
  langid   = {japanese}
}
```

## 7. MANGA / NOVEL

```bibtex
@inbook{example_manga_ch27,
  author    = {示例作者},
  title     = {第27话「明日仍然会来」},
  booktitle = {星海物语},
  volume    = {3},
  pages     = {45-66},
  year      = {2026},
  publisher = {Example Press},
  verba     = {MANGA · V03C27},
  langid    = {japanese}
}
```

## 8. MUSIC / LIVE

```bibtex
@music{example_song,
  author = {示例作词者 and 示例作曲者},
  title  = {光的轮廓},
  year   = {2026},
  verba  = {MUSIC · TRACK01},
  langid = {japanese}
}
```

```bibtex
@performance{example_live,
  title = {Example Project 2nd Live},
  date  = {2026-12-20},
  venue = {Example Hall},
  verba = {LIVE · ACT2}
}
```

## 9. FAN LOCATOR

```bibtex
@online{example_locator,
  author  = {示例整理者},
  title   = {角色A 剧情话数索引},
  year    = {2026},
  url     = {https://example.invalid/index},
  urldate = {2026-08-18},
  verba   = {FAN LOCATOR}
}
```

其他资料管理工具可以按需保存 `source-discovery → primary-source` 的来源关系。

## 10. 与 Publication Profile 的接口

公共层固定：

- media tag 语义；
- BibLaTeX entry type 推荐；
- locator 语法；
- GB/T 7714-2025 默认实现。

Publication Profile 调整：

- media tag 字号；
- 背景与边框；
- bibliography 字体；
- media legend；
- 条目间距；
- 分组方式。

## 11. 手工测试

独立示例：

```text
examples/gbt7714-acgn-profile/
```

测试节点：

- `gb7714-2025` 样式升级；
- media renderer 变化；
- 新增 tag；
- locator 规则变化；
- Publication Profile 消费公共实现。

测试命令与回归规则见 [`../../tests/README.md`](../../tests/README.md)。
