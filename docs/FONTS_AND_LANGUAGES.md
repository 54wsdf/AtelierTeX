# 字体与多语种兼容说明

AtelierTeX 的字体系统以**角色、可移植性和字符覆盖**为核心。正文只声明语言与文本角色，框架负责选择合适字体并完成回退。

## 1. 字体角色

框架维护以下角色：

- Latin Serif；
- Latin Sans；
- Monospace；
- 简体中文 Serif / Sans；
- 繁体中文；
- 日文；
- Display / 标题字体。

具体机器可以命中不同字体，角色语义保持一致。这样同一份正文可以在 Windows、TeX Live 环境和不同引擎之间迁移。

## 2. 拉丁字体链

```text
正文 Serif
EB Garamond → Libertinus Serif → TeX Gyre Pagella

Sans
Libertinus Sans → TeX Gyre Heros

Mono
Iosevka Term → TeX Gyre Cursor
```

选择优先级兼顾长文阅读、OpenType 支持与常见 TeX 环境可用性。

## 3. XeLaTeX 的 CJK 角色

XeLaTeX 使用 `xeCJK` 管理 CJK 字体与家族级 fallback。

简体中文优先使用 Noto Serif CJK SC；Windows 环境可使用宋体、微软雅黑等系统字体；TeX Live 环境可由 Fandol 与 Harano Aji 提供稳定基础覆盖。

日文单独使用 JP 角色，优先 Noto Serif CJK JP / Harano Aji Mincho。繁体中文使用独立 TC 角色。

## 4. LuaLaTeX 的 CJK 角色

LuaLaTeX 由 `ctex` 管理主 CJK 字体，并为日文建立独立 JP 角色。

```text
JP Serif
Noto Serif CJK JP
    ↓
Harano Aji Mincho
    ↓
可用系统 CJK 字体
    ↓
FandolSong
```

这一顺序兼顾日文字形覆盖与 TeX Live 可复现性。

## 5. CJK / Japanese 字形兼容语料

跨媒介研究经常出现日文标点、旧字、异体字和姓名字形。AtelierTeX 维护一组跨项目兼容种子，例如：

```text
・ 々 〆 〇 〜 ヵ ヶ
広 廣 澤 篠
髙 﨑 邊 邉 瀨 瀬
凛 凜 辻 榊 神 福 塚
```

公共兼容语料按真实缺字案例逐步扩展。适合进入公共种子的字符通常具备以下特点：

1. 已在真实项目中触发缺字；
2. 在姓名、地名、历史文本、书目或日文资料中具有复用价值；
3. 字体族级 fallback 仍存在不稳定表现；
4. 双引擎测试后字符复制、搜索与 PDF 提取保持正常。

## 6. 扩展 API

下游项目可以登记额外字形：

```latex
\AtelierDeclareJPCharFallback{髙}{9AD9}
```

多个无关项目反复使用的字符可以提升到 AtelierTeX 公共兼容语料。

当同一 Unicode 汉字在简中与日文语境中都存在、而公共逐字符 fallback 会把它
固定到错误语种时，使用语种字形接口显式选择字体角色：

```latex
\AtelierSCGlyph{7BE0} % 简中字形
\AtelierTCGlyph{7BE0} % 繁中字形
\AtelierJPGlyph{7BE0} % 日文字形
```

参数使用 Unicode 十六进制码位。这些接口用于解决共享汉字的语种字形选择，
不应替代正常文本输入，也不应通过手工缩放模拟另一套字体。

## 7. 简中、繁中、日文语义

同一 Unicode 汉字在简体中文、繁体中文和日文环境中可能采用不同字形习惯，因此 AtelierTeX 为三类 CJK 文本提供独立语言角色。

```latex
\begin{AtelierLanguage}{zh-Hans}
简体中文。
\end{AtelierLanguage}

\begin{AtelierLanguage}{zh-Hant}
繁體中文。
\end{AtelierLanguage}

\begin{AtelierLanguage}{ja}
日本語。
\end{AtelierLanguage}

\begin{AtelierLanguage}{en}
English.
\end{AtelierLanguage}
```

## 8. 原文与译文

语言和文本功能分别建模。一段日文可以同时具有 `ja` 语言属性和 primary-text 角色；对应中文可以同时具有 `zh-Hans` 与 translation 角色。

```latex
\begin{AtelierOriginal}
日本語の原文。
\end{AtelierOriginal}

\begin{AtelierTranslation}
对应的中文译文。
\end{AtelierTranslation}
```

Profile 根据这些语义决定字体、缩进、色阶和留白。

## 9. 缺字诊断

发布前重点检查日志：

```text
Missing character:
```

处理顺序：

1. 确认 Unicode code point；
2. 确认语言与文本角色；
3. 检查当前角色字体覆盖；
4. 优先改善字体族 fallback；
5. 少量特殊字符使用确定性映射；
6. XeLaTeX 与 LuaLaTeX 双引擎复核；
7. 检查 PDF 文本复制、搜索与 `pdftotext` 结果。

## 10. 字体资产策略

AtelierTeX 通过操作系统字体、TeX Live 字体与用户已安装字体完成解析。仓库只保存字体选择规则和 fallback 逻辑。

需要专有字体的 publication profile 可在自身授权范围内声明字体要求，并在构建文档中记录版本与安装方式。

## 11. 双引擎兼容层级

### 内容兼容

XeLaTeX 与 LuaLaTeX 共同保证：

- 正文、原文、译文完整；
- 图表和书目完整；
- 字符覆盖正确；
- 章节结构一致。

### 版面复现

逐页一致的正式出版版本需要同时锁定：

```text
Engine
TeX Live
AtelierTeX commit/tag
Publication profile commit/tag
Font environment
```

正式稿件可以指定一个出版基准引擎，同时保留另一引擎作为兼容验证。

## 12. 推荐发布记录

```text
Engine: XeLaTeX
TeX Live: 2026
AtelierTeX: <pinned SHA>
Publication profile: <pinned SHA>
Font environment: documented
```

这组信息能够定位分页、断行和字体变化的来源。
