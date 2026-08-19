# ACGN 参考文献体系

AtelierTeX 将 ACGN / 二次元 / 跨媒介引用分成三个清晰层次：

1. **规范层**：ATX-ACGN-REF，规定最终参考文献如何识别媒体、如何给 locator、如何和 GB/T 7714-2025 结合；
2. **渲染层**：AtelierTeX 默认 bibliography renderer，将 media tag 直接呈现在参考文献表中；
3. **实现层**：BibLaTeX 字段映射、宏、兼容代码与测试。

可编译的规范样张见 [`examples/gbt7714-acgn-profile/`](../examples/gbt7714-acgn-profile/)；其中 `.bib`、正文引用与 bibliography 输出使用同一套真实构建链。

## 规范层

完整规范：

**[`ATX-ACGN-REF 0.4 — AtelierTeX ACGN 引用扩展规范`](ATX-ACGN-REF.md)**

当前基础著录标准为 **GB/T 7714-2025**。扩展层增加：

```text
GAME / COMM / ROUTE / EVENT / CARD / CG
ANIME / OVA / FILM / PV / MV / STREAM
MANGA / NOVEL / VN
MUSIC / DRAMA CD / LIVE
CHARACTER FILE / SETTING FILE / CREATOR FILE
INTERVIEW / SOCIAL / FAN LOCATOR / FAN STUDY / DATASET
```

以及：

```text
STEP / episode / route
chapter / page
track / timestamp
live date / act / song
card / asset ID
```

## 渲染层

默认渲染结构：

```text
[顺序号]  MEDIA TAG  GB/T 7714-2025 正式文献项  + locator
```

例如：

```text
[12]  COMM · S1E08    Example Studio. 角色A 剧情 STEP1 第8话[CP/OL]. ...
[18]  ANIME · EP03    制作委员会. 第3话[V/OL]. ... 00:12:31-00:12:46.
[23]  MANGA · V03C27  示例作者. 第27话[M]//作品名. 第3卷: 45-66.
```

AtelierTeX 默认使用浅灰 media tag；具体 publication profile 可以继续调整标签视觉。

## 使用入口

```latex
\AtelierUseACGNBibliography
```

AtelierTeX 0.3 默认采用：

```text
GB/T 7714-2025
biber
media index
```

需要维护 2015 版既有工程时可使用：

```latex
\AtelierUseACGNBibliography2015
```

## 独立演示

完整渲染演示位于：

[`examples/gbt7714-acgn-profile/`](../examples/gbt7714-acgn-profile/)

它单独展示 GAME、COMM、ANIME、MANGA、MUSIC、LIVE、FAN LOCATOR 等类型，不承担长篇正文演示任务。

## 实现说明

BibLaTeX entry type、`verba` 字段、renderer 宏与兼容细节集中在：

[`development/BIBLIOGRAPHY_IMPLEMENTATION.md`](development/BIBLIOGRAPHY_IMPLEMENTATION.md)

## 项目与规范署名

本引用扩展由 **AtelierTeX 项目 / 54wsdf** 提出并维护。

项目定位见 [`../PROJECT.md`](../PROJECT.md)，GitHub 引用元数据见 [`../CITATION.cff`](../CITATION.cff)。
