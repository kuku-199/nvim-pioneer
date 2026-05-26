-- lua/config/plugins/ui/dressing.lua
-- dressing.nvim: Modern vim.ui.select() and vim.ui.input() UI
-- 现代化选择/输入对话框 — 配合 noice 达到 IDE 级交互
-- Note: Replaces telescope-ui-select that's already installed
-- 注意: 替换已安装的 telescope-ui-select

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  init = function()
    -- Disable telescope-ui-select if loaded (avoid conflict)
    -- 防止与 telescope-ui-select 冲突
    vim.g.telescope_ui_select_enabled = false
  end,
  opts = {
    input = {
      enabled = true,
      default_prompt = "➤ ",
      -- Rounded border consistent with noice / 与 noice 一致的圆角
      border = "rounded",
      relative = "editor",
      prefer_width = 50,
      win_options = {
        winblend = 5,
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
      -- These mappings are only active when the input is open
      mappings = {
        n = {
          ["<Esc>"] = "Close",
          ["<CR>"] = "Confirm",
        },
        i = {
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
          ["<Up>"] = "HistoryPrev",
          ["<Down>"] = "HistoryNext",
        },
      },
    },
    select = {
      enabled = true,
      backend = { "telescope", "nui", "builtin" }, -- prefer telescope, fallback chain
      trim_prompt = true,
      telescope = {
        -- Use dropdown theme for a compact code-action picker
        -- 使用 dropdown 主题做紧凑的代码操作选择器
        sorting_strategy = "ascending",
        layout_strategy = "center",
        layout_config = {
          width = 0.5,
          height = 0.4,
        },
      },
      nui = {
        position = "50%",
        size = nil,
        relative = "editor",
        border = {
          style = "rounded",
        },
        max_width = 80,
        max_height = 30,
      },
    },
  },
}
