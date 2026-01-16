-- lua/config/plugins/tree.lua

-- Disable netrw (default file explorer)
-- 禁用自带的文件浏览器 netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = { width = 30 },
    renderer = { 
        group_empty = true, 
        icons = { show = { file = true, folder = true, folder_arrow = true, git = true } } 
    },
    filters = { dotfiles = false }, -- Hide dotfiles / 隐藏点文件
})

-- Toggle keymap
-- 快捷键
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
