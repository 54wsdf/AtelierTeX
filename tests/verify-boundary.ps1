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

# 防退化说明：LPPL 只有在 Work 范围、维护状态和当前维护者均可定位时才具备
# 可执行的发布边界；后续新增文件不得绕过 manifest 分类，源码也不得退回仅有 SPDX 的短头。
$requiredLicenseFiles = @('LICENSE', 'LICENSE_SCOPE.md', 'manifest.txt')
foreach ($relativePath in $requiredLicenseFiles) {
    if (-not (Test-Path (Join-Path $repoRoot $relativePath))) {
        throw "Required license file is missing: $relativePath"
    }
}

$sourceFiles = Get-ChildItem -Path $repoRoot -Recurse -File | Where-Object { $_.Extension -in @('.cls', '.sty') }
$requiredSourceNotices = @(
    'Copyright 2026 54wsdf',
    'SPDX-License-Identifier: LPPL-1.3c',
    'LPPL maintenance status `maintained`',
    'Current Maintainer of this work is 54wsdf',
    'files listed in manifest.txt'
)
foreach ($sourceFile in $sourceFiles) {
    $sourceText = Get-Content -Raw -LiteralPath $sourceFile.FullName
    foreach ($notice in $requiredSourceNotices) {
        if (-not $sourceText.Contains($notice)) {
            throw "LPPL source notice is incomplete: $($sourceFile.FullName) ($notice)"
        }
    }
}

$manifestEntries = @(Get-Content -LiteralPath (Join-Path $repoRoot 'manifest.txt') | Where-Object {
    $_ -and -not $_.StartsWith('#')
})
$trackedWork = @(& git -C $repoRoot ls-files --cached --others --exclude-standard | Where-Object {
    $_ -notin @('.gitignore', 'LICENSE')
})
$missingFromManifest = @($trackedWork | Where-Object { $_ -notin $manifestEntries })
$staleManifestEntries = @($manifestEntries | Where-Object { $_ -notin $trackedWork })
if ($missingFromManifest.Count -gt 0 -or $staleManifestEntries.Count -gt 0) {
    if ($missingFromManifest.Count -gt 0) { Write-Error "Unclassified files: $($missingFromManifest -join ', ')" }
    if ($staleManifestEntries.Count -gt 0) { Write-Error "Stale manifest entries: $($staleManifestEntries -join ', ')" }
    throw 'LPPL manifest does not match the repository Work.'
}

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
