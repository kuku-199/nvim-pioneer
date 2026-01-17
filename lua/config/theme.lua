-- lua/config/theme.lua

-- List of available themes
local themes = { "gruvbox", "nightfox", "rose-pine", "dracula" }
local current_theme_idx = 1
local theme_cache_file = vim.fn.stdpath("data") .. "/theme_cache"

-- Helper: Save theme to file
local function save_theme(theme_name)
    local f = io.open(theme_cache_file, "w")
    if f then
        f:write(theme_name)
        f:close()
    end
end

-- Helper: Load theme from file
local function load_theme()
    local f = io.open(theme_cache_file, "r")
    if f then
        local saved_theme = f:read("*a")
        f:close()
        -- Trim whitespace
        saved_theme = saved_theme:gsub("%s+", "")
        -- Find index of saved theme
        for i, t in ipairs(themes) do
            if t == saved_theme then
                current_theme_idx = i
                return saved_theme
            end
        end
    end
    return themes[1] -- Default fallback
end

-- Function to cycle themes
function SwitchTheme()
    current_theme_idx = current_theme_idx + 1
    if current_theme_idx > #themes then current_theme_idx = 1 end
    local theme_name = themes[current_theme_idx]
    
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme_name)
    if not status_ok then print("Theme " .. theme_name .. " not found!") return end
    
    print("Switched to theme: " .. theme_name)
    save_theme(theme_name) -- Save selection
end

-- Create user command
vim.api.nvim_create_user_command("SwitchTheme", SwitchTheme, {})

-- Initialize Theme (Load from cache or default)
local startup_theme = load_theme()
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. startup_theme)
if not status_ok then
    vim.cmd("colorscheme " .. themes[1])
end
