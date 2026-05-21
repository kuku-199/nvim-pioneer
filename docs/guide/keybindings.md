# 🎹 Keybindings Reference

> Full keybindings reference for Nvim configuration
>
> `<leader>` = Space bar. E.g. `<leader>ff` = Space then f then f.

---

## 📌 Top 10 Essentials

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Full-text search |
| `<leader>fb` | Switch buffers |
| `<Tab>` | Next buffer |
| `<leader>e` | Toggle file tree |
| `jk` | Exit insert mode |
| `<C-s>` | Save |
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>th` | Switch theme |

---

## 🔍 Telescope (Fuzzy Finder)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fr` | Recent files |
| `<leader>f;` | Git files |
| `<leader>fh` | Help tags |
| `<leader>fw` | Search current word |
| `<leader>fd` | Diagnostics |
| `<leader>f.` | Resume last picker |
| `<leader>/` | Fuzzy find in current buffer |

**Inside picker:**
| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Move selection |
| `Enter` / `<C-l>` | Open |
| `<C-v>` | Vertical split |
| `<C-s>` | Horizontal split |
| `<C-t>` | New tab |
| `q` | Close |

---

## 📂 File Browsing

### neo-tree

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file tree |
| `<leader>E` | Reveal current file |

**Inside:**
| Key | Action |
|-----|--------|
| `l` / `Enter` | Open/expand |
| `h` | Collapse |
| `q` | Close |
| `v` / `s` | Split open |
| `H` | Toggle hidden |
| `/` | Fuzzy search |
| `P` | Preview |
| `?` | Help |

### oil

| Key | Action |
|-----|--------|
| `<leader>o` | Open oil |
| `-` | Parent directory |

**Inside:**
| Key | Action |
|-----|--------|
| `Enter` | Open |
| `dd` / `yy` / `p` | Delete/copy/paste file |
| `R` | Rename |
| `g.` | Toggle hidden |
| `gx` | Open externally |

---

## 🧠 LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gD` | Go to declaration |
| `K` | Hover documentation |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `]d` / `[d` | Next/prev diagnostic |
| `<leader>d` | Float diagnostic |
| `<leader>th` | Toggle inlay hints |

---

## ✨ Completion (blink.cmp)

| Key | Action |
|-----|--------|
| `<C-Space>` | Trigger completion |
| `<Tab>` | Next item |
| `<S-Tab>` | Previous item |
| `Enter` | Confirm |
| `<C-b>` / `<C-f>` | Scroll docs |

---

## 🌲 Treesitter

### Text objects

| Key | Selects |
|-----|---------|
| `yaf` / `daf` | Whole function |
| `cif` / `yif` | Function inner |
| `yac` / `dac` | Whole class |
| `cia` / `yia` | Parameter |
| `yab` / `dab` | Block |

### Navigation

| Key | Jump to |
|-----|---------|
| `]m` / `[m` | Next/prev function |
| `]f` / `[f` | Next/prev call |
| `]]` / `[[` | Next/prev class |

### Incremental selection

| Key | Action |
|-----|--------|
| `<c-space>` | Expand selection |
| `<c-s>` | Expand to scope |

---

## 📑 Bufferline

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<leader>x` | Close buffer |
| `<leader>bC` | Close others |
| `Alt+,` / `Alt+.` | Move tab left/right |

---

## 🪟 Windows

| Key | Action |
|-----|--------|
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |
| `<leader>h/j/k/l` | Navigate windows |
| `↑/↓/←/→` | Resize |

---

## 🎨 UI

| Key | Action |
|-----|--------|
| `<leader>th` | Cycle theme |
| `<leader>tm` | Toggle CPU/RAM monitor |

---

## 🐞 Debug (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Start/continue |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

---

## 🛠️ Tools

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |
| `<leader>cg` | CMake generate |
| `<leader>cb` | CMake build |
| `<leader>fm` | Format code |
| `<leader>mp` | Markdown preview |
| `<leader>mr` | Render markdown |
| `<leader>ss` | Save session |
| `<leader>sl` | Load session |
