-- init.lua
-- Entry point for Neovim configuration.
-- Neovim 配置入口文件。

-- 1. Load basic options (Line numbers, mouse, etc.)
-- 加载基础设置 (行号，鼠标等)
require("config.options")

-- 2. Load keymappings
-- 加载快捷键设置
require("config.keymaps")

-- 3. Load Plugin Manager (Lazy.nvim)
-- 加载插件管理器
require("config.lazy")

-- 4. Load Theme Switcher Logic
-- 加载自定义主题切换逻辑
require("config.theme")
