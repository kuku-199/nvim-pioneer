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

## ⚠️ Troubleshooting (Safe Mode)

If you encounter `module 'nvim-treesitter.configs' not found`:
1. **Don't Panic.** This config uses **Safe Mode** (auto-install disabled) to prevent crash loops.
2. Run the **setup script** again and say **YES** to "Clear Cache".
3. Or manually run: `rm -rf ~/.local/share/nvim` (Linux/Mac) or delete `%LOCALAPPDATA%\nvim-data` (Windows).
4. Inside Neovim, install languages manually: `:TSInstall c`, `:TSInstall lua`.

## ✨ Core Features

| Feature | Description |
| :--- | :--- |
| 📦 **Modular Plugins** | Organized into UI, Editor, Coding, Embedded, and Tools. |
| 🧠 **Zero-Config LSP** | Auto-installs servers for Python, Lua, C++, JS/TS, Rust, etc. |
| 🎨 **Smart Theming** | Themes (Gruvbox/TokyoNight/etc.) are **remembered** across restarts. |
| 🤖 **Embedded Ready** | Pre-configured for Embedded Dev (DAP, CMake, Clangd). |
| 🪟 **Common Shortcuts** | Toggle Ctrl+C/V/Z/A shortcuts with `:ToggleShortcuts`. |
| 🛠️ **Intelligent Installer** | **NEW:** Auto-detects deps, 120s countdown backup, preserves Git for updates. |

---

## 🛠️ Prerequisites

*   **Neovim** (v0.9+)
*   **Git** & **Nerd Font**
*   **Node.js**, **Python**, **Ripgrep**, **GCC**

### Automated Setup (One-Click)

The new installer features:
- 🔍 **Auto-detection** of missing dependencies (Neovim, Git, Node.js, Ripgrep, Python)
- 📦 **Automatic installation** via apt/pacman/dnf/brew (Linux) or Winget (Windows)
- ⏳ **120s countdown timer** for conflict resolution (default: backup old config)
- 🔗 **Git preservation** for seamless updates via `git pull`

**Linux / macOS:**
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

**Windows (PowerShell):**
```powershell
powershell -ExecutionPolicy Bypass -File scripts/setup.ps1
```

> **Note:** The installer will now **move** the entire repository to `~/.config/nvim` instead of copying, preserving the Git history and enabling automatic updates.

---

## 🚀 Installation

1.  **Clone this repo**:
    ```bash
    git clone https://github.com/kuku-199/nvim-pioneer.git
    cd nvim-pioneer
    ```

2.  **Run Setup**:
    Execute the script above. It will check your environment and ask for permission before modifying any files.

3.  **Start Neovim**:
    ```bash
    nvim
    ```

---

## 🎹 Keybindings

> **Full List:** See [keybindings.md](keybindings.md) for a comprehensive table of all shortcuts.

| Key | Action | Description |
| :--- | :--- | :--- |
| `<Space>` | **Leader** | The master key |
| `<Space> e` | Toggle Tree | Open file explorer |
| `<Space> ff` | Find File | Fuzzy search files |
| `<Space> th` | Theme | Switch & Save Theme |
| `:ToggleShortcuts` | Shortcuts | Enable/Disable Ctrl+C/V/A |

---

## 🔄 Updating

Since v2.0, the installer preserves the Git repository, enabling seamless updates:

```bash
cd ~/.config/nvim
git pull origin main
```

Or run the built-in update command (coming soon):
```vim
:PioneerUpdate
```

**Note:** If you installed with the old script (before v2.0), simply re-run the installer to migrate. Your old config will be backed up automatically.
