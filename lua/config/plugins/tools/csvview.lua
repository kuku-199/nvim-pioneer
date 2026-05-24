-- lua/config/plugins/tools/csvview.lua
-- csvview.nvim: CSV/TSV table display with virtual text
-- CSV/TSV 表格化显示，支持分隔符高亮、表头固定、Excel 式导航

return {
  "hat0uma/csvview.nvim",

  ---@module "csvview"
  ---@type CsvView.Options
  opts = {
    parser = {
      -- Comment prefixes to ignore in table display
      -- 表格显示时忽略的注释行前缀
      comments = { "#", "//" },
    },

    view = {
      -- Minimum column width / 最小列宽
      min_column_width = 5,
      -- Spacing between columns / 列间距
      spacing = 2,
      -- Display mode: "highlight" shows delimiter, "border" uses │
      -- 显示模式: "highlight" 高亮分隔符, "border" 用 │ 代替
      display_mode = "highlight",
    },

    -- Keymaps activated only when csvview is enabled
    -- 只在 csvview 启用时生效的快捷键
    keymaps = {
      -- Text objects for field selection / 字段选择文本对象
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },

      -- Excel-like navigation / Excel 式表格导航
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },

  -- Lazily load only when these commands are invoked
  -- 只有执行这些命令时才加载
  cmd = {
    "CsvViewEnable",
    "CsvViewDisable",
    "CsvViewToggle",
    "CsvViewInfo",
  },
}
