# nvim 配置

我的个人 Neovim 配置。没啥花哨的，好用就行。

```bash
git clone https://github.com/thorn/nvim-config ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

## 里面有什么

- **blink.cmp** — 补全引擎（Rust 写的，快）
- **nvim-lspconfig + Mason** — LSP 自动装：Python / C++ / Rust / Go / JS / Lua
- **nvim-treesitter** — 语法高亮、文本对象、增量选择
- **conform.nvim** — 保存自动格式化
- **telescope.nvim** — 模糊搜索带预览
- **neo-tree + oil** — 文件树 + 目录编辑
- **bufferline.nvim** — 顶部标签栏（类似 VS Code）
- **lualine** — 状态栏带 CPU/RAM 监控
- **gitsigns** — 行内 Git 标记
- **nvim-dap** — 调试器（F5/F10/F11/F12）
- **toggleterm** — 浮动终端
- **dashboard-nvim** — 启动页
- **csvview.nvim** — CSV/TSV 表格显示、Excel 式导航、固定表头
- **which-key** — 快捷键提示

### 快捷键速查

`<leader>` = 空格键。

| 干啥 | 按什么 |
|------|--------|
| 找文件 | `<leader>ff` |
| 全文搜 | `<leader>fg` |
| 切文件 | `<Tab>` |
| 文件树 | `<leader>e` |
| 跳定义 | `gd` |
| 看文档 | `K` |
| 重命名 | `<leader>rn` |
| 代码操作 | `<leader>ca` |
| 格式化 | `<leader>fm` |
| 终端 | `<C-\>` |
| 换主题 | `<leader>th` |

完整快捷键：[docs/guide/keybindings_CN.md](docs/guide/keybindings_CN.md)  
使用指南：[docs/guide/usage-guide_CN.md](docs/guide/usage-guide_CN.md)

## License

MIT — 随便用。
