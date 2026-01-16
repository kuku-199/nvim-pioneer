-- lua/config/plugins/telescope.lua
local builtin = require('telescope.builtin')

-- Keymappings
-- 快捷键设置
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files / 查找文件" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep / 全局搜索" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers / 查找标签" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help / 查找帮助" })

require('telescope').setup{ 
    defaults = { 
        file_ignore_patterns = { "node_modules", ".git" } -- Ignore patterns / 忽略目录
    } 
}
