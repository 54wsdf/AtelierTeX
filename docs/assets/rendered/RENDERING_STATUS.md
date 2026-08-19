# 渲染资产状态

## 2026-08-20

当前 README 展示三种标题页排版：

```text
examples/full-specimen/main.tex
  → build/xelatex/full-specimen/main.pdf
  → ateliertex-feature-page1.png

examples/full-specimen-symposium/main.tex
  → build/xelatex/full-specimen-symposium/main.pdf
  → ateliertex-symposium-page1.png

examples/essay-longread-demo/main.tex
  → build/xelatex/essay-longread-demo/main.pdf
  → ateliertex-essay-page1.png
```

三张 PNG 均采用 240 dpi、不透明 RGB A4 页面。生成脚本检查文件大小、色彩类型、A4 像素尺寸和图像完整性；标题页、刊头、作者信息、断行与留白仍需人工查看。

完整 PDF 与其他页面保存在本地 `build/` 目录，不作为 README 资产提交。
