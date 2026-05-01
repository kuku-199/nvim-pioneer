# 🎹 Keybindings Cheat Sheet

> **Quick Reference Guide** for Nvim Pioneer shortcuts.  
> 💡 **Tip:** Press `<Space>` in Neovim to see an interactive list of all shortcuts.

<div align="center">

**[🇨🇳 中文版本](keybindings_CN.md)** | **[🌏 English](keybindings.md)**

</div>

---

## 📑 Table of Contents

1. [General & Windows](#-1-general--windows)
2. [Files & Terminal](#-2-files--terminal)
3. [Coding (LSP)](#-3-coding-lsp)
4. [Debugging (DAP)](#-4-debugging-dap)
5. [Standard Shortcuts Mode](#️-5-standard-shortcuts-mode)
6. [Markdown](#-6-markdown)

---

## 🪟 1. General & Windows

| Key | Command | Description |
| :--- | :--- | :--- |
| `<Space>` | Leader | **Master Key** (press first) |
| `<Space>sv` | `:vsplit` | Split Vertically (left/right) |
| `<Space>sh` | `:split` | Split Horizontally (up/down) |
| `<Space>h` | `<C-w>h` | Focus Left Window |
| `<Space>j` | `<C-w>j` | Focus Down Window |
| `<Space>k` | `<C-w>k` | Focus Up Window |
| `<Space>l` | `<C-w>l` | Focus Right Window |
| `<Space>nh` | `:nohl` | Clear Search Highlights |
| `<Space>th` | `:SwitchTheme` | Toggle & Save Theme |
| `<Space>tm` | `:ToggleMonitor` | Toggle CPU/RAM Status Bar |
| `jj` | `<Esc>` | Exit Insert Mode (fast way) |

---

## 📂 2. Files & Terminal

| Key | Command | Description |
| :--- | :--- | :--- |
| `<Space>e` | `:NvimTreeToggle` | Toggle File Explorer |
| `<Space>ff` | `Telescope files` | Fuzzy Find Files |
| `<Space>fg` | `Telescope grep` | Search Text in Files (Grep) |
| `<Space>fb` | `Telescope buffers` | Find Open Buffers |
| `<C-\\>` | `:ToggleTerm` | Toggle Floating Terminal |
| `<Tab>` | BufferNext | Next Buffer/Tab |
| `<S-Tab>` | BufferPrev | Previous Buffer/Tab |
| `<Space>x` | `:bdelete` | Close Current Buffer |

---

## 🧠 3. Coding (LSP)

> ⚡ **Note:** These shortcuts only work when a Language Server is active (e.g., editing `.py`, `.lua`, `.rs` files).

| Key | Command | Description |
| :--- | :--- | :--- |
| `gd` | `vim.lsp.buf.definition` | **Go to Definition** |
| `K` | `vim.lsp.buf.hover` | **Show Documentation / Hover** |
| `gr` | `vim.lsp.buf.references` | Find References |
| `<Space>rn` | `vim.lsp.buf.rename` | Rename Symbol |
| `<Space>ca` | `vim.lsp.buf.code_action` | Code Action / Quick Fix |

### 🦀 Rust Specific (Rustaceanvim)

| Key | Command | Description |
| :--- | :--- | :--- |
| `<Space>ca` | `RustLsp('codeAction')` | Rust Code Action |
| `K` | `RustLsp({'hover', 'actions'})` | Rust Hover Actions |
| `<Space>dr` | `RustLsp('debuggables')` | Debug Rust Target |

---

## 🐞 4. Debugging (DAP)

> 🔧 **Note:** Debugging requires DAP configuration for your language.

| Key | Action | Description |
| :--- | :--- | :--- |
| `<F5>` | Continue | Start/Continue Debugging |
| `<F10>` | Step Over | Step Over (skip function) |
| `<F11>` | Step Into | Step Into (enter function) |
| `<F12>` | Step Out | Step Out (exit function) |
| `<Space>b` | Breakpoint | Toggle Breakpoint |

---

## 🎛️ 5. Standard Shortcuts Mode

> ⚙️ Toggle with command: `:ToggleShortcuts`  
> This mode enables familiar IDE-like shortcuts.

| Key | Action | Context |
| :--- | :--- | :--- |
| `Ctrl + C` | Copy | Visual Mode Only |
| `Ctrl + V` | Paste | Insert/Command Mode |
| `Ctrl + A` | Select All | All Modes |
| `Ctrl + S` | Save File | Normal Mode |
| `Ctrl + Z` | Undo | Normal Mode |

---

## 📝 6. Markdown

| Key | Command | Description |
| :--- | :--- | :--- |
| `<Space>mp` | `MarkdownPreviewToggle` | Toggle Browser Preview |
| `<Space>mr` | `RenderMarkdown toggle` | Toggle In-Editor Rendering |

---

<div align="center">

**💡 Pro Tip:** Use `:WhichKey` or press `<Space>` and wait to see an interactive popup of all available shortcuts!

</div>
