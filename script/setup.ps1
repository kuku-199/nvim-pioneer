# setup.ps1 - Nvim Pioneer Intelligent Installer (Windows)
# Features: Auto-detect deps, Winget install, 120s countdown backup, Git preservation

$ErrorActionPreference = "Stop"
$DestDir = Join-Path $env:USERPROFILE ".config\nvim"
$ScriptDir = $PSScriptRoot
$RepoRoot = Split-Path -Parent $ScriptDir

function Log-Info($msg)    { Write-Host "💡  $msg" -ForegroundColor Cyan }
function Log-Success($msg) { Write-Host "✅  $msg" -ForegroundColor Green }
function Log-Warn($msg)    { Write-Host "⚠️  $msg" -ForegroundColor Yellow }
function Log-Error($msg)   { Write-Host "❌  $msg" -ForegroundColor Red }

function Has-Command($cmd) {
    return $null -ne (Get-Command $cmd -ErrorAction SilentlyContinue)
}

function Check-NvimVersion {
    if (-not (Has-Command "nvim")) { return $false }
    try {
        $verStr = (nvim --version)[0]
        if ($verStr -match "v(\d+)\.(\d+)") {
            $major = [int]$matches[1]; $minor = [int]$matches[2]
            return ($major -gt 0) -or ($major -eq 0 -and $minor -ge 9)
        }
        return $false
    } catch { return $false }
}

# Environment Check
Log-Info "🏥  System Environment Check..."
$MissingDeps = @()
Write-Host ""

if (-not (Has-Command "git")) { $MissingDeps += "git"; Write-Host "  ❌ git" } else { Write-Host "  ✅ git" }
if (-not (Check-NvimVersion)) { $MissingDeps += "neovim"; Write-Host "  ❌ neovim" } else { Write-Host "  ✅ neovim" }
if (-not (Has-Command "node")) { $MissingDeps += "nodejs"; Write-Host "  ❌ node" } else { Write-Host "  ✅ node" }
if (-not (Has-Command "rg")) { $MissingDeps += "ripgrep"; Write-Host "  ❌ ripgrep" } else { Write-Host "  ✅ ripgrep" }
if (-not (Has-Command "python")) { $MissingDeps += "python"; Write-Host "  ❌ python" } else { Write-Host "  ✅ python" }

Write-Host ""
if ($MissingDeps.Count -gt 0) {
    Log-Warn "⚠️  Missing: $($MissingDeps -join ', ')"
    $install = Read-Host "🔧  Auto-install via Winget? [Y/n]"
    if ($install -eq "" -or $install -eq "Y" -or $install -eq "y") {
        if (-not (Has-Command "winget")) { Log-Error "Winget not found"; exit 1 }
        Log-Info "📦  Installing..."
        foreach ($dep in $MissingDeps) {
            $pkg = switch ($dep) { "git"{"Git.Git"}; "neovim"{"Neovim.Neovim"}; "nodejs"{"OpenJS.NodeJS.LTS"}; "ripgrep"{"BurntSushi.ripgrep.MSVC"}; "python"{"Python.Python.3.12"}; default{$dep} }
            winget install --id $pkg -e --silent --accept-source-agreements --accept-package-agreements
        }
        Log-Success "✅ Installed. Restart terminal if needed."
    } else { Log-Error "Cannot proceed"; exit 1 }
} else { Log-Success "✅ All dependencies satisfied." }

# Conflict Detection
Write-Host ""
if (Test-Path $DestDir) {
    Log-Warn "⚠️  Existing config at $DestDir"
    Log-Info "Choose in 120s: [1]Backup(default) [2]Overwrite [3]Cancel"
    $choice = $null; $start = Get-Date
    while ((New-TimeSpan -Start $start -End (Get-Date)).TotalSeconds -lt 120) {
        if ([Console]::KeyAvailable) {
            $k = [Console]::ReadKey($true).KeyChar
            if ($k -eq '1'){$choice="backup";break} elseif($k -eq '2'){$choice="overwrite";break} elseif($k -eq '3'){$choice="cancel";break}
        }
        Start-Sleep -Milliseconds 500
    }
    if (-not $choice) { $choice="backup"; Write-Host "`n⏰ Timeout: Backup selected" }
    
    if ($choice -eq "backup") {
        $ts = Get-Date -Format "yyyyMMdd_HHmmss"; $bak = Join-Path $env:USERPROFILE "nvim.bak.$ts"
        Log-Info "Backing up to $bak"; Move-Item -Path $DestDir -Destination $bak -Force
    } elseif ($choice -eq "overwrite") {
        Log-Warn "Deleting old config"; Remove-Item -Path $DestDir -Recurse -Force
    } else { Log-Info "Cancelled"; exit 0 }
}

# Deploy
Log-Info "🚀  Deploying..."
if ($RepoRoot -eq $DestDir) { Log-Success "✅ Already in place." }
else {
    if (-not (Test-Path (Split-Path -Parent $DestDir))) { New-Item -ItemType Directory -Path (Split-Path -Parent $DestDir) -Force | Out-Null }
    Log-Info "📂  Moving to $DestDir..."
    Move-Item -Path $RepoRoot -Destination $DestDir -Force
    Set-Location $DestDir
    if (Test-Path ".git") {
        if (-not (git remote -v 2>$null | Select-String "kuku-199")) {
            git remote add origin https://github.com/kuku-199/nvim-pioneer.git 2>$null
        }
        Log-Success "✅ Git preserved."
    }
}
Log-Success "🎉 Complete! Run 'nvim' to start."
