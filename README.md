# 🚀 Nvim Pioneer

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/Platform-Win%20|%20Linux%20|%20Mac-lightgrey?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

**[🇨🇳 中文文档 (Chinese Docs)](README_CN.md)**

</div>

---

**Nvim Pioneer** is a modular, beginner-friendly Neovim configuration built for **performance** and **learnability**. It features zero-config LSP, persistent theme switching, and robust setup scripts.

## ✨ Core Features

| Feature | Description |
| :--- | :--- |
| 📦 **Lazy.nvim** | Fastest plugin manager in the west. |
| 🧠 **Zero-Config LSP** | Auto-installs servers for Python, Lua, C++, JS/TS, Rust, etc. |
| 🎨 **Smart Theming** | Themes (Gruvbox/TokyoNight/etc.) are **remembered** across restarts. |
| 📊 **System Monitor** | Real-time **CPU/RAM** usage in the status line. |
| 🔍 **Telescope** | Fuzzy find files, buffers, and text instantly. |
| 🛠️ **Auto Setup** | Scripts intelligently skip installed tools and fix paths. |

---

## 🛠️ Prerequisites

*   **Neovim** (v0.9+)
*   **Git** & **Nerd Font**
*   **Node.js**, **Python**, **Ripgrep**, **GCC**

### Automated Setup (One-Click)

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
    git clone https://github.com/kuku-199/nvim-pioneer.git ~/.config/nvim
    ```

3.  **Start Neovim**:
    ```bash
    nvim
    ```

---

## 🎹 Cheat Sheet

| Key | Action | Description |
| :--- | :--- | :--- |
| `<Space>` | **Leader** | The master key |
| `<Space> e` | Toggle Tree | Open file explorer |
| `<Space> ff` | Find File | Fuzzy search files |
| `<Space> th` | Theme | Switch & Save Theme |
| `<Space> tm` | Monitor | Toggle CPU/RAM Monitor |
| `gd` | Go Definition | Jump to code definition |
