#!/bin/bash
set -e

# setup.sh - Environment Setup & Config Deploy
# 1. Checks dependencies (Neovim >= 0.9, Git, etc.)
# 2. Installs missing tools
# 3. SAFE DEPLOY: Checks for existing config and asks user before backing up/overwriting

DEST_DIR="$HOME/.config/nvim"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🚀 Starting Nvim Pioneer Setup..."

# Helper: Check command existence
has_cmd() { command -v "$1" >/dev/null 2>&1; }

# Helper: Check Neovim version >= 0.9.0
check_nvim_ver() {
    if ! has_cmd nvim; then return 1; fi
    local ver=$(nvim --version | head -n1 | grep -oE 'v[0-9]+.[0-9]+' | tr -d 'v')
    local major=$(echo "$ver" | cut -d. -f1)
    local minor=$(echo "$ver" | cut -d. -f2)
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
            echo "✅ All dependencies satisfied."
        fi

    elif [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ] || [ "$OS" = "pop" ]; then
        if ! check_nvim_ver; then MISSING="$MISSING neovim"; fi
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
echo "📂 Processing Configuration Directory..."

if [ "$REPO_ROOT" = "$DEST_DIR" ]; then
    echo "✅ Scripts are running from the target directory ($DEST_DIR)."
else
    # 3. SAFE DEPLOY LOGIC
    if [ -d "$DEST_DIR" ]; then
        BACKUP_NAME="nvim.bak.$(date +%Y%m%d_%H%M%S)"
        
        echo " "
        echo "⚠️  WARNING: Existing configuration found at:"
        echo "   $DEST_DIR"
        echo "   (This prevents losing your current config)"
        echo " "
        echo "📋 Plan:"
        echo "   1. Rename current config to: $DEST_DIR.$BACKUP_NAME"
        echo "   2. Install new configuration"
        echo " "
        
        # Ask for confirmation
        read -p "❓ Do you want to proceed? [y/N] " -n 1 -r
        echo # move to a new line
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "📦 Backing up..."
            mv "$DEST_DIR" "$DEST_DIR.$BACKUP_NAME"
        else
            echo "❌ Operation Cancelled. No changes made."
            exit 1
        fi
    fi

    echo "🚀 Installing config to $DEST_DIR..."
    mkdir -p "$(dirname "$DEST_DIR")"
    cp -r "$REPO_ROOT" "$DEST_DIR"
    echo "✅ Installation successful."
fi

echo " "
echo "🧹 Cache Cleaning (Fix for 'treesitter' errors)"
read -p "❓ Do you want to clear Neovim plugin cache? (Recommended if you have startup errors) [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🧹 Clearing $HOME/.local/share/nvim ..."
    rm -rf "$HOME/.local/share/nvim"
    echo "✅ Cache cleared."
fi

echo "🎉 Setup Complete! Run 'nvim' to start."
