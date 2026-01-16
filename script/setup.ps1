# setup.ps1 - Windows Environment Setup
# Installs Neovim, Git, Node, Python via Winget

Write-Host "🚀 Starting Nvim Pioneer Environment Setup for Windows..." -ForegroundColor Cyan

# Check for Winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Winget not found. Please update App Installer from Microsoft Store." -ForegroundColor Red
    exit
}

# Install Core Tools
Write-Host "📦 Installing Neovim..." -ForegroundColor Yellow
winget install Neovim.Neovim -e --silent --accept-source-agreements --accept-package-agreements

Write-Host "📦 Installing Git..." -ForegroundColor Yellow
winget install Git.Git -e --silent --accept-source-agreements --accept-package-agreements

# Install Search Tools (Ripgrep, Fd)
Write-Host "📦 Installing Ripgrep & Fd..." -ForegroundColor Yellow
winget install BurntSushi.ripgrep.MSVC -e --silent --accept-source-agreements --accept-package-agreements
winget install sharkdp.fd -e --silent --accept-source-agreements --accept-package-agreements

# Install Runtimes (Node, Python)
Write-Host "📦 Installing Node.js (LTS)..." -ForegroundColor Yellow
winget install OpenJS.NodeJS.LTS -e --silent --accept-source-agreements --accept-package-agreements

Write-Host "📦 Installing Python 3..." -ForegroundColor Yellow
winget install Python.Python.3 -e --silent --accept-source-agreements --accept-package-agreements

Write-Host "✅ Setup Complete! Please restart your Terminal." -ForegroundColor Green
