-- lua/config/plugins/tools/terminal.lua
-- toggleterm.nvim: Floating terminal / 浮动终端

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm" },
  keys = {
    { [[<C-\>]], "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal / 开关终端" },
    { [[<C-_>]], "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal / 开关终端" }, -- same for some terminals
  },
  opts = {
    size = 20,
    open_mapping = [[<C-\>]],
    direction = "float",
    float_opts = {
      border = "rounded",
      winblend = 3,
    },
    -- Shell configuration / shell 配置
    shell = vim.o.shell,
  },
}
