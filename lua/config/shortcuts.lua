-- lua/config/shortcuts.lua
-- Standard Shortcuts (Ctrl+C, Ctrl+V, Ctrl+A, Ctrl+Z, Ctrl+S)
-- 通用快捷键配置 (复制、粘贴、全选、撤销、保存)

local M = {}
local state_file = vim.fn.stdpath("data") .. "/shortcuts_state"

-- Helper: Check if file exists
-- 辅助函数：检查文件是否存在
local function file_exists(name)
   local f = io.open(name, "r")
   if f ~= nil then io.close(f) return true else return false end
end

-- 1. Load State (Persistence)
-- 1. 读取状态 (持久化：记住上次是开启还是关闭)
local function load_state()
    if not file_exists(state_file) then return false end
    local f = io.open(state_file, "r")
    if f then
        local content = f:read("*a")
        f:close()
        return content == "true"
    end
    return false
end

-- 2. Save State
-- 2. 保存状态
local function save_state(enabled)
    local f = io.open(state_file, "w")
    if f then
        f:write(enabled and "true" or "false")
        f:close()
    end
end

-- 3. Enable Keys
-- 3. 开启快捷键 (VSCode/CUA 标准风格)
function M.enable()
    local opts = { noremap = true, silent = true }
    
    -- Ctrl+A: Select All / 全选
    vim.keymap.set("n", "<C-a>", "ggVG", opts)
    vim.keymap.set("i", "<C-a>", "<Esc>ggVG", opts)
    vim.keymap.set("v", "<C-a>", "<Esc>ggVG", opts)

    -- Ctrl+C: Copy (Visual Mode Only) / 复制 (仅可视模式)
    -- Standard Vim 'y' is copy, but this adds Ctrl+C
    vim.keymap.set("v", "<C-c>", '"+y', opts)

    -- Ctrl+V: Paste / 粘贴 (任何模式)
    vim.keymap.set("i", "<C-v>", '<C-r>+', opts)
    vim.keymap.set("n", "<C-v>", '"+p', opts)
    vim.keymap.set("c", "<C-v>", '<C-r>+', opts) -- Command line pasting / 命令行粘贴

    -- Ctrl+S: Save / 保存
    vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
    vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", opts)
    vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", opts)

    -- Ctrl+Z: Undo / 撤销
    vim.keymap.set("n", "<C-z>", "u", opts)
    vim.keymap.set("i", "<C-z>", "<C-o>u", opts)
    
    print("🚀 Standard Shortcuts: ON (Ctrl+C/V/A/S/Z Enabled)")
    save_state(true)
end

-- 4. Disable Keys (Revert to Vim defaults)
-- 4. 关闭快捷键 (恢复 Vim 原生行为)
function M.disable()
    local keys = {
        {"n", "<C-a>"}, {"i", "<C-a>"}, {"v", "<C-a>"},
        {"v", "<C-c>"},
        {"i", "<C-v>"}, {"n", "<C-v>"}, {"c", "<C-v>"},
        {"n", "<C-s>"}, {"i", "<C-s>"}, {"v", "<C-s>"},
        {"n", "<C-z>"}, {"i", "<C-z>"}
    }
    
    for _, map in ipairs(keys) do
        -- pcall prevents error if key wasn't set
        -- pcall 防止按键未设置时报错
        pcall(vim.keymap.del, map[1], map[2])
    end
    
    print("🤖 Vim Shortcuts: ON (Standard Keys OFF)")
    save_state(false)
end

-- 5. Toggle Command
-- 5. 切换命令逻辑
function M.toggle()
    if load_state() then
        M.disable()
    else
        M.enable()
    end
end

-- Register Command: :ToggleShortcuts
-- 注册命令，输入 :ToggleShortcuts 即可切换
vim.api.nvim_create_user_command("ToggleShortcuts", M.toggle, {})

-- Apply state on startup
-- 启动时自动应用状态
if load_state() then
    M.enable()
end

return M
