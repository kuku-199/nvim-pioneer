-- lua/config/plugins/editor/tree.lua
return {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle File Explorer" }
    },
    opts = {
        view = { width = 30 },
        renderer = { 
            group_empty = true, 
            icons = { show = { file = true, folder = true, folder_arrow = true, git = true } } 
        },
        filters = { dotfiles = false },
    },
    config = function(_, opts)
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup(opts)
    end
}
