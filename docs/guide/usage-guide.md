# Neovim Usage Guide

> Personal config walkthrough — how everything works
>
> Neovim 0.9+
> Updated: 2026-05-26 (vNext — noice/flash/trouble/spectre/incline/persisted)

---

## 1. What this is

A personal Neovim config. Not a framework, not a distro. Just plugins and keymaps that make sense for everyday coding.

**Core stack:**

| Feature | Plugin |
|---------|--------|
| File search | telescope.nvim |
| Autocompletion | blink.cmp (Rust, fast) |
| LSP | nvim-lspconfig + Mason |
| Syntax | nvim-treesitter |
| Lightning motion | flash.nvim (`s` to jump) |
| Diagnostics center | trouble.nvim (`<leader>xx`) |
| Global replace | nvim-spectre (`<leader>sr`) |
| Format on save | conform.nvim |
| File tree | neo-tree + oil |
| Tab bar | bufferline.nvim (with diag markers) |
| Modern cmdline | noice.nvim (floating cmdline + mini messages) |
| Window title bar | incline.nvim (filename + diags per window) |
| Animations | mini.animate (cursor trail, smooth scroll) |
| Sticky context | nvim-treesitter-context |
| Git inline | gitsigns |
| Session mgmt | persisted.nvim (auto-save/restore by git branch) |
| Theme cycling | 4 themes (gruvbox / nightfox / rose-pine / dracula) |
| Debugger | nvim-dap |
| Status bar | lualine (CPU/RAM/venv/Copilot/LSP) |
| Markdown | browser preview + inline render |

---

## 2. Modes (the one thing that's different)

Neovim has **modes**. Unlike VS Code where you're always typing, here:

| Mode | Enter with | When |
|------|-----------|------|
| **Normal** | `Esc` | Most of the time. Moving around, copying, deleting. |
| **Insert** | `i` | Typing code. |
| **Visual** | `v` | Selecting text. |
| **Command** | `:` | Running commands like `:w` to save. |

**Pro tip:** `jj` (in insert mode) → back to Normal.

---

## 3. Opening things

```bash
nvim              # blank start → sci-fi HUD dashboard
nvim .            # open directory
nvim somefile.py  # open file
```

Dashboard shows: Neovim version, plugin count, startup time, recent git commits. Press `f` to find files, `t` to cycle themes, `s` for sessions, `u` to update.

---

## 4. Finding files (Telescope)

This is the thing you'll use most. `<leader>ff` and type.

| Key | Action |
|-----|--------|
| `<leader>ff` | **Find files** |
| `<leader>fg` | **Full-text grep** |
| `<leader>fb` | **Switch open files** |
| `<leader>fr` | Recent files |
| `<leader>f;` | Git-tracked files |
| `<leader>fw` | Search word under cursor |
| `<leader>fs` | Document symbols |
| `<leader>f.` | Resume last search |

**Inside the picker:**
| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Move |
| `Enter` | Open |
| `<C-v>` / `<C-s>` | Vertical/horizontal split |
| `q` | Close |

---

## 5. Lightning motion (Flash)

vNext's biggest upgrade. Jump anywhere on screen without scrolling.

| Key | Modes | Action |
|-----|:-----:|--------|
| `s` | n/x/o | Jump to any visible char — colored labels appear, press label to go |
| `S` | n/x/o | Treesitter jump — between functions/classes/variables |
| `r` | o | Remote operation |
| `R` | o/x | Treesitter search & operate |

**Example:** cursor at top of file, want a `return` at bottom. Press `s`, then `re` (matching "return"), instant jump.

---

## 6. File tree (neo-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>E` | Reveal current file |

**Inside:** `l` open, `h` collapse, `v`/`s` split, `H` hidden files, `/` search, `?` help

---

## 7. Directory editing (oil)

Edit directories as text buffers. Rename, delete, move files like editing code.

| Key | Action |
|-----|--------|
| `<leader>o` / `-` | Open oil / parent dir |

**Inside:** Enter open, dd/yy/p delete/copy/paste, R rename, gx system open

---

## 8. Autocompletion (blink.cmp)

Pops up automatically as you type.

| Key | Action |
|-----|--------|
| `<C-Space>` | Force trigger |
| `<Tab>` / `<S-Tab>` | Next / prev |
| `Enter` | Confirm |
| `<C-b>` / `<C-f>` | Scroll docs |

Sources: LSP, buffer words, file paths.

---

## 9. LSP (code intelligence)

Auto-starts when you open a file. Supported: Python, C/C++, Rust, Go, JS/TS, Lua, HTML/CSS/JSON, Markdown.

| Key | Action |
|-----|--------|
| `gd` | **Go to definition** |
| `gr` | **Find references** |
| `K` | **Hover docs** |
| `<leader>rn` | **Rename** |
| `<leader>ca` | **Code actions** |
| `<leader>d` | Float diagnostic |
| `]d` / `[d` | Next/prev error |
| `<leader>th` | Toggle inlay hints |

---

## 10. Diagnostics Center (Trouble)

One window to see all problems.

| Key | Action |
|-----|--------|
| `<leader>xx` | Buffer diagnostics (toggle) |
| `<leader>xX` | Workspace diagnostics |
| `<leader>cs` | Document symbols |
| `<leader>cl` | LSP references |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

**Inside:** `q` close, `j`/`k` move, `o` jump+close, `P` preview

---

## 11. Treesitter (operate on code structure, not text)

### Text objects

| Key | Selects |
|-----|---------|
| `yaf` | Yank **a**ll **f**unction |
| `daf` | Delete **a**ll **f**unction |
| `cif` | Change **i**nner **f**unction |
| `yac` | Yank **a**ll **c**lass |
| `cia` | Change **i**nner **p**arameter |
| `yab` | Yank **a**ll **b**lock |

Pattern: `y`/`d`/`c` + `a`(outer)/`i`(inner) + `f`/`c`/`a`/`b`

### Jump between functions

| Key | Jump to |
|-----|---------|
| `]m` / `[m` | Next/prev function start |
| `]]` / `[[` | Next/prev class |
| `]M` / `[M` | Next/prev function end |

### Swap params and incremental selection

| Key | Action |
|-----|--------|
| `<leader>a` / `<leader>A` | Swap param next/prev |
| `<c-space>` | Expand selection (word → expr → function → class) |

---

## 12. Format on save (conform)

Auto-formats on save. Manual: `<leader>fm`

| Language | Formatter |
|----------|-----------|
| Lua | stylua |
| Python | ruff |
| C/C++ | clang-format |
| Rust | rustfmt |
| JS/TS/JSX/TSX | prettier |
| HTML/CSS/JSON/YAML | prettier |
| Markdown | prettier |
| Shell | shfmt |

---

## 13. Tab bar (bufferline)

Top of screen shows open files with diagnostics markers:

```
▎ 1 init.lua  ● ▎ 2 lsp.lua  󰅚2 ▎ 3 main.cpp  󰅖
────────────────────────────────────────────────────
```

- `▎` = active, `●` = modified, `󰅚2` = 2 errors, numbers = buffer IDs

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / prev file |
| `<leader>x` | Close current |
| `<leader>X` | Close all |
| `<leader>bC` | Close all others |
| `<leader>bp` | Pin buffer |
| `Alt+,` / `Alt+.` | Move tab left/right |

---

## 14. Theme & UI

| Key | Action |
|-----|--------|
| `<leader>th` | Cycle themes (gruvbox → nightfox → rose-pine → dracula) |

**UI enhancements (vNext):**

| Feature | Effect |
|---------|--------|
| noice.nvim | Floating rounded cmdline, mini-mode messages at bottom-right |
| dressing.nvim | Styled select/input dialogs |
| incline.nvim | Floating filename bar per window (with diag count) |
| mini.animate | Cursor trail, smooth scrolling, window open/close transitions |
| nvim-treesitter-context | Sticky parent function header at window top |

Status bar shows CPU/RAM/venv/Copilot status/LSP connections.

| Key | Action |
|-----|--------|
| `<leader>tm` | Toggle CPU/RAM monitor |
| `:ToggleEncoding` | Toggle encoding display |
| `:ToggleShortcuts` | Toggle Ctrl+C/V mode |

---

## 15. Global Search & Replace (Spectre)

Visual search & replace without leaving nvim.

| Key | Action |
|-----|--------|
| `<leader>sr` | Open spectre panel |
| `<leader>sw` | Search word under cursor (global) |
| `<leader>sp` | Search in current file |

---

## 16. Session Management (persisted.nvim)

Auto-save on exit, auto-restore on start. Scoped by git branch.

| Key | Action |
|-----|--------|
| `<leader>qs` | Save session |
| `<leader>ql` | Load session |
| `<leader>qf` | Browse all saved sessions |
| `<leader>qd` | Delete session |

---

## 17. Debugging (DAP)

Works for C/C++, Rust, Python, etc.

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

---

## 18. Floating terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |

---

## 19. CMake / Rust

| Key | Action |
|-----|--------|
| `<leader>cg` | CMake generate |
| `<leader>cb` | CMake build |
| `<leader>dr` | Rust run/debug targets |

---

## 20. Tips & tricks

### Window splits
| Key | Action |
|-----|--------|
| `<leader>sv` / `<leader>sh` | Vertical / horizontal split |
| `<leader>h/j/k/l` | Navigate splits |
| `<leader>=` | Equalize |

### Text helpers
| Key | Action |
|-----|--------|
| `<leader>nh` | Clear search highlight |
| `<C-d>` / `<C-u>` | Half-page scroll, centered |
| `n` / `N` | Next/prev search (centered) |

### Standard shortcuts (enabled by default)
`<C-c>` copy, `<C-v>` paste, `<C-a>` select all, `<C-z>` undo, `<C-s>` save.
Toggle off: `:ToggleShortcuts`

---

### Config structure

```
~/.config/nvim/
├── init.lua              ← entry point
├── CHEATSHEET.md         ← quick keymap reference
├── docs/
│   ├── README.md
│   └── guide/
│       ├── usage-guide.md          ← this file
│       ├── usage-guide_CN.md       ← 中文版
│       ├── keybindings.md          ← all keymaps
│       └── keybindings_CN.md       ← 快捷键大全
└── lua/config/
    ├── options.lua       ← base settings + design tokens
    ├── keymaps.lua       ← global keymaps
    ├── lazy.lua          ← plugin loader
    ├── theme.lua         ← theme switcher
    ├── shortcuts.lua     ← Ctrl+C/V toggle
    └── plugins/
        ├── coding/       ← blink, lsp, rust
        ├── editor/       ← flash, treesitter, treesitter-context, gitsigns, ...
        ├── embedded/     ← clangd, cmake, dap
        ├── tools/        ← telescope, trouble, spectre, persistence, terminal, ...
        └── ui/           ← lualine, noice, dressing, incline, bufferline, animate, ...
```
