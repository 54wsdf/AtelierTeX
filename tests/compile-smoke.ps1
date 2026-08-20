[CmdletBinding()]
param(
    [ValidateSet('xelatex', 'lualatex', 'both')]
    [string]$Engine = 'both'
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot

# 防退化说明：任何编译通过都不能绕过公开边界；已撤出稿件或本地标记重新
# 出现时，测试必须先失败，不能把“可以生成 PDF”误报为可发布。
& pwsh (Join-Path $PSScriptRoot 'verify-boundary.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Public boundary verification failed.' }

$examples = @(
    'examples/gbt7714-acgn-profile/main.tex',
    'examples/acgn-research-demo/main.tex',
    'examples/multilingual-demo/main.tex',
    'examples/longform-demo/main.tex',
    'examples/narrative-demo/main.tex',
    'examples/visual-essay-demo/main.tex',
    'examples/essay-longread-demo/main.tex'
)
$engines = if ($Engine -eq 'both') { @('xelatex', 'lualatex') } else { @($Engine) }

Push-Location $repoRoot
try {
    foreach ($selectedEngine in $engines) {
        foreach ($example in $examples) {
            $exampleName = Split-Path -Leaf (Split-Path -Parent $example)
            $outDir = Join-Path $repoRoot "build/$selectedEngine/$exampleName"
            New-Item -ItemType Directory -Path $outDir -Force | Out-Null
            & latexmk "-$selectedEngine" -C "-outdir=$outDir" $example
            if ($LASTEXITCODE -ne 0) {
                throw "Cleanup failed: $selectedEngine $example"
            }
            & latexmk "-$selectedEngine" -halt-on-error -interaction=nonstopmode "-outdir=$outDir" $example
            if ($LASTEXITCODE -ne 0) {
                throw "Compilation failed: $selectedEngine $example"
            }
            $log = Join-Path $outDir 'main.log'
            # 防退化说明：LuaLaTeX 的简中可变字体若未绑定粗体，会静默把标题
            # 回退到常规字重；后续不能只检查缺字和 LaTeX error 而放过该替代。
            $badLogPattern = 'Missing character:|Undefined control sequence|LaTeX Error:|Citation .+ undefined|There were undefined references|Font shape .*/b/n.* undefined'
            if (Select-String -Path $log -Pattern $badLogPattern -Quiet) {
                throw "Log QA failed: $selectedEngine $example ($badLogPattern)"
            }
            if (-not (Test-Path (Join-Path $outDir 'main.pdf'))) {
                throw "Expected PDF was not produced: $selectedEngine $example"
            }
        }
    }
}
finally {
    Pop-Location
}
