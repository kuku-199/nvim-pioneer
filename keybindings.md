# 🎹 Keybindings Cheat Sheet

This document lists all the shortcuts configured in **Nvim Pioneer**.

## 🪟 1. General & Windows

| Key | Command | Description |
| :--- | :--- | :--- |
| `<Space>` | Leader | **Master Key** |
| `<Space>sv` | `:vsplit` | Split Vertically |
| `<Space>sh` | `:split` | Split Horizontally |
| `<Space>h` | `<C-w>h` | Focus Left Window |
| `<Space>j` | `<C-w>j` | Focus Down Window |
| `<Space>k` | `<C-w>k` | Focus Up Window |
| `<Space>l` | `<C-w>l` | Focus Right Window |
| `<Space>nh` | `:nohl` | Clear Search Highlights |
| `<Space>th` | `:SwitchTheme` | Toggle & Save Theme |
| `<Space>tm` | `:ToggleMonitor`| Toggle CPU/RAM status |
| `jj` | `<Esc>` | Exit Insert Mode |

## 📂 2. Files & Terminal

| Key | Command | Description |
| :--- | :--- | :--- |
| `<Space>e` | `:NvimTreeToggle` | Toggle Explorer |
| `<Space>ff` | `Telescope files` | Fuzzy Find Files |
| `<Space>fg` | `Telescope grep` | Search Text (Grep) |
| `<Space>fb` | `Telescope buffers`| Find Open Buffers |
| `<C-\>` | `:ToggleTerm` | Toggle Floating Terminal |
| `<Tab>` | BufferNext | Next Tab |
| `<S-Tab>` | BufferPrev | Prev Tab |
| `<Space>x` | `:bdelete` | Close Current Buffer |

## 🧠 3. Coding (LSP)

*These shortcuts only work when a Language Server is active.*

| Key | Command | Description |
| :--- | :--- | :--- |
| `gd` | `vim.lsp.buf.definition` | **Go to Definition** |
| `K` | `vim.lsp.buf.hover` | **Show Documentation** |
| `gr` | `vim.lsp.buf.references` | Find References |
| `<Space>rn` | `vim.lsp.buf.rename` | Rename Symbol |
| `<Space>ca` | `vim.lsp.buf.code_action` | Code Action |

## 🐞 4. Debugging (DAP)

| Key | Action | Description |
| :--- | :--- | :--- |
| `<F5>` | Continue | Start/Continue Debugging |
| `<F10>` | Step Over | Step Over |
| `<F11>` | Step Into | Step Into |
| `<F12>` | Step Out | Step Out |
| `<Space>b` | Breakpoint | Toggle Breakpoint |

## 🎛️ 5. Standard Shortcuts Mode

Toggle with command: `:ToggleShortcuts`

| Key | Action |
| :--- | :--- |
| `Ctrl + C` | Copy (Visual Mode Only) |
| `Ctrl + V` | Paste (Insert/Command Mode) |
| `Ctrl + A` | Select All |
| `Ctrl + S` | Save File |
| `Ctrl + Z` | Undo |
