-- lua/config/plugins/tools/terminal.lua
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { [[<C-\>]] }, -- Lazy load on keypress
    config = function()
        require("toggleterm").setup({
            size = 20,
            open_mapping = [[<c-\>]],
            direction = 'float',
            float_opts = {
                border = 'curved',
            }
        })
    end
}
