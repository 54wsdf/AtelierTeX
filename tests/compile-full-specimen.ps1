[CmdletBinding()]
param(
    [ValidateSet('xelatex', 'lualatex', 'both')]
    [string]$Engine = 'xelatex'
)

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot

# 防退化说明：README 渲染同样属于公开发布面，必须在编译前执行内容边界检查。
& pwsh (Join-Path $PSScriptRoot 'verify-boundary.ps1')
if ($LASTEXITCODE -ne 0) { throw 'Public boundary verification failed.' }

$specimens = @(
    [pscustomobject]@{ Name = 'feature'; Source = 'examples/full-specimen/main.tex'; Output = 'full-specimen' },
    [pscustomobject]@{ Name = 'symposium'; Source = 'examples/full-specimen-symposium/main.tex'; Output = 'full-specimen-symposium' },
    [pscustomobject]@{ Name = 'essay'; Source = 'examples/essay-longread-demo/main.tex'; Output = 'essay-longread-demo' }
)
$engines = if ($Engine -eq 'both') { @('xelatex', 'lualatex') } else { @($Engine) }
$badLogPattern = 'Missing character:|Undefined control sequence|LaTeX Error:|Citation .+ undefined|There were undefined references'

Push-Location $repoRoot
try {
    foreach ($selectedEngine in $engines) {
        foreach ($specimen in $specimens) {
            $outDir = Join-Path $repoRoot "build/$selectedEngine/$($specimen.Output)"
            New-Item -ItemType Directory -Path $outDir -Force | Out-Null

            # 防退化说明：公开的每个具名排版都必须由自己的入口和输出目录强制重建；
            # 不能把任意一种 PDF 或截图登记给另一种排版。
            & latexmk "-$selectedEngine" -C "-outdir=$outDir" $specimen.Source
            if ($LASTEXITCODE -ne 0) { throw "Cleanup failed: $selectedEngine $($specimen.Name)" }

            & latexmk "-$selectedEngine" -halt-on-error -interaction=nonstopmode "-outdir=$outDir" $specimen.Source
            if ($LASTEXITCODE -ne 0) { throw "Compilation failed: $selectedEngine $($specimen.Name)" }

            $pdf = Join-Path $outDir 'main.pdf'
            $log = Join-Path $outDir 'main.log'
            if (-not (Test-Path $pdf)) { throw "Expected PDF was not produced: $pdf" }
            if (Select-String -Path $log -Pattern $badLogPattern -Quiet) {
                throw "Log QA failed: $selectedEngine $($specimen.Name)"
            }

            $size = (Get-Item $pdf).Length
            if ($size -lt 50000) {
                throw "PDF is unexpectedly small ($size bytes); treat as a release artifact failure"
            }

            Write-Host "[OK] $selectedEngine $($specimen.Name): $size bytes"
        }
    }
}
finally {
    Pop-Location
}
