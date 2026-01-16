-- lua/config/plugins/extras.lua

-- 1. Which-Key: Keybinding helper
-- 按键提示插件
require("which-key").setup()

-- 2. Bufferline: Tab bar like VSCode
-- 顶部标签页
require("bufferline").setup({
    options = {
        mode = "buffers",
        show_buffer_close_icons = false,
        show_close_icon = false,
        separator_style = "thin",
        always_show_bufferline = false,
    }
})

-- 3. Gitsigns: Git integration in gutter
-- 左侧 Git 状态指示
require("gitsigns").setup()

-- 4. ToggleTerm: Floating terminal
-- 浮动终端配置
require("toggleterm").setup({
    size = 20,
    open_mapping = [[<c-\>]], -- Ctrl + \ to toggle / 快捷键
    direction = 'float',       -- Floating window / 浮动模式
    float_opts = {
        border = 'curved',     -- Curved border / 圆角边框
    }
})
