-- lua/config/plugins/tools/which-key.lua
-- which-key.nvim v3: Keybinding discoverability popup
-- 快捷键发现弹窗 — v3.17.0 兼容配置

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 400
  end,
  opts = {
    preset = "modern",
    -- Delay before showing / 显示延迟
    delay = function(ctx)
      return ctx.plugin and 0 or 300
    end,
    -- Filter which mappings to show / 过滤显示
    filter = function(mapping)
      return true -- show all / 显示全部
    end,
    -- Window appearance / 窗口外观
    win = {
      border = "rounded",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      wo = {
        winblend = 5,
      },
    },
    -- Layout / 布局
    layout = {
      width = { min = 30, max = 60 },
      height = { min = 8, max = 25 },
      spacing = 6,
    },
    -- Custom spec for group labels / 自定义分组标签
    spec = {
      { "<leader>t", group = " Theme" },
      { "<leader>f", group = " Find" },
      { "<leader>g", group = "󰊢 Git" },
      { "<leader>c", group = " Code" },
      { "<leader>d", group = " Debug" },
      { "<leader>x", group = "󰅚 Diagnostics" },
      { "<leader>s", group = "󰍉 Search" },
      { "<leader>q", group = "⏾ Session" },
      { "<leader>b", group = "󰈙 Buffer" },
      { "<leader>e", group = " Explorer" },
      { "<leader>r", group = "󰑑 Refactor" },
      { "<leader>w", group = " Window" },
    },
    plugins = {
      marks = true,
      registers = true,
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
  },
}
