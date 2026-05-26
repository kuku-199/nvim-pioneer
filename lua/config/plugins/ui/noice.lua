-- lua/config/plugins/ui/noice.lua
-- noice.nvim: Modern cmdline, messages, popupmenu, and notifications UI
-- 现代化命令行 / 消息 / 弹出菜单 / 通知 UI — JetBrains/Cursor 级体验

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",   -- UI component library (already installed)
    "rcarriga/nvim-notify",    -- Notification engine / 通知引擎
  },
  opts = {
    -- LSP: let fidget handle progress, noice handles hover/signature
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      progress = { enabled = false },
      hover = { enabled = true },
      signature = { enabled = true },
      message = { enabled = true },
    },
    -- Messages: compact mini view / 消息：右下角 mini 模式
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
      view_history = "popup",
      view_search = "virtualtext",
    },
    -- Let blink.cmp handle popupmenu / 补全由 blink.cmp 处理
    popupmenu = { enabled = false },
    -- Cmdline: floating popup / 命令行：浮动窗口
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
        lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*$", "^:%s*Lua%s+" }, icon = "", lang = "lua" },
        help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
        input = {},
      },
    },
    -- Notify integration / 通知
    notify = { enabled = true, view = "notify" },
    -- Window styles / 窗口样式
    views = {
      cmdline_popup = {
        border = { style = "rounded", padding = { 0, 1 } },
        size = { width = 60, height = "auto" },
        position = { row = "50%", col = "50%" },
      },
      mini = {
        timeout = 3000,
        reverse = true,
        win_options = {
          winblend = 5,
        },
      },
    },
    -- Presets / 预设
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    -- Suppress noisy messages / 抑制嘈杂消息
    routes = {
      { filter = { event = "msg_show", kind = "", find = "%d+L, %d+B" }, view = "mini" },
      { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
      { filter = { event = "msg_show", kind = "", find = "fewer lines" }, view = "mini" },
      { filter = { event = "msg_show", kind = "", find = "more lines" }, view = "mini" },
      { filter = { event = "msg_show", kind = "", find = "No information available" }, opts = { skip = true } },
    },
  },
}
