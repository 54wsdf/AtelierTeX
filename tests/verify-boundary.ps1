[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$forbiddenTerms = @(
    ('PRIVATE-MANUSCRIPT-' + 'TITLE'),
    ('INTERNAL-' + 'ORGANIZATION'),
    ('2099.' + '12.31'),
    ('LOCAL-WORKSPACE-' + 'ONLY'),
    ('努' + '时代'),
    ('nu-' + 'era'),
    ('棉花' + '娃娃')
)
$forbidden = ($forbiddenTerms | ForEach-Object { [regex]::Escape($_) }) -join '|'

# 防退化说明：公共边界门除阻止非公开占位符和本地路径标记外，还必须阻止
# 已从本项目撤出的特定稿件残留；后续不得因其曾被用作样张而重新引入正文、标题或路径。
Push-Location $repoRoot
try {
    $commonArgs = @('-n', '-i', '--hidden', '--glob', '!build/**', '--glob', '!.git/**')
    $hits = & rg @commonArgs $forbidden .
    if ($LASTEXITCODE -eq 0) {
        $hits | Write-Error
        throw 'Public repository content boundary check failed.'
    }
    if ($LASTEXITCODE -ne 1) {
        throw "rg identity boundary scan failed with exit code $LASTEXITCODE"
    }
}
finally {
    Pop-Location
}
