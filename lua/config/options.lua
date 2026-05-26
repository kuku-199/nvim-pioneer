-- lua/config/options.lua
local opt = vim.opt

-- Enable mouse support in all modes
-- 开启鼠标支持 (a = all modes，支持点击、拖拽、滚动)
opt.mouse = "a"

-- Line numbers
-- 行号设置
opt.relativenumber = true -- Relative line numbers / 相对行号
opt.number = true         -- Show current line number / 显示当前行号

-- Indentation
-- 缩进设置
opt.tabstop = 4       -- Number of spaces that a <Tab> counts for / Tab 键代表的空格数
opt.shiftwidth = 4    -- Size of an indent / 自动缩进时的空格数
opt.expandtab = true  -- Use spaces instead of tabs / 将 Tab 转换为空格
opt.autoindent = true -- Copy indent from current line / 换行时自动对齐上一行

-- Behavior
-- 行为设置
opt.wrap = false      -- Disable line wrapping / 禁止自动换行
opt.ignorecase = true -- Ignore case in search patterns / 搜索时忽略大小写
opt.smartcase = true  -- Override ignorecase if search contains capitals / 如果搜索包含大写，则不忽略大小写
opt.cursorline = true -- Highlight the current line / 高亮当前行
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI / 开启真彩色支持

-- Clipboard
-- 剪贴板设置
-- Sync with system clipboard / 与系统剪贴板同步
opt.clipboard:append("unnamedplus") 

-- Encoding
-- 编码设置
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Window splitting
-- 窗口分割设置
opt.splitright = true -- Split windows to the right / 新窗口在右侧打开
opt.splitbelow = true -- Split windows to the bottom / 新窗口在下方打开

-- ────────────────────────────────────
-- Unified Design Language / 统一设计语言
-- ────────────────────────────────────
-- Floating window transparency / 浮动窗口透明度 (0=完全不透明, 100=完全透明)
opt.winblend = 8
-- Completion popup transparency / 补全菜单透明度
opt.pumblend = 12
-- Rounded borders for all floating windows / 全局浮动窗口圆角
opt.winborder = "rounded"
-- Sign column always visible (prevents layout shift) / 标记列始终可见
opt.signcolumn = "yes"
-- Command line height / 命令行高度 (给 noice 留空间)
opt.cmdheight = 1
-- Hide mode display (lualine already shows it) / 隐藏原生 mode 显示
opt.showmode = false
-- Scroll offset (keep context above/below cursor) / 滚动时保留上下文
opt.scrolloff = 4
-- Line wrap break at word boundaries / 按单词边界换行
opt.linebreak = true
-- Preview window for substitutions / 替换时预览
opt.inccommand = "split"
