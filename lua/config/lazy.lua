-- lua/config/lazy.lua
-- Bootstrap lazy.nvim (Plugin Manager)
-- 插件管理器启动文件

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if file exists
-- 检查文件是否存在
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  print("⬇️  Cloning lazy.nvim plugin manager...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Robust Error Handling
-- 错误捕获
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    print("❌ Error: lazy.nvim module not found!")
    return
end

-- Modular Setup
-- 模块化加载：自动读取 plugins 文件夹下的子文件夹
lazy.setup({
  spec = {
    -- 1. UI (Themes, Statusline, Icons)
    { import = "config.plugins.ui" },
    
    -- 2. Editor (File Tree, Syntax, Autopairs)
    { import = "config.plugins.editor" },
    
    -- 3. Coding (LSP, CMP, Snippets)
    { import = "config.plugins.coding" },

    -- 4. Embedded Development (C/C++, Debugging)
    { import = "config.plugins.embedded" },
    
    -- 5. Tools (Telescope, Git, Terminal)
    { import = "config.plugins.tools" },
  },
  checker = { enabled = true }, -- Check for updates / 自动检查更新
})
