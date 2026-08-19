# AtelierTeX 开发资料

`docs/development/` 集中保存实现、QA、兼容和发布相关的工程资料。项目首页与用户说明聚焦“这个项目是什么、能做什么、最终长什么样”；开发者从这里进入实现细节。

## 当前入口

- [`DEVELOPER_GUIDE.md`](DEVELOPER_GUIDE.md)：核心模块、API、版本与下游依赖开发；
- [`BIBLIOGRAPHY_IMPLEMENTATION.md`](BIBLIOGRAPHY_IMPLEMENTATION.md)：ATX-ACGN-REF 的 BibLaTeX 实现、字段和兼容策略；
- [`../../tests/README.md`](../../tests/README.md)：手工 QA、双引擎 smoke test；
- [`../architecture.md`](../architecture.md)：整体架构；
- [`../FONTS_AND_LANGUAGES.md`](../FONTS_AND_LANGUAGES.md)：字体与多语种后端。

## 开发资料范围

这里适合放置：

- API 实现说明；
- bibliography renderer 内部规则；
- TeX engine 兼容；
- QA 与回归测试；
- 版本升级与 migration；
- 性能与分页问题；
- publication profile 开发说明。

用户可见规范、渲染示例和项目定位分别位于：

- `README.md`
- `PROJECT.md`
- `docs/ATX-ACGN-REF.md`
- `docs/assets/`
