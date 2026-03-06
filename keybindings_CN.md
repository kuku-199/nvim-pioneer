# 🎹 快捷键大全 (Keybindings Cheat Sheet)

本文档列出了 **Nvim Pioneer** 中配置的所有快捷键。

## 🪟 1. 通用与窗口管理 (General & Windows)

| 按键 (Key) | 命令 (Command) | 说明 (Description) |
| :--- | :--- | :--- |
| `<Space>` | Leader | **主功能键 (空格)** |
| `<Space>sv` | `:vsplit` | 垂直分屏 (左右) |
| `<Space>sh` | `:split` | 水平分屏 (上下) |
| `<Space>h` | `<C-w>h` | 光标移至左窗口 |
| `<Space>j` | `<C-w>j` | 光标移至下窗口 |
| `<Space>k` | `<C-w>k` | 光标移至上窗口 |
| `<Space>l` | `<C-w>l` | 光标移至右窗口 |
| `<Space>nh` | `:nohl` | 清除搜索高亮 |
| `<Space>th` | `:SwitchTheme` | 切换并保存主题 |
| `<Space>tm` | `:ToggleMonitor`| 开关底部状态监控 |
| `jj` | `<Esc>` | 快速退出插入模式 |

## 📂 2. 文件与终端 (Files & Terminal)

| 按键 (Key) | 命令 (Command) | 说明 (Description) |
| :--- | :--- | :--- |
| `<Space>e` | `:NvimTreeToggle` | 开关左侧文件树 |
| `<Space>ff` | `Telescope files` | 模糊查找文件 |
| `<Space>fg` | `Telescope grep` | 全局搜索文本内容 |
| `<Space>fb` | `Telescope buffers`| 查找已打开的文件 |
| `<C-\>` | `:ToggleTerm` | 开关悬浮终端 (Ctrl+反斜杠) |
| `<Tab>` | BufferNext | 切换到下一个标签页 |
| `<S-Tab>` | BufferPrev | 切换到上一个标签页 |
| `<Space>x` | `:bdelete` | 关闭当前文件标签 |

## 🧠 3. 代码开发 (Coding / LSP)

*这些快捷键仅在语言服务激活时有效（例如打开 .py 或 .lua 文件后）。*

| 按键 (Key) | 命令 (Command) | 说明 (Description) |
| :--- | :--- | :--- |
| `gd` | `vim.lsp.buf.definition` | **跳转到定义** |
| `K` | `vim.lsp.buf.hover` | **显示悬停文档** |
| `gr` | `vim.lsp.buf.references` | 查找引用 |
| `<Space>rn` | `vim.lsp.buf.rename` | 变量重命名 |
| `<Space>ca` | `vim.lsp.buf.code_action` | 代码快速修复 (Code Action) |

### 🦀 Rust 专属快捷键 (Rustaceanvim)

| 按键 (Key) | 命令 (Command) | 说明 (Description) |
| :--- | :--- | :--- |
| `<Space>ca` | `RustLsp('codeAction')` | Rust 代码修复 |
| `K` | `RustLsp({'hover', 'actions'})` | Rust 悬停提示与操作 |
| `<Space>dr` | `RustLsp('debuggables')` | 调试 Rust 目标 |

## 🐞 4. 调试 (Debugging / DAP)

| 按键 (Key) | 动作 (Action) | 说明 (Description) |
| :--- | :--- | :--- |
| `<F5>` | Continue | 开始/继续调试 |
| `<F10>` | Step Over | 单步跳过 |
| `<F11>` | Step Into | 单步进入 |
| `<F12>` | Step Out | 单步跳出 |
| `<Space>b` | Breakpoint | 切换断点 |

## 🎛️ 5. 通用快捷键模式 (Standard Shortcuts)

使用命令 `:ToggleShortcuts` 开启/关闭。

| 按键 | 说明 |
| :--- | :--- |
| `Ctrl + C` | 复制 (仅可视模式) |
| `Ctrl + V` | 粘贴 (插入/命令模式) |
| `Ctrl + A` | 全选 |
| `Ctrl + S` | 保存文件 |
| `Ctrl + Z` | 撤销 |
