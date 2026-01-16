-- lua/config/keymaps.lua
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set Leader key to Space
-- 将主键 Leader 设置为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --- Window Management / 窗口管理 ---
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split Vertically / 垂直分割" }) 
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split Horizontally / 水平分割" })

-- Navigate between windows / 窗口间跳转
-- Use <Leader> + h/j/k/l to avoid conflict with Tmux
-- 使用 <Leader> + h/j/k/l 来切换窗口，避免与 Tmux 冲突
keymap("n", "<leader>h", "<C-w>h", { desc = "Window Left / 左窗口" })
keymap("n", "<leader>j", "<C-w>j", { desc = "Window Down / 下窗口" })
keymap("n", "<leader>k", "<C-w>k", { desc = "Window Up / 上窗口" })
keymap("n", "<leader>l", "<C-w>l", { desc = "Window Right / 右窗口" })

-- --- Utilities / 实用工具 ---
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlights / 取消搜索高亮" })
-- Map 'jj' to Escape in insert mode / 输入模式下按 jj 退出
keymap("i", "jj", "<ESC>", opts)

-- --- Buffer Management (Bufferline) / 标签页管理 ---
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)   -- Next Tab / 下一个标签
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts) -- Prev Tab / 上一个标签
keymap("n", "<leader>x", ":bdelete<CR>", { desc = "Close Buffer / 关闭当前标签" })

-- --- Terminal (ToggleTerm) / 终端开关 ---
keymap("n", [[<C->]], ":ToggleTerm<CR>", { desc = "Toggle Terminal / 开关浮动终端" })

-- --- Theme Switcher / 主题切换 ---
keymap("n", "<leader>th", ":SwitchTheme<CR>", { desc = "Switch Theme / 切换主题" })

-- --- System Monitor Switch / 监控开关 ---
keymap("n", "<leader>tm", ":ToggleMonitor<CR>", { desc = "Toggle CPU/RAM Monitor / 开关状态栏监控" })
