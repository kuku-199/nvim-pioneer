# 🚀 Nvim Pioneer

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-0.9+-blueviolet.svg?style=for-the-badge&logo=neovim)
![Lua](https://img.shields.io/badge/Lua-Config-blue.svg?style=for-the-badge&logo=lua)
![Platform](https://img.shields.io/badge/Platform-Win%20|%20Linux%20|%20Mac-lightgrey?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)

**[🇨🇳 中文文档](README_CN.md)** | **[🌏 English Docs](README.md)**

</div>

---

## 📖 What is this?

**Nvim Pioneer** is my personal Neovim configuration, built for performance and learnability. It features zero-config LSP, persistent theme switching, and robust setup scripts.

Feel free to use it, fork it, or just steal parts of it!

### ✨ Core Features

| Feature | Description |
| :--- | :--- |
| 📦 **Modular Plugins** | Organized into UI, Editor, Coding, Embedded, and Tools |
| 🧠 **Zero-Config LSP** | Auto-installs servers for Python, Lua, C++, JS/TS, Rust, etc. |
| 🎨 **Smart Theming** | Themes (Gruvbox/TokyoNight/etc.) remembered across restarts |
| 🤖 **Embedded Ready** | Pre-configured DAP, CMake, Clangd for embedded development |
| 🪟 **Common Shortcuts** | Toggle Ctrl+C/V/A support with `:ToggleShortcuts` |
| 🛠️ **Smart Installer** | Auto-detects deps, 120s countdown backup, Git preservation |
| 📝 **Markdown Enhanced** | Browser preview + In-editor rendering, supports math, flowcharts |

---

## 🎯 Quick Start

### Prerequisites

- **Neovim** >= 0.9
- **Git**, **Node.js**, **Ripgrep**, **Python 3**

### One-Click Installation

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

> 💡 **Installer features:** Auto-detects dependencies, 120s countdown backup, and preserves Git for easy updates.

---

## 🎹 Keybindings

> **Full Guide:** [docs/guide/keybindings.md](docs/guide/keybindings.md) - Includes Neovim basics + all shortcuts!

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

Since the installer preserves the Git repository, updating is simple:

```bash
cd ~/.config/nvim
git pull origin main
```

---

## 🐛 Troubleshooting

### Common Issues

#### 1. Error: `module 'nvim-treesitter.configs' not found`

**Solution:**

```bash
# Clean plugin cache
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/state/nvim

# Restart Neovim
nvim
```

#### 2. Markdown preview won't open browser

**Cause:** Missing default browser or environment variables

**Solution:** Manually open the URL shown in the command line, or set default browser:
```bash
xdg-settings set default-web-browser firefox.desktop
```

#### 3. LSP servers won't auto-install

**Solution:**
```bash
# Manually install via Mason
nvim +MasonInstall pyright +qa
```

---

## 📚 Documentation

For more detailed guides, see the [docs/](docs/README.md) directory:

- **[Keybindings & Basics](docs/guide/keybindings.md)** - Complete shortcut reference + Neovim basics
- **[Installation Guides](docs/README.md)** - Detailed platform-specific steps
- **[Troubleshooting](docs/README.md)** - Common issues and solutions

---

## 📄 License

MIT License - Do whatever you want with it.

---

<div align="center">

**🌟 If this config helps you, feel free to use it!**

Built with ❤️ by [kuku-199](https://github.com/kuku-199)

</div>
