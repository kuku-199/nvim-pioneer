-- lua/config/plugins/ui/dashboard.lua
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        week_header = {
         enable = true,
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          { desc = ' Files', group = '@label', action = 'Telescope find_files', key = 'f' },
          { desc = ' Apps', group = '@diagnostic', action = 'Telescope app', key = 'a' },
          { desc = ' dotfiles', group = '@number', action = 'Telescope dotfiles', key = 'd' },
        },
      },
    })
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'} }
}
