# Neovim Usage Guide

> Personal config walkthrough — how everything works
>
> Neovim 0.9+

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
| Format on save | conform.nvim |
| File tree | neo-tree + oil |
| Tab bar | bufferline.nvim |
| Git inline | gitsigns |
| Theme cycling | 4 themes (gruvbox / nightfox / rose-pine / dracula) |
| Debugger | nvim-dap |
| Status bar | lualine (CPU/RAM live) |
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

**Pro tip:** `jk` (in insert mode) → back to Normal. No need to reach for Esc.

---

## 3. Opening things

```bash
nvim              # blank start
nvim .            # open directory → dashboard
nvim somefile.py  # open file
```

Dashboard shows up when starting with no file. Press `f` to find files, `u` to update plugins.

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

**Inside the picker:**
| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Move |
| `Enter` | Open |
| `<C-v>` | Open vertical split |
| `<C-s>` | Open horizontal split |
| `q` | Close |

---

## 5. File tree (neo-tree)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>E` | Reveal current file |

**Inside:**
| Key | Action |
|-----|--------|
| `l` / `Enter` | Open / expand |
| `h` | Collapse |
| `q` | Close |
| `v` / `s` | Split open |
| `H` | Toggle hidden files |
| `/` | Fuzzy search within tree |
| `?` | Help |

---

## 6. Directory editing (oil)

Oil lets you edit directories as text buffers. Rename, delete, move files like editing code.

| Key | Action |
|-----|--------|
| `<leader>o` | Open oil |
| `-` | Parent directory |

**Inside:**
| Key | Action |
|-----|--------|
| `Enter` | Open |
| `dd` / `yy` / `p` | Delete / copy / paste files |
| `R` | Rename |
| `g.` | Toggle hidden |

---

## 7. Autocompletion (blink.cmp)

Pops up automatically as you type.

| Key | Action |
|-----|--------|
| `<C-Space>` | Force trigger |
| `<Tab>` | Next |
| `<S-Tab>` | Previous |
| `Enter` | Confirm |
| `<C-b>` / `<C-f>` | Scroll docs |

Sources: LSP, buffer words, file paths, snippets.

---

## 8. LSP (code intelligence)

Auto-starts when you open a file. Supported languages:

Python (pyright), C/C++ (clangd), Rust (rust-analyzer), Go (gopls), JS/TS (ts_ls), Lua (lua_ls), HTML/CSS/JSON, Markdown.

| Key | Action |
|-----|--------|
| `gd` | **Go to definition** |
| `gr` | **Find references** |
| `K` | **Hover docs** (press K on any symbol) |
| `<leader>rn` | **Rename** |
| `<leader>ca` | **Code actions** (fixes, suggestions) |
| `<leader>d` | Float diagnostic |
| `]d` / `[d` | Next/prev error |
| `<leader>th` | Toggle inlay hints (type annotations) |

---

## 9. Treesitter (operate on code structure, not text)

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
| `]m` | Next function |
| `[m` | Previous function |
| `]]` | Next class |
| `[[` | Previous class |

### Swap parameters

| Key | Action |
|-----|--------|
| `<leader>a` | Swap param with next |
| `<leader>A` | Swap param with previous |

### Incremental selection

Place cursor on a symbol, press `<c-space>` repeatedly. It expands:
symbol → expression → function → class → file.

---

## 10. Format on save (conform)

Auto-formats when you save. No manual trigger needed.

Manual: `<leader>fm`

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

## 11. Tab bar (bufferline)

Top of the screen shows open files:

```
▎ init.lua  ▎ main.py  ▎  dotfiles  ▎ 󰅖
─────────────────────────────────────────────
```

| Key | Action |
|-----|--------|
| `<Tab>` | Next file |
| `<S-Tab>` | Previous file |
| `<leader>x` | Close current |
| `<leader>bC` | Close all others |
| `Alt+,` / `Alt+.` | Move tab left/right |

---

## 12. Theme

| Key | Action |
|-----|--------|
| `<leader>th` | Cycle themes |

In order: gruvbox → nightfox → rose-pine → dracula → back to gruvbox.

Your choice is saved and restored on restart.

---

## 13. CPU/RAM monitor

The right side of the status bar shows live CPU usage and RAM percentage.
- 🟢 < 50% — green
- 🟡 50-80% — yellow
- 🔴 > 80% — red

| Key | Action |
|-----|--------|
| `<leader>tm` | Toggle on/off |

---

## 14. Debugging (DAP)

Works for C/C++, Rust, Python, etc.

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

UI opens automatically on start, closes on stop.

---

## 15. Rust extras

When editing `.rs` files:

| Key | Action |
|-----|--------|
| `<leader>dr` | List debuggable targets |
| `K` | Hover with actions |

`crates.nvim` shows version hints when editing `Cargo.toml`.

---

## 16. Floating terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |

Type `exit` to close.

---

## 17. CMake

| Key | Action |
|-----|--------|
| `<leader>cg` | CMake generate |
| `<leader>cb` | CMake build |

Also generates `compile_commands.json` for clangd.

---

## 18. Tips & tricks

### Window splits
| Key | Action |
|-----|--------|
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>h/j/k/l` | Navigate splits |

### Text helpers
| Key | Action |
|-----|--------|
| `<leader>nh` | Clear search highlight |
| `<C-d>` / `<C-u>` | Half-page scroll, centered |
| `n` / `N` | Next/prev search result (centered) |

### Standard shortcuts (Ctrl+C/V, enabled by default)
| Key | Action |
|-----|--------|
| `<C-c>` | Copy (visual mode) |
| `<C-v>` | Paste |
| `<C-a>` | Select all |
| `<C-z>` | Undo |

To toggle off: `:ToggleShortcuts`

### Save/restore workspace
| Key | Action |
|-----|--------|
| `<leader>ss` | Save session |
| `<leader>sl` | Load session |

Saved as `.session.vim` in current directory.

---

### Config structure

```
~/.config/nvim/
├── init.lua              ← entry point
├── CHEATSHEET.md         ← one-page keymap reference
├── docs/
│   ├── README.md         ← doc index (you are here)
│   └── guide/
│       ├── usage-guide.md          ← this file
│       └── keybindings.md          ← all keymaps
└── lua/config/
    ├── options.lua       ← base settings
    ├── keymaps.lua       ← global keymaps
    ├── lazy.lua          ← plugin loader
    ├── theme.lua         ← theme switcher logic
    ├── shortcuts.lua     ← Ctrl+C/V toggle
    └── plugins/
        ├── coding/       ← blink, lsp, rust
        ├── editor/       ← treesitter, neo-tree, oil, conform, gitsigns, etc.
        ├── embedded/     ← clangd, cmake, dap
        ├── tools/        ← telescope, terminal, which-key
        └── ui/           ← bufferline, dashboard, indent, lualine, themes
```
