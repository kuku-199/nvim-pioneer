-- lua/config/plugins/coding/blink.lua
-- Blink.cmp: Rust-based autocompletion engine (replaces nvim-cmp + LuaSnip)
-- Rust 编写的高性能补全引擎，替代 nvim-cmp + LuaSnip + cmp-* 全家桶

return {
  "saghen/blink.cmp",
  -- Opt-in to latest features
  version = "*",

  dependencies = {
    -- Adds LSP completion capabilities
    "rafamadriz/friendly-snippets",
  },

  opts = {
    -- Key mappings
    keymap = {
      preset = "default",

      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else return cmp.select_and_accept() end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },

    -- Completion settings
    completion = {
      documentation = { auto_show = true },
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name" },
          },
        },
      },
    },

    -- Source configuration
    sources = {
      default = { "lsp", "path", "buffer" },
    },

    -- Signature help (function parameter hints)
    signature = { enabled = true },
  },
}
