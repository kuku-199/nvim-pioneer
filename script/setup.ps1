# setup.ps1 - Windows Environment Setup & Config Deploy
# 1. Checks dependencies (Neovim >= 0.9, Git, etc.)
# 2. Installs missing tools via Winget ONLY if missing or too old
# 3. Deploys config to %LOCALAPPDATA%\nvim

Write-Host "🚀 Checking System Requirements..." -ForegroundColor Cyan

function Check-Command ($cmd) {
    return [bool](Get-Command $cmd -ErrorAction SilentlyContinue)
}

function Check-NvimVersion {
    if (-not (Check-Command "nvim")) { return $false }
    $verStr = (& "nvim" --version)[0]
    if ($verStr -match "v(\d+\.\d+)") {
        $ver = [version]$matches[1]
        if ($ver -ge [version]"0.9") { 
            return $true 
        } else {
            Write-Host "⚠️  Neovim version $ver is too old (need >= 0.9)." -ForegroundColor Yellow
            return $false
        }
    }
    return $false
}

$Missing = @()

if (Check-NvimVersion) {
    Write-Host "✅ Neovim (>= 0.9) is already installed." -ForegroundColor Green
} else {
    $Missing += "Neovim.Neovim"
}

if (Check-Command git) {
    Write-Host "✅ Git is already installed." -ForegroundColor Green
} else {
    $Missing += "Git.Git"
}

if (Check-Command rg) {
    Write-Host "✅ Ripgrep is already installed." -ForegroundColor Green
} else {
    $Missing += "BurntSushi.ripgrep.MSVC"
}

if (Check-Command fd) {
    Write-Host "✅ Fd is already installed." -ForegroundColor Green
} else {
    $Missing += "sharkdp.fd"
}

if (Check-Command node) {
    Write-Host "✅ Node.js is already installed." -ForegroundColor Green
} else {
    $Missing += "OpenJS.NodeJS.LTS"
}

if ($Missing.Count -gt 0) {
    Write-Host "⬇️ Installing missing tools: $($Missing -join ', ')..." -ForegroundColor Yellow
    
    # Try Winget
    if (-not (Check-Command winget)) {
        Write-Host "❌ Winget not found. Please install dependencies manually." -ForegroundColor Red
        exit 1
    }
    
    foreach ($pkg in $Missing) {
        Write-Host "Installing $pkg..."
        winget install $pkg -e --silent --accept-source-agreements --accept-package-agreements
    }
    
    Write-Host "⚠️  Note: If tools were installed but script still fails, please RESTART your terminal to update PATH." -ForegroundColor Yellow
} else {
    Write-Host "🎉 All dependencies are satisfied!" -ForegroundColor Green
}

Write-Host "---------------------------------------------------"
Write-Host "📂 Checking Config Directory..." -ForegroundColor Cyan

# Use Join-Path to strictly avoid "Illegal characters in path" errors caused by backslashes in JS strings
$Dest = Join-Path "$env:LOCALAPPDATA" "nvim"
$ScriptDir = $PSScriptRoot
$RepoRoot = Split-Path -Parent $ScriptDir

if ($RepoRoot -eq $Dest) {
    Write-Host "✅ Already in target directory." -ForegroundColor Green
} else {
    if (Test-Path $Dest) {
        $BackupName = "nvim.bak." + (Get-Date -Format "yyyyMMdd-HHmmss")
        $BackupPath = Join-Path $env:LOCALAPPDATA $BackupName
        Write-Host "⚠️  Destination exists. Backing up to $BackupName..." -ForegroundColor Yellow
        Rename-Item -Path $Dest -NewName $BackupName
    }

    Write-Host "🚀 Copying config to $Dest..." -ForegroundColor Cyan
    # Ensure source path includes everything
    $SourcePath = Join-Path $RepoRoot "*"
    Copy-Item -Path $SourcePath -Destination $Dest -Recurse -Force
    Write-Host "✅ Copied successfully." -ForegroundColor Green
}

Write-Host "🎉 Setup Complete! Restart terminal and run 'nvim'." -ForegroundColor Green
