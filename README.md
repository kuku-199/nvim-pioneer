# nvim config

My personal Neovim setup. Nothing fancy, just what works for me.

```bash
git clone https://github.com/thorn/nvim-config ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

## What's inside

- **blink.cmp** — autocompletion (fast, Rust)
- **nvim-lspconfig + Mason** — LSP auto-install for Python / C++ / Rust / Go / JS / Lua
- **nvim-treesitter** — syntax highlighting, text objects, incremental selection
- **conform.nvim** — format on save (stylua, ruff, prettier, clang-format, etc.)
- **telescope.nvim** — fuzzy finder with live preview
- **neo-tree + oil** — file tree + directory-as-buffer editing
- **bufferline.nvim** — tab bar at the top (like VS Code)
- **lualine** — status bar with live CPU/RAM monitor
- **gitsigns** — inline git blame
- **nvim-dap** — debugger (F5/F10/F11/F12)
- **toggleterm** — floating terminal with `<C-\>`
- **dashboard-nvim** — welcome screen
- **csvview.nvim** — CSV/TSV 表格显示、Excel 式导航、固定表头
- **which-key** — keybinding hints

### Keymaps

`<leader>` = Space. Quick reference:

| What | Key |
|------|-----|
| Find files | `<leader>ff` |
| Grep project | `<leader>fg` |
| Switch buffer | `<Tab>` |
| File tree | `<leader>e` |
| Go to definition | `gd` |
| Hover docs | `K` |
| Rename | `<leader>rn` |
| Code action | `<leader>ca` |
| Format code | `<leader>fm` |
| Toggle terminal | `<C-\>` |
| Toggle theme | `<leader>th` |

Full keybindings: see [docs/guide/keybindings.md](docs/guide/keybindings.md).  
Usage guide: [docs/guide/usage-guide.md](docs/guide/usage-guide.md).

## License

MIT — do whatever you want with it.
