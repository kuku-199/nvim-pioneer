-- lua/config/theme.lua

-- List of available themes
-- 可用主题列表
local themes = { "gruvbox", "nightfox", "rose-pine", "dracula" }
local current_theme_idx = 1

-- Function to cycle themes
-- 切换主题的函数
function SwitchTheme()
    current_theme_idx = current_theme_idx + 1
    if current_theme_idx > #themes then current_theme_idx = 1 end
    local theme_name = themes[current_theme_idx]
    
    -- Try to set scheme
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme_name)
    if not status_ok then print("Theme " .. theme_name .. " not found!") return end
    print("Switched to theme: " .. theme_name)
end

-- Create user command
-- 创建命令
vim.api.nvim_create_user_command("SwitchTheme", SwitchTheme, {})

-- Set default theme
-- 设置默认主题
vim.cmd("colorscheme " .. themes[1])
