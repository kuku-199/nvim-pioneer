-- lua/config/plugins/editor/treesitter-context.lua
-- nvim-treesitter-context: Sticky context at top of window (parent function/class header)
-- 粘性上下文 — 窗口顶部固定显示当前函数/类的父级签名

return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    enable = true,
    max_lines = 3,         -- max context lines
    min_window_height = 10, -- don't show for tiny windows
    line_numbers = true,
    multiline_threshold = 1,
    trim_scope = "outer",
    mode = "cursor",       -- follow cursor (vs "topline")
    separator = "─",       -- separator between context and code
    zindex = 30,
    -- Exclude these filetypes / 排除以下文件类型
    filetypes = {
      help = false,
      dashboard = false,
      ["neo-tree"] = false,
      oil = false,
      trouble = false,
      lazy = false,
      mason = false,
      fzf = false,
      toggleterm = false,
    },
  },
}
