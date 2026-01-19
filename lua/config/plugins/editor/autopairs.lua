-- lua/config/plugins/editor/autopairs.lua
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true 
    -- 'config = true' is equivalent to require('nvim-autopairs').setup({})
    -- 'config = true' 等同于自动调用 setup({})
}
