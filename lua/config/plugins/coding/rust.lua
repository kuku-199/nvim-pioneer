-- lua/config/plugins/coding/rust.lua
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = { "rust" },
    config = function()
      -- Rustaceanvim automatically configures rust-analyzer
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            local keymap = vim.keymap.set
            keymap("n", "<leader>ca", function() vim.cmd.RustLsp('codeAction') end, opts)
            keymap("n", "K", function() vim.cmd.RustLsp({'hover', 'actions'}) end, opts)
            keymap("n", "<leader>dr", function() vim.cmd.RustLsp('debuggables') end, opts)
          end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      }
    end
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  }
}
