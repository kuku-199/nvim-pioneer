#!/bin/bash
set -e

# setup.sh - Environment Setup & Config Deploy
# 1. Checks dependencies (Neovim >= 0.9, Git, etc.)
# 2. Installs missing tools
# 3. Deploys config to ~/.config/nvim

DEST_DIR="$HOME/.config/nvim"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🚀 Starting Nvim Pioneer Setup..."

# Helper: Check command existence
has_cmd() { command -v "$1" >/dev/null 2>&1; }

# Helper: Check Neovim version >= 0.9.0
# Returns 0 if good, 1 if missing or old
check_nvim_ver() {
    if ! has_cmd nvim; then return 1; fi
    # Simple check for version string
    local ver=$(nvim --version | head -n1 | grep -oE 'v[0-9]+.[0-9]+' | tr -d 'v')
    local major=$(echo "$ver" | cut -d. -f1)
    local minor=$(echo "$ver" | cut -d. -f2)
    
    # Logic: Major > 0 OR (Major=0 AND Minor>=9)
    if [ "$major" -gt 0 ] || ([ "$major" -eq 0 ] && [ "$minor" -ge 9 ]); then
        return 0
    else
        echo "⚠️  Found nvim v$ver, but need >= 0.9.0"
        return 1
    fi
}

install_deps() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$ID
    else
        OS=$(uname)
    fi

    echo "📦 Detected OS: $OS"
    MISSING=""

    if [ "$OS" = "arch" ] || [ "$OS" = "manjaro" ]; then
        if ! check_nvim_ver; then MISSING="$MISSING neovim"; fi
        if ! has_cmd git; then MISSING="$MISSING git"; fi
        if ! has_cmd rg; then MISSING="$MISSING ripgrep"; fi
        if ! has_cmd npm; then MISSING="$MISSING nodejs npm"; fi
        if ! has_cmd pip; then MISSING="$MISSING python-pip"; fi
        
        if [ -n "$MISSING" ]; then
            echo "⬇️  Installing missing: $MISSING"
            sudo pacman -Sy --noconfirm $MISSING base-devel unzip
        else
            echo "✅ All dependencies satisfied (Neovim >= 0.9 detected)."
        fi

    elif [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ] || [ "$OS" = "pop" ]; then
        if ! check_nvim_ver; then 
            echo "⚠️  Note: Apt/Debian often has old Neovim. If apt install fails to give v0.9+, use the AppImage guide."
            MISSING="$MISSING neovim" 
        fi
        if ! has_cmd git; then MISSING="$MISSING git"; fi
        if ! has_cmd rg; then MISSING="$MISSING ripgrep"; fi
        if ! has_cmd npm; then MISSING="$MISSING nodejs npm"; fi
        
        if [ -n "$MISSING" ]; then
             echo "⬇️  Installing missing: $MISSING"
             sudo apt update && sudo apt install -y $MISSING build-essential unzip python3-pip
        else
             echo "✅ All dependencies satisfied."
        fi
    elif [ "$(uname)" = "Darwin" ]; then
         if ! has_cmd brew; then echo "❌ Homebrew required."; exit 1; fi
         if ! check_nvim_ver; then brew install neovim; fi
         if ! has_cmd git; then brew install git; fi
         if ! has_cmd rg; then brew install ripgrep; fi
         if ! has_cmd node; then brew install node; fi
    else
        echo "⚠️  Manual installation required for your OS."
    fi
}

install_deps

echo "---------------------------------------------------"
echo "📂 Checking Configuration Directory..."

if [ "$REPO_ROOT" = "$DEST_DIR" ]; then
    echo "✅ Scripts are running from the target directory ($DEST_DIR)."
else
    if [ -d "$DEST_DIR" ]; then
        echo "⚠️  Destination exists: $DEST_DIR"
        echo "❌ Cannot overwrite automatically. To finish setup, please run:"
        echo "   1. Backup: mv $DEST_DIR ${DEST_DIR}.bak"
        echo "   2. Move:   mv $REPO_ROOT $DEST_DIR"
    else
        echo "🚀 Moving configuration to $DEST_DIR..."
        mkdir -p "$(dirname "$DEST_DIR")"
        cp -r "$REPO_ROOT" "$DEST_DIR"
        echo "✅ Moved successfully."
    fi
fi

echo "🎉 Setup Complete! Run 'nvim' to start."
