# 🚀 Nvim Pioneer

![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

[🇨🇳 中文文档 (Chinese Docs)](README_CN.md)

A modular, beginner-friendly Neovim configuration built for performance and learnability. Features zero-config LSP, real-time system monitoring, and cross-platform installation scripts.

---

## ✨ Features

*   📦 **Lazy.nvim** - Fastest plugin manager in the west.
*   🧠 **Zero-Config LSP** - Auto-installs servers for Python, Lua, C++, JS/TS, Rust, etc.
*   🎨 **Dynamic Theming** - Switch between Gruvbox, TokyoNight, Rose-Pine, and Dracula on the fly.
*   📊 **System Monitor** - Real-time **CPU/RAM** usage in the status line (cached for performance).
*   🔍 **Telescope** - Fuzzy find files, buffers, and text.
*   🌳 **Nvim-Tree** - Beautiful file explorer with file icons.
*   ⌨️ **Which-Key** - Visual keybinding helper so you never get lost.

---

## 🛠️ Prerequisites

Before starting, ensure your system has the base requirements. We provide scripts to automate this.

*   **Neovim** (v0.9+)
*   **Git**
*   **Node.js & NPM** (Required for many Language Servers)
*   **Python 3 & Pip** (Required for Python tooling)
*   **Ripgrep & Fd** (Required for Telescope search)
*   **GCC/Clang** (Required for Treesitter parsing)
*   **Nerd Font** (Required for icons)

### Automated Setup

**Linux / macOS:**
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

**Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File scripts/setup.ps1
```

---

## 🚀 Installation

1.  **Backup old config** (if exists):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```

2.  **Clone this repo**:
    ```bash
    git clone https://github.com/YOUR_USERNAME/nvim-pioneer.git ~/.config/nvim
    ```

3.  **Start Neovim**:
    ```bash
    nvim
    ```
    *First launch will be slow as Lazy.nvim downloads plugins. Restart once finished.*

---

## 🎹 Cheat Sheet

| Key | Action | Description |
| :--- | :--- | :--- |
| `<Space>` | **Leader** | The master key |
| `<Space> e` | Toggle Tree | Open file explorer |
| `<Space> ff` | Find File | Fuzzy search files |
| `<Space> fg` | Live Grep | Search text in project |
| `<Space> th` | Theme | Switch UI theme |
| `<Space> tm` | Monitor | Toggle CPU/RAM monitor |
| `gd` | Go Definition | Jump to code definition |
| `K` | Hover | Show documentation |
