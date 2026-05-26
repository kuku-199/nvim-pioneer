# NVIM-PIONEER vNext

My personal Neovim setup. Modular, sci-fi aesthetic, embedded-dev friendly.

```bash
git clone https://github.com/thorn/nvim-config ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

## What's inside

- **blink.cmp** — autocompletion (Rust, 3-5x faster)
- **nvim-lspconfig + Mason** — LSP auto-install for Python/C++/Rust/Go/JS/Lua
- **nvim-treesitter** — syntax, text objects, incremental selection
- **conform.nvim** — format on save (stylua, ruff, prettier, clang-format)
- **telescope.nvim** — fuzzy finder with live preview + fzf sorter
- **neo-tree + oil** — file tree + directory-as-buffer editing
- **noice.nvim** — modern cmdline, messages, notifications
- **dressing.nvim** — styled vim.ui.select/input dialogs
- **flash.nvim** — lightning-fast character/TS motion (`s`/`S`)
- **trouble.nvim** — unified diagnostics/references/symbols panel (`xx`)
- **nvim-spectre** — global search & replace panel
- **bufferline.nvim** — tab bar with diagnostics markers
- **lualine** — status bar with CPU/RAM/venv/Copilot/LSP status
- **incline.nvim** — floating filename bar per window
- **mini.animate** — cursor trail, smooth scroll, window animations
- **nvim-treesitter-context** — sticky parent function header
- **dashboard-nvim** — sci-fi HUD startup page (SYSTEM ONLINE)
- **persisted.nvim** — auto session save/restore by git branch
- **gitsigns** — inline git blame
- **nvim-dap** — debugger (F5/F10/F11/F12)
- **toggleterm** — floating terminal (`<C-\>`)
- **csvview.nvim** — CSV/TSV table viewer
- **which-key** — keybinding discovery menu

### Quick keymaps

`<leader>` = Space.

| What | Key |
|------|-----|
| Find files | `<leader>ff` |
| Live grep | `<leader>fg` |
| Jump to char | `s` |
| Diagnostics panel | `<leader>xx` |
| Global replace | `<leader>sr` |
| File tree | `<leader>e` |
| Go to definition | `gd` |
| Hover docs | `K` |
| Rename | `<leader>rn` |
| Code action | `<leader>ca` |
| Toggle terminal | `<C-\>` |
| Toggle theme | `<leader>th` |
| Save session | `<leader>qs` |

Full keybindings: [docs/guide/keybindings.md](docs/guide/keybindings.md) ·
Usage guide: [docs/guide/usage-guide.md](docs/guide/usage-guide.md) ·
中文: [快捷键大全](docs/guide/keybindings_CN.md)

## Design

Built around a unified design language: rounded borders, consistent winblend transparency, smooth animations, and a sci-fi HUD aesthetic. All floating windows share the same `border = "rounded"` token. No plugin fights another — noice, dressing, incline, and which-key are all coordinated.

## License

MIT
