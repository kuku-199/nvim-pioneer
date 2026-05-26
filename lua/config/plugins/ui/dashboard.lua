-- lua/config/plugins/ui/dashboard.lua
-- dashboard-nvim: Sci-fi HUD style startup page / 科幻 HUD 风格启动页
-- NVIM-PIONEER vNext · SYSTEM ONLINE

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Gather system info / 收集系统信息
    local function get_sys_info()
      local ok, lazy = pcall(require, "lazy")
      local plugins = ok and #vim.tbl_keys(lazy.plugins()) or "?"
      local neovim_ver = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
      local os_name = (vim.loop or vim.uv).os_uname().sysname
      local ok2, startup = pcall(function() return vim.fn.reltimestr(vim.fn.reltime()) end)
      local startup_ms = ok2 and string.format("%.1f", tonumber(startup) * 1000) or "?"
      return plugins, neovim_ver, os_name, startup_ms
    end

    local plugins, nvim_ver, os_name, startup_ms = get_sys_info()

    -- Header: ASCII art + system info / 头部：ASCII 艺术 + 系统信息
    local header = {
      "",
      "  ███╗   ██╗██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗ ██████╗ ███╗   ██╗███████╗███████╗██████╗ ",
      "  ████╗  ██║██║   ██║██║████╗ ████║      ██╔══██╗██║██╔═══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗",
      "  ██╔██╗ ██║██║   ██║██║██╔████╔██║█████╗██████╔╝██║██║   ██║██╔██╗ ██║█████╗  █████╗  ██████╔╝",
      "  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║██║   ██║██║╚██╗██║██╔══╝  ██╔══╝  ██╔══██╗",
      "  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ██║╚██████╔╝██║ ╚████║███████╗███████╗██║  ██║",
      "  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝",
      "",
      "  ██╗   ██╗ ███╗   ██╗███████╗██╗  ██╗",
      "  ██║   ██║████╗  ██║██╔════╝╚██╗██╔╝",
      "  ██║   ██║██╔██╗ ██║█████╗   ╚███╔╝ ",
      "  ╚██╗ ██╔╝██║╚██╗██║██╔══╝   ██╔██╗ ",
      "   ╚████╔╝ ██║ ╚████║███████╗██╔╝ ██╗",
      "    ╚═══╝  ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝",
      "",
      "  Neovim v" .. nvim_ver .. "  ·  Plugins: " .. plugins .. "  ·  OS: " .. os_name .. "  ·  Startup: " .. startup_ms .. "ms",
      "  S Y S T E M   O N L I N E",
      "",
    }

    -- Center: interactive shortcuts (doom theme requires {desc,icon,key,action} format)
    -- 交互快捷键（doom 主题要求每项含 desc 字段）
    local center = {
      { icon = "󰊳 ", desc = "Update plugins",     key = "u", action = "Lazy update" },
      { icon = " ", desc = "Find files",          key = "f", action = "Telescope find_files" },
      { icon = " ", desc = "Live grep",           key = "g", action = "Telescope live_grep" },
      { icon = "󰒲 ", desc = "Plugin manager",      key = "l", action = "Lazy" },
      { icon = " ", desc = "Open config",         key = "d", action = "TelescopeDotfiles" },
      { icon = " ", desc = "Switch theme",         key = "t", action = "SwitchTheme" },
      { icon = "⏾ ", desc = "Load session",        key = "s", action = "Telescope persisted" },
      { icon = "󰈆 ", desc = "Quit",                key = "q", action = "qa" },
    }

    require("dashboard").setup({
      theme = "doom",
      config = {
        header = header,
        center = center,
        footer = {},
        week_header = { enable = true },
        mru = { limit = 5 },
        project = { enable = true, limit = 8 },
      },
    })
  end,
}
