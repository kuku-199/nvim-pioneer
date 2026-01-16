#!/bin/bash

# setup.sh - Environment Setup for Nvim Pioneer
# Installs Neovim, Git, Ripgrep, Node, Python, etc.

echo "🚀 Starting Nvim Pioneer Environment Setup..."

# Detect OS
OS="$(uname)"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
fi

install_arch() {
    echo "📦 Detected Arch Linux. Using pacman..."
    sudo pacman -Sy --noconfirm neovim git base-devel ripgrep fd nodejs npm python python-pip unzip
}

install_debian() {
    echo "📦 Detected Debian/Ubuntu. Using apt..."
    sudo apt update
    sudo apt install -y neovim git build-essential ripgrep fd-find nodejs npm python3 python3-pip unzip
}

install_mac() {
    echo "🍎 Detected macOS. Using Homebrew..."
    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrew not found. Please install Homebrew first."
        exit 1
    fi
    brew install neovim git ripgrep fd node python
}

# Execution
if [ "$OS" == "Darwin" ]; then
    install_mac
elif [ "$DISTRO" == "arch" ] || [ "$DISTRO" == "manjaro" ]; then
    install_arch
elif [ "$DISTRO" == "ubuntu" ] || [ "$DISTRO" == "debian" ] || [ "$DISTRO" == "pop" ]; then
    install_debian
else
    echo "⚠️  Unsupported OS. Please install dependencies manually:"
    echo "   - Neovim 0.9+"
    echo "   - Git, Ripgrep, Fd"
    echo "   - Node.js & NPM (for LSPs)"
    echo "   - Python3 & Pip (for LSPs)"
    echo "   - C Compiler (gcc/clang)"
    exit 1
fi

echo "✅ Environment Setup Complete! You can now start 'nvim'."
