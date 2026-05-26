# 🎹 Keybindings

> Full keybinding reference.
>
> `<leader>` = Space. E.g. `<leader>ff` = Space, then f twice.
> Updated: 2026-05-26 (vNext — noice/flash/trouble/spectre/incline/persisted)

---

## 📌 Most Used (Top 10)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<Tab>` | Next buffer |
| `<leader>e` | File tree |
| `jj` | Exit insert mode |
| `<C-s>` | Save |
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>xx` | Diagnostic panel |
| `<leader>th` | Switch theme |

---

## 🔍 Telescope

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>f;` | Git files |
| `<leader>fh` | Help tags |
| `<leader>fw` | Search word |
| `<leader>fd` | Diagnostics |
| `<leader>fs` | LSP symbols |
| `<leader>fgc` | Git commits |
| `<leader>fgb` | Git branches |
| `<leader>f.` | Resume |
| `<leader>/` | Fuzzy find in buffer |

**Telescope mappings:** `<C-j>`/`<C-k>` navigate, `<C-l>` open, `<C-v>`/`<C-s>` split, `q` close

---

## ⚡ Flash Motion

| Key | Modes | Action |
|-----|:-----:|--------|
| `s` | n/x/o | Jump to any visible char |
| `S` | n/x/o | Treesitter node jump |
| `r` | o | Remote operation |
| `R` | o/x | Treesitter search & op |

---

## 📂 File Browsing

### neo-tree

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle tree |
| `<leader>E` | Reveal current file |

**In tree:** `l` open, `h` collapse, `v`/`s` split, `H` hidden files, `P` preview, `/` search

### oil.nvim

| Key | Action |
|-----|--------|
| `<leader>o` / `-` | Open oil / parent |

**In oil:** Enter open, dd/yy/p delete/copy/paste, R rename, gx system open

---

## 🧠 LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | References |
| `gD` | Declaration |
| `K` | Hover docs |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>d` | Floating diagnostic |
| `]d` / `[d` | Next/prev error |
| `<leader>th` | Toggle inlay hints |

---

## 🪲 Trouble (Diagnostics Center)

| Key | Action |
|-----|--------|
| `<leader>xx` | Buffer diagnostics (toggle) |
| `<leader>xX` | Workspace diagnostics |
| `<leader>cs` | Document symbols |
| `<leader>cl` | LSP references |
| `<leader>xL` | Location list |
| `<leader>xQ` | Quickfix list |

---

## ✨ Completion (blink.cmp)

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger |
| `<Tab>` / `<S-Tab>` | Next / prev |
| Enter | Accept |
| `<C-b>` / `<C-f>` | Scroll docs |
| `<C-e>` | Cancel |

---

## 🌲 Treesitter

### Text Objects

| Key | Selects |
|-----|---------|
| `yaf` | Whole function |
| `daf` | Delete function |
| `cif` | Inside function |
| `yac` | Whole class |
| `cia` | Function param |
| `yab` | Code block |

### Jumps

| Key | To |
|-----|-----|
| `]m` / `[m` | Next/prev function start |
| `]]` / `[[` | Next/prev class |
| `]M` / `[M` | Next/prev function end |

### Swap params

| Key | Action |
|-----|--------|
| `<leader>a` | Swap with next param |
| `<leader>A` | Swap with prev param |

### Incremental selection

| Key | Action |
|-----|--------|
| `<c-space>` | Expand selection |
| `<c-s>` | Expand to scope |
| `<M-space>` | Shrink |

---

## 📑 Bufferline

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / prev buffer |
| `<leader>x` | Close buffer |
| `<leader>X` | Close all |
| `<leader>bC` | Close others |
| `<leader>bp` | Pin buffer |
| `Alt+,` / `Alt+.` | Move left/right |

---

## 🪟 Windows

| Key | Action |
|-----|--------|
| `<leader>sv` / `<leader>sh` | Split vertical/horizontal |
| `<leader>h` / `j` / `k` / `l` | Move to window |
| `<leader>=` | Equalize |

---

## 🎨 UI

| Key | Action |
|-----|--------|
| `<leader>th` | Cycle theme (gruvbox/nightfox/rose-pine/dracula) |
| `<leader>tm` | Toggle CPU/RAM monitor |

**UI plugins:** noice.nvim (cmdline), dressing.nvim (select/input), incline.nvim (top bar), mini.animate (cursor/scroll), nvim-treesitter-context (sticky header)

---

## 🔎 Spectre (Global Search & Replace)

| Key | Action |
|-----|--------|
| `<leader>sr` | Open spectre |
| `<leader>sw` | Search word under cursor |
| `<leader>sp` | Search in current file |

---

## 💾 Sessions (persisted.nvim)

| Key | Action |
|-----|--------|
| `<leader>qs` | Save session |
| `<leader>ql` | Load session |
| `<leader>qf` | Browse sessions |
| `<leader>qd` | Delete session |

> Auto-save on exit, auto-load on start. Scoped by git branch.

---

## 📝 Markdown

| Key | Action |
|-----|--------|
| `<leader>mp` | Browser preview |
| `<leader>mr` | In-editor render |

---

## 🐞 Debug (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

---

## 🛠️ Tools

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |
| `<leader>fm` | Format code |
| `<leader>cg` | CMake Generate |
| `<leader>cb` | CMake Build |
| `<leader>dr` | Rust run/debug |

### csvview.nvim

| Cmd | Action |
|-----|--------|
| `:CsvViewToggle` | Toggle table view |
| `:CsvViewInfo` | Show stats |

---

## 💡 General

| Key | Action |
|-----|--------|
| `i` | Insert mode |
| `jj` | Exit insert |
| `<C-s>` | Save |
| `u` / `<C-r>` | Undo/redo |
| `dd` / `yy` | Delete/copy line |
| `p` / `P` | Paste |
| `<leader>nh` | Clear search highlight |
| `<C-d>` / `<C-u>` | Half-page scroll |
| `v` / `V` / `<C-v>` | Visual (char/line/block) |

---

## 🔄 Standard Shortcuts (enabled by default)

| Key | Action |
|-----|--------|
| `<C-c>` | Copy |
| `<C-v>` | Paste |
| `<C-a>` | Select all |
| `<C-z>` | Undo |
| `<C-s>` | Save |

Disable: `:ToggleShortcuts`
