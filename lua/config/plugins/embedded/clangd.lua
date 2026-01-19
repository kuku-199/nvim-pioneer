-- lua/config/plugins/embedded/clangd.lua
return {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    config = function() 
        require("clangd_extensions").setup({
            inlay_hints = {
                inline = true,
            },
        })
        -- Keymaps
        vim.keymap.set("n", "<leader>gh", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header" })
    end
}
