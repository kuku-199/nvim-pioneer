# NVIM-PIONEER vNext

个人 Neovim 配置 —— 模块化、科幻 HUD 美学、嵌入式友好。

```bash
git clone https://github.com/thorn/nvim-config ~/.config/nvim
nvim --headless "+Lazy! sync" +qa
```

## 里面有什么

- **blink.cmp** — 补全引擎（Rust，比 nvim-cmp 快 3-5x）
- **nvim-lspconfig + Mason** — LSP 自动装（Python/C++/Rust/Go/JS/Lua）
- **nvim-treesitter** — 语法高亮、文本对象、增量选择
- **conform.nvim** — 保存自动格式化
- **telescope.nvim** — 模糊搜索 + fzf 排序 + 实时预览
- **neo-tree + oil** — 文件树 + 目录即文本编辑
- **noice.nvim** — 现代化命令行、消息、通知 UI
- **dressing.nvim** — vim.ui.select/input 美化弹窗
- **flash.nvim** — 闪电跳转（`s` 键跳任意可见字符）
- **trouble.nvim** — 统一诊断中心（`<leader>xx` 一键看所有问题）
- **nvim-spectre** — 全局搜索替换面板
- **bufferline.nvim** — 顶部标签栏 + 诊断标记
- **lualine** — 状态栏（CPU/MEM/venv/LSP 状态，淡蓝色调）
- **incline.nvim** — 每窗口顶部浮动文件名
- **mini.animate** — 光标轨迹 + 平滑滚动动画
- **nvim-treesitter-context** — 粘性父级函数签名
- **dashboard-nvim** — 科幻 HUD 风格启动页
- **persisted.nvim** — 自动 session 保存/恢复（按 git 分支隔离）
- **gitsigns** — 行内 Git 标记
- **nvim-dap** — 调试器（F5/F10/F11/F12）
- **toggleterm** — 浮动终端（`<C-\>`）
- **csvview.nvim** — CSV/TSV 表格查看
- **which-key** — 快捷键发现菜单

## 快捷键速查

`<leader>` = 空格键。

| 干啥 | 按什么 |
|------|--------|
| 找文件 | `<leader>ff` |
| 全文搜 | `<leader>fg` |
| 闪电跳转 | `s` |
| 诊断面板 | `<leader>xx` |
| 全局替换 | `<leader>sr` |
| 文件树 | `<leader>e` |
| 跳定义 | `gd` |
| 看文档 | `K` |
| 重命名 | `<leader>rn` |
| 代码操作 | `<leader>ca` |
| 终端 | `<C-\>` |
| 换主题 | `<leader>th` |
| 保存会话 | `<leader>qs` |

完整快捷键：[快捷键大全](docs/guide/keybindings_CN.md) ·
使用指南：[使用指南](docs/guide/usage-guide_CN.md)

## 设计

统一设计语言：圆角边框、一致的透明度、平滑动画、科幻 HUD 风格。浮动窗口全部共享 `border = "rounded"` 标记。

## License

MIT
