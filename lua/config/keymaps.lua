-- lua/config/keymaps.lua
-- Keymaps: Neovim core keybindings / 核心快捷键
-- Plugin-specific keymaps live in their plugin files (lazy.nvim keys= loading)
-- 插件快捷键在各自的插件文件中定义（lazy.nvim keys= 延迟加载）

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key / 主键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ══════════════════════════════════════════
-- Window Management / 窗口管理
-- ══════════════════════════════════════════
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split Vertically / 垂直分割" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontally / 水平分割" })
keymap("n", "<leader>h",  "<C-w>h", { desc = "Window Left / 左窗口" })
keymap("n", "<leader>j",  "<C-w>j", { desc = "Window Down / 下窗口" })
keymap("n", "<leader>k",  "<C-w>k", { desc = "Window Up / 上窗口" })
keymap("n", "<leader>l",  "<C-w>l", { desc = "Window Right / 右窗口" })
keymap("n", "<leader>=",  "<C-w>=", { desc = "Equalize Windows / 均分窗口" })

-- ══════════════════════════════════════════
-- Utilities / 实用工具
-- ══════════════════════════════════════════
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlights / 取消搜索高亮" })
keymap("i", "jj", "<ESC>", opts)

-- ══════════════════════════════════════════
-- Buffer Management / 缓冲区管理
-- ══════════════════════════════════════════
keymap("n", "<leader>x",  ":bdelete<CR>", { desc = "Close Buffer / 关闭当前文件" })
keymap("n", "<leader>X",  ":%bdelete|<CR>", { desc = "Close All Buffers / 关闭全部文件" })

-- ══════════════════════════════════════════
-- Quickfix & Location List / 快速修复
-- ══════════════════════════════════════════
keymap("n", "]q", ":cnext<CR>", { desc = "Next Quickfix / 下一个" })
keymap("n", "[q", ":cprev<CR>", { desc = "Prev Quickfix / 上一个" })
keymap("n", "]l", ":lnext<CR>", { desc = "Next Location / 下一个位置" })
keymap("n", "[l", ":lprev<CR>", { desc = "Prev Location / 上一个位置" })

-- ══════════════════════════════════════════
-- Editor / 编辑
-- ══════════════════════════════════════════
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down / 下滚半页" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up / 上滚半页" })
keymap("n", "n", "nzzzv", { desc = "Next Match (centered) / 下一个结果" })
keymap("n", "N", "Nzzzv", { desc = "Prev Match (centered) / 上一个结果" })

-- ══════════════════════════════════════════
-- Theme / 主题
-- ══════════════════════════════════════════
keymap("n", "<leader>th", ":SwitchTheme<CR>", { desc = "Switch Theme / 切换主题" })

-- ══════════════════════════════════════════
-- System Monitor / 监控开关
-- ══════════════════════════════════════════
keymap("n", "<leader>tm", ":ToggleMonitor<CR>", { desc = "Toggle CPU/RAM Monitor / 开关监控" })
