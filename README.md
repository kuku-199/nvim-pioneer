# 🚀 Nvim Pioneer - Neovim Configuration

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/Platform-Win%20|%20Linux%20|%20Mac-lightgrey?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

**[🇨🇳 中文文档](README_CN.md)** | **[🌏 English Docs](README.md)**

</div>

---

## 📖 Overview

**Nvim Pioneer** is a **modular, high-performance, beginner-friendly** Neovim configuration designed for modern developers. Whether you're an embedded developer, full-stack engineer, or coding beginner, you'll get a powerful editing experience out of the box.

### ✨ Core Features

| Feature | Description |
| :--- | :--- |
| 📦 **Modular Plugins** | Organized into UI, Editor, Coding, Embedded, and Tools |
| 🧠 **Zero-Config LSP** | Auto-installs servers for Python, Lua, C++, JS/TS, Rust, etc. |
| 🎨 **Smart Theming** | Themes (Gruvbox/TokyoNight/etc.) remembered across restarts |
| 🤖 **Embedded Ready** | Pre-configured DAP, CMake, Clangd for embedded development |
| ⌨️ **Common Shortcuts** | Toggle Ctrl+C/V/A support with `:ToggleShortcuts` |
| 🛠️ **Intelligent Installer** | **NEW:** Auto-detects deps, 120s countdown backup, Git preservation |
| 📝 **Markdown Enhanced** | Browser preview + In-editor rendering, supports math, flowcharts |

---

## 🎯 Quick Start

### Prerequisites

- **Neovim** >= 0.9
- **Git** (version control)
- **Node.js** (plugin dependencies)
- **Ripgrep** (file search)
- **Python 3** (LSP support)

### One-Click Installation (Recommended)

**Linux / macOS:**

```bash
git clone https://github.com/kuku-199/nvim-pioneer.git
cd nvim-pioneer
chmod +x script/setup.sh
./script/setup.sh
```

**Windows (PowerShell):**

```powershell
git clone https://github.com/kuku-199/nvim-pioneer.git
cd nvim-pioneer
powershell -ExecutionPolicy Bypass -File script/setup.ps1
```

> 💡 **Intelligent Installer Features:**
> - 🔍 Auto-detects and installs missing dependencies
> - ⏳ 120s countdown timer for conflict resolution (default: backup)
> - 🔗 Preserves Git repository for seamless `git pull` updates
> - 🛡️ Safe backup with timestamps, always recoverable

### Manual Installation

```bash
# 1. Clone to target location
git clone https://github.com/kuku-199/nvim-pioneer.git ~/.config/nvim

# 2. Start Neovim (plugins auto-install)
nvim

# 3. Wait for plugin installation on first launch
```

---

## 🎹 Keybindings

> **Full List:** [keybindings.md](keybindings.md) or press `<Space>` in Neovim to see all shortcuts

| Key | Action | Description |
| :--- | :--- | :--- |
| `<Space>` | **Leader** | Master key for all shortcuts |
| `<Space> e` | Toggle Tree | Open/close file explorer |
| `<Space> ff` | Find File | Fuzzy search files |
| `<Space> th` | Theme | Switch & save theme |
| `<Space> mp` | Markdown Preview | Preview in browser |
| `<Space> mr` | Markdown Render | Render in editor |
| `:ToggleShortcuts` | Shortcuts | Enable/Disable Ctrl+C/V/A |

---

## 🛠️ Updating

Thanks to Git preservation, updating is simple:

```bash
cd ~/.config/nvim
git pull origin main
```

Or in Neovim (coming soon):

```vim
:PioneerUpdate
```

> **Note:** If you're using an older installer (pre-v2.0), just re-run the setup script to migrate. Your old config will be backed up automatically.

---

## 🐛 Troubleshooting

### Common Issues

#### 1. Error: `module 'nvim-treesitter.configs' not found`

**Solution:**

```bash
# Method 1: Clean plugin cache
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim

# Method 2: Reinstall plugins
nvim --headless "+Lazy! sync" "+qa"
```

#### 2. Markdown preview won't open browser

**Cause:** Missing default browser or environment variables

**Solution:**

```bash
# Linux: Set default browser
xdg-settings set default-web-browser firefox.desktop

# Or manually open the preview URL (shown in command line)
```

#### 3. LSP servers won't auto-install

**Solution:**

```bash
# Manually install Mason
nvim +MasonInstall pyright +qa

# Check Mason logs
cat ~/.local/state/nvim/mason.log
```

#### 4. Slow plugin loading

**Solution:**

```bash
# Clean plugin cache
rm -rf ~/.local/share/nvim/lazy

# Restart Neovim
nvim
```

#### 5. Chinese characters garbled or display issues

**Solution:**

1. Install a [Nerd Font](https://www.nerdfonts.com/)
2. Set the Nerd Font in your terminal settings
3. Ensure system encoding is UTF-8

---

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup.

### Development Setup

```bash
# 1. Clone repository
git clone https://github.com/kuku-199/nvim-pioneer.git
cd nvim-pioneer

# 2. Install pre-commit hooks (recommended)
pip install pre-commit
pre-commit install

# 3. Start developing
# Modify files in lua/ directory
# Test changes with nvim
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<div align="center">

**🌟 Like this project? Please give it a star!**

Made with ❤️ by [kuku-199](https://github.com/kuku-199)

</div>
