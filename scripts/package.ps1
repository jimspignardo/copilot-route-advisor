[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$package = Join-Path $root 'package'
function Assert($condition, $message) {
    if (-not $condition) { throw $message }
}
function PackagePath([string]$relative) {
    Assert (-not [IO.Path]::IsPathRooted($relative)) "Absolute package path: $relative"
    $path = [IO.Path]::GetFullPath((Join-Path $package $relative))
    Assert ($path.StartsWith($package + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) "Path escapes package: $relative"
    Assert (Test-Path -LiteralPath $path) "Missing package path: $relative"
    return $path
}
$manifest = Get-Content (PackagePath 'manifest.json') -Raw | ConvertFrom-Json
Assert ($manifest.version -match '^\d+\.\d+\.\d+$') 'Invalid app version'
Assert ($manifest.name.short -eq 'Copilot Route Advisor') 'Unexpected app name'
Assert ($manifest.copilotAgents.declarativeAgents.Count -eq 1) 'Expected one declarative agent'
$ref = $manifest.copilotAgents.declarativeAgents[0]
$agent = Get-Content (PackagePath $ref.file) -Raw | ConvertFrom-Json
Assert ($agent.id -eq $ref.id) 'Agent ID mismatch'
Assert ($agent.name -eq $manifest.name.short) 'Agent name mismatch'
Assert (-not [string]::IsNullOrWhiteSpace($agent.instructions)) 'Missing instructions'
Assert ($agent.conversation_starters.Count -eq 4) 'Expected four conversation starters'
$readable = Get-Content (Join-Path $root 'agent/instructions.md') -Raw
Assert ($readable -ceq $agent.instructions) 'Readable instructions differ from package'
$starters = Get-Content (Join-Path $root 'agent/starter-prompts.md') -Raw
foreach ($starter in $agent.conversation_starters) {
    Assert ($starters.Contains($starter.title) -and $starters.Contains($starter.text)) 'Starter prompt documentation drift'
}
foreach ($skill in $agent.agent_skills) {
    $skillPath = PackagePath ($skill.folder + '/SKILL.md')
    $content = Get-Content $skillPath -Raw
    $folderName = Split-Path $skill.folder -Leaf
    Assert ($content -match "(?m)^name:\s*$([regex]::Escape($folderName))\s*$") 'Skill name does not match folder'
    Assert ($content.StartsWith('---')) 'Missing skill frontmatter'
}
foreach ($iconName in @($manifest.icons.color, $manifest.icons.outline)) {
    $bytes = [IO.File]::ReadAllBytes((PackagePath $iconName))
    Assert ($bytes.Length -ge 24) "Invalid PNG: $iconName"
    Assert ([Convert]::ToHexString($bytes[0..7]) -eq '89504E470D0A1A0A') "Invalid PNG signature: $iconName"
}
$docs = @((Join-Path $root 'README.md'), (Join-Path $root 'CHANGELOG.md')) +
    @(Get-ChildItem (Join-Path $root 'docs') -Filter '*.md' | ForEach-Object FullName)
foreach ($doc in $docs) {
    $content = Get-Content $doc -Raw
    foreach ($match in [regex]::Matches($content, '\]\(([^)]+)\)')) {
        $target = $match.Groups[1].Value
        if ($target -match '^(https?://|#)') { continue }
        Assert (Test-Path -LiteralPath (Join-Path (Split-Path $doc -Parent) $target)) "Broken link in $doc to $target"
    }
}
$dist = Join-Path $root 'dist'
New-Item -ItemType Directory -Path $dist -Force | Out-Null
$output = Join-Path $dist 'copilot-route-advisor.zip'
Add-Type -AssemblyName System.IO.Compression
$stream = [IO.File]::Open($output, [IO.FileMode]::Create)
$zip = [IO.Compression.ZipArchive]::new($stream, [IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($file in Get-ChildItem $package -Recurse -File) {
        $relative = [IO.Path]::GetRelativePath($package, $file.FullName).Replace('\','/')
        $entry = $zip.CreateEntry($relative)
        $destination = $entry.Open()
        try {
            $source = [IO.File]::OpenRead($file.FullName)
            try { $source.CopyTo($destination) } finally { $source.Dispose() }
        } finally { $destination.Dispose() }
    }
} finally { $zip.Dispose(); $stream.Dispose() }
Write-Host "Package structure and documentation checks passed."
Write-Host "Created $output"
Write-Host "Tenant installation, schema compatibility, and runtime behavior are not validated."
