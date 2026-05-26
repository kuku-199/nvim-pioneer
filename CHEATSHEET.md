# ⌨️ Neovim 快捷键速查表

> 位置：`~/.config/nvim/CHEATSHEET.md`
>
> 打开本文件：在 nvim 里按 `<leader>ff` 然后输 `CHEATSHEET`

---

## 1. 基本操作

| 快捷键 | 模式 | 功能 |
|--------|:----:|------|
| `jj` | 插入 | 退出插入模式（同 Esc） |
| `<C-s>` | 普通 | **保存**文件 |
| `<C-z>` | 普通 | 撤销 |
| `u` | 普通 | 撤销 |
| `<C-r>` | 普通 | 重做 |
| `<leader>nh` | 普通 | 取消搜索高亮 |
| `n` / `N` | 普通 | 下一个/上一个匹配（自动居中） |

---

## 2. 🖥️ 窗口管理

| 快捷键 | 功能 |
|--------|------|
| `<leader>sv` | **垂直**分割窗口 |
| `<leader>sh` | **水平**分割窗口 |
| `<leader>h` | 跳到**左**窗口 |
| `<leader>j` | 跳到**下**窗口 |
| `<leader>k` | 跳到**上**窗口 |
| `<leader>l` | 跳到**右**窗口 |
| `<leader>=` | 窗口**等宽等高** |
| `<leader>x` | 关闭当前文件 |

---

## 3. 📂 文件浏览

### 3.1 neo-tree（树状文件浏览器）

| 快捷键 | 功能 |
|--------|------|
| `<leader>e` | **打开/关闭** 文件树 |
| `<leader>E` | 在文件树里**定位**当前文件 |
| `q` | （文件树内）关闭面板 |
| `h` | 折叠目录 |
| `l` 或 `Enter` | 打开文件或展开目录 |
| `v` | **垂直**分屏打开 |
| `s` | **水平**分屏打开 |
| `t` | 在新标签页打开 |
| `H` | 显示/隐藏隐藏文件 |
| `R` | 刷新 |
| `P` | 预览文件 |
| `/` | 模糊搜索（文件树内） |
| `?` | 显示帮助 |

### 3.2 oil（目录编辑）

| 快捷键 | 功能 |
|--------|------|
| `<leader>o` / `-` | **打开** oil / 回到上级目录 |
| `Enter` | 打开文件/进入目录 |
| `<C-v>` / `<C-s>` | 垂直/水平分屏打开 |
| `dd` / `yy` / `p` | 删除/复制/粘贴文件 |
| `R` | 重命名 |
| `g.` | 显示/隐藏隐藏文件 |
| `gx` | 系统默认应用打开 |

---

## 4. 🔍 搜索（Telescope）

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | **查找文件** |
| `<leader>fg` | **全文搜索**（live grep） |
| `<leader>fb` | **切换 buffer** |
| `<leader>fr` | 最近打开的文件 |
| `<leader>f;` | Git 仓库中的文件 |
| `<leader>fh` | 搜索 vim 帮助文档 |
| `<leader>fw` | 搜索光标下的单词 |
| `<leader>fd` | 查看所有诊断错误 |
| `<leader>fs` | 文件符号（LSP） |
| `<leader>fgc` | Git 提交历史 |
| `<leader>fgb` | Git 分支 |
| `<leader>f.` | 恢复上一次搜索 |
| `<leader>/` | 当前文件内模糊搜索 |

**Telescope 内操作：**

| 快捷键 | 功能 |
|--------|------|
| `<C-j>` / `<C-k>` | 上下选择 |
| `<C-l>` | 打开文件 |
| `<C-v>` / `<C-s>` / `<C-t>` | 垂直/水平/标签页打开 |
| `q` | 关闭搜索 |

---

## 5. ⚡ Flash Motion（闪电跳转）

| 快捷键 | 模式 | 功能 |
|--------|:----:|------|
| `s` | n/x/o | **闪电跳转**到任意可见字符 |
| `S` | n/x/o | 语法树节点跳转 |
| `r` | o | 远程操作（选择范围后操作） |
| `R` | o/x | 语法树搜索并操作 |

> 按 `s` 后，所有可见匹配位置会出现彩色标签，直接按标签字母跳过去。

---

## 6. 🔧 LSP（代码智能）

| 快捷键 | 功能 |
|--------|------|
| `gd` | **跳转到定义** |
| `gr` | 查找**引用** |
| `gD` | 跳转到声明 |
| `K` | 查看**文档**（悬停信息） |
| `<leader>rn` | **重命名**变量/函数 |
| `<leader>ca` | **代码操作**（修复提示） |
| `<leader>d` | 查看当前行诊断信息 |
| `]d` | 跳到下一个错误 |
| `[d` | 跳到上一个错误 |
| `<leader>th` | 开关 inlay hints（类型标注） |

---

## 7. 🪲 Trouble（诊断中心）

| 快捷键 | 功能 |
|--------|------|
| `<leader>xx` | 当前文件**诊断**（toggle） |
| `<leader>xX` | 工作区全量**诊断** |
| `<leader>cs` | 文件**符号**列表 |
| `<leader>cl` | LSP **引用**列表 |
| `<leader>xL` | 位置列表 |
| `<leader>xQ` | 快速修复列表 |

**Trouble 内操作：** `q` 关闭, `j`/`k` 移动, `o` 跳转并关闭, `P` 预览

---

## 8. ✨ 补全（blink.cmp）

| 快捷键 | 功能 |
|--------|------|
| `<C-Space>` | 手动触发补全 |
| `<Tab>` | 选择**下一项** |
| `<S-Tab>` | 选择**上一项** |
| `Enter` | 确认选择 |
| `<C-b>` / `<C-f>` | 上下滚动文档 |
| `<C-e>` | 取消补全 |

---

## 9. 🌲 Treesitter 语法操作

### 9.1 文本对象

| 快捷键 | 功能 |
|--------|------|
| `yaf` | 复制**整个函数** |
| `daf` | 删除整个函数 |
| `cif` | 修改函数内部 |
| `yac` | 复制整个类 |
| `cia` | 修改函数参数 |
| `yab` | 复制整个代码块 |

> 组合：`d`/`c`/`y` + `a`(包含边界)/`i`(内部) + `f`(函数)/`c`(类)/`a`(参数)/`b`(块)

### 9.2 跳转

| 快捷键 | 功能 |
|--------|------|
| `]m` / `[m` | 下一个/上一个函数开头 |
| `]]` / `[[` | 下一个/上一个类开头 |
| `]M` / `[M` | 下一个/上一个函数结尾 |

### 9.3 参数交换

| 快捷键 | 功能 |
|--------|------|
| `<leader>a` | 当前参数和后一个交换 |
| `<leader>A` | 当前参数和前一个交换 |

### 9.4 增量选择

| 快捷键 | 功能 |
|--------|------|
| `<c-space>` | 从光标位置**逐级扩大**选中 |
| `<c-s>` | 扩大到当前作用域 |
| `<M-space>` | 缩小范围 |

---

## 10. 📑 Buffer（文件标签）管理

| 快捷键 | 功能 |
|--------|------|
| `<Tab>` | 切换到**下一个**文件 |
| `<S-Tab>` | 切换到**上一个**文件 |
| `<leader>x` | 关闭当前文件 |
| `<leader>X` | 关闭全部文件 |
| `<leader>bC` | 关闭**其他**所有文件 |
| `<leader>bp` | 固定标签（不会被关闭） |
| `Alt+,` / `Alt+.` | 左移/右移标签 |

---

## 11. 🎨 主题与界面

### 主题切换

| 快捷键 | 功能 |
|--------|------|
| `<leader>th` | **循环切换主题**（gruvbox → nightfox → rose-pine → dracula） |

**可用主题：** gruvbox (暖色复古) / nightfox (冷色现代) / rose-pine (柔和粉彩) / dracula (暗紫经典)

### 界面增强

| 功能 | 插件 |
|------|------|
| 命令行/通知美化 | noice.nvim（圆角浮动 cmdline + mini 模式消息） |
| 窗口顶部标题栏 | incline.nvim（文件名 + 诊断数 + 修改标记） |
| 光标/滚动动画 | mini.animate（轨迹追踪 + 平滑滚动） |
| 粘性上下文 | nvim-treesitter-context（窗口顶部固定父级函数名） |

### 状态栏监控

| 快捷键 | 功能 |
|--------|------|
| `<leader>tm` | 开关 CPU/RAM 实时监控 |
| `:ToggleEncoding` | 开关编码显示 |
| `:ToggleShortcuts` | 开关标准快捷键模式 |

---

## 12. 🔎 全局搜索替换（Spectre）

| 快捷键 | 功能 |
|--------|------|
| `<leader>sr` | **打开**全局搜索替换面板 |
| `<leader>sw` | 搜索**光标下**的单词 |
| `<leader>sp` | 在当前文件搜索 |

---

## 13. 💾 Session 会话管理（persisted.nvim）

| 快捷键 | 功能 |
|--------|------|
| `<leader>qs` | **保存**当前会话 |
| `<leader>ql` | **加载**上次会话 |
| `<leader>qf` | **浏览**所有保存的会话 |
| `<leader>qd` | 删除当前会话 |

> 退出时自动保存，启动时自动恢复。按 git 分支隔离会话。

---

## 14. 🐞 调试（DAP）

| 快捷键 | 功能 |
|--------|------|
| `<F5>` | 开始/继续调试 |
| `<F10>` | 单步跳过 |
| `<F11>` | 单步进入 |
| `<F12>` | 单步跳出 |
| `<leader>b` | 切换断点 |

---

## 15. 📝 Markdown

| 快捷键 | 功能 |
|--------|------|
| `<leader>mp` | 浏览器**预览** Markdown |
| `<leader>mr` | 编辑器内**渲染** Markdown |

---

## 16. 📊 CSV/TSV 表格（csvview.nvim）

打开 `.csv` / `.tsv` 文件后：

| 命令 | 作用 |
|------|------|
| `:CsvViewToggle` | 开关表格视图 |
| `:CsvViewToggle display_mode=border` | 竖线表格模式 |
| `:CsvViewInfo` | 查看统计信息 |

**表格内操作：**

| 快捷键 | 功能 |
|--------|------|
| `<Tab>` / `<S-Tab>` | 前/后字段 |
| `Enter` / `<S-Enter>` | 下/上行同列 |
| `vif` / `vaf` | 选中字段内容/含分隔符 |

---

## 17. 🛠️ 其他工具

| 快捷键 | 功能 |
|--------|------|
| `<C-\>` | 开关**浮动终端** |
| `<leader>fm` | 手动格式化代码 |
| `<leader>cg` | CMake Generate |
| `<leader>cb` | CMake Build |
| `<leader>dr` | Rust 调试目标 |

---

## 18. 🔄 配置结构

```
~/.config/nvim/
├── init.lua                        ← 入口
├── CHEATSHEET.md                   ← 本文件
├── lazy-lock.json                  ← 插件版本锁定（自动生成）
├── lua/config/
│   ├── options.lua                 ← 基础设置 + 设计令牌（边框/透明度）
│   ├── keymaps.lua                 ← 全局快捷键
│   ├── lazy.lua                    ← 插件管理器入口
│   ├── theme.lua                   ← 主题切换逻辑
│   ├── shortcuts.lua               ← Ctrl+C/V/A 快捷键
│   └── plugins/
│       ├── coding/
│       │   ├── blink.lua           ← 补全引擎（blink.cmp）
│       │   ├── lsp.lua             ← LSP 配置
│       │   └── rust.lua            ← Rust 专用
│       ├── editor/
│       │   ├── autopairs.lua       ← 自动括号
│       │   ├── comment.lua         ← 注释快捷键
│       │   ├── conform.lua         ← 保存自动格式化
│       │   ├── flash.lua           ← 闪电跳转
│       │   ├── gitsigns.lua        ← Git 行内标记
│       │   ├── markdown.lua        ← Markdown 预览
│       │   ├── neo-tree.lua        ← 文件树
│       │   ├── oil.lua             ← 目录编辑
│       │   ├── treesitter.lua      ← 语法树增强
│       │   └── treesitter-context.lua ← 粘性上下文
│       ├── embedded/
│       │   ├── clangd.lua          ← C/C++ 增强
│       │   ├── cmake.lua           ← CMake 集成
│       │   └── dap.lua             ← 调试器
│       ├── tools/
│       │   ├── csvview.lua         ← CSV/TSV 表格
│       │   ├── persistence.lua     ← 会话管理
│       │   ├── spectre.lua         ← 全局搜索替换
│       │   ├── telescope.lua       ← 模糊搜索
│       │   ├── terminal.lua        ← 浮动终端
│       │   ├── trouble.lua         ← 诊断中心
│       │   └── which-key.lua       ← 快捷键提示
│       └── ui/
│           ├── bufferline.lua      ← 顶部标签栏
│           ├── dashboard.lua       ← 启动页（科幻 HUD）
│           ├── dressing.lua        ← 选择/输入对话框美化
│           ├── incline.lua         ← 窗口顶部标题栏
│           ├── indent.lua          ← 缩进线
│           ├── lualine.lua         ← 状态栏（CPU/RAM/venv/Copilot）
│           ├── mini-animate.lua    ← 光标/滚动动画
│           ├── noice.lua           ← 命令行/通知美化
│           └── themes.lua          ← 主题包
```

---

> 💡 **记不住？** 随时按 `<leader>ff` 搜 `CHEATSHEET` 打开本文件。
> 等 `<leader>` 超时 or 按 `<leader><leader>` 看 which-key 菜单。
