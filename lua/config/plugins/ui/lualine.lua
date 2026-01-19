-- lua/config/plugins/ui/lualine.lua
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        -- [Custom CPU/RAM Monitor Logic would go here]
        -- [此处复用之前定义的带 CPU/RAM 监控的 Lualine 配置]
        
        -- Theme Colors
        local colors = {
            green  = '#50fa7b',
            yellow = '#f1fa8c',
            red    = '#ff5555',
            cyan   = '#8be9fd',
            purple = '#bd93f9',
            orange = '#ffb86c',
        }
        
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto', 
            component_separators = '|',
            section_separators = '',
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            -- Simple version for display
            lualine_x = { 'encoding', 'filetype' },
            lualine_y = {'progress'},
            lualine_z = {'location'}
          }
        }
    end
}
