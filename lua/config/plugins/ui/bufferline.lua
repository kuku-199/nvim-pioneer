-- lua/config/plugins/ui/bufferline.lua
-- bufferline.nvim: Enhanced tab bar with diagnostics markers, git status, animations
-- 增强版标签栏：diagnostics 彩色标记 + 动画感 + 文件图标渐变

return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<TAB>",   ":BufferLineCycleNext<CR>",  desc = "Next Buffer / 下一个文件", mode = "n" },
    { "<S-TAB>", ":BufferLineCyclePrev<CR>",  desc = "Previous Buffer / 上一个文件", mode = "n" },
    { "<M-,>",   ":BufferLineMovePrev<CR>",   desc = "Move Tab Left / 左移标签" },
    { "<M-.>",   ":BufferLineMoveNext<CR>",   desc = "Move Tab Right / 右移标签" },
    { "<leader>bp", ":BufferLineTogglePin<CR>",   desc = "Pin Buffer / 固定标签" },
    { "<leader>bC", ":BufferLineCloseOthers<CR>", desc = "Close Others / 关闭其他" },
  },
  opts = {
    options = {
      -- Display mode / 显示模式
      numbers = "buffer_id",
      -- Indicator style for active buffer / 活动标签指示器
      indicator = {
        icon = "▎",
        style = "icon",
      },
      -- Close/modified icons / 关闭/修改图标
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      -- Separator between tabs / 标签分隔符
      separator_style = "slant",
      -- Show buffer name only (no full path) / 只显示文件名
      name_formatter = function(buf)
        return buf.name:match("[^/]+$")
      end,
      max_name_length = 30,
      max_prefix_length = 30,
      -- Diagnostics display / 诊断显示
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and "󰅚 "
            or e == "warning" and "󰀪 "
            or e == "info" and "󰋽 "
            or e == "hint" and "󰌶 "
          if sym then s = s .. n .. sym end
        end
        return s
      end,
      -- Color filetype icons / 文件类型图标着色
      color_icons = true,
      -- Always show even with 1 buffer / 单文件也显示
      always_show = true,
      -- Hover events (shows diagnostic on hover) / 悬停显示诊断
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      -- Offsets for file explorers / 文件浏览器的偏移
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
      -- Custom buffer filter / 自定义过滤
      custom_filter = function(buf)
        local ft = vim.bo[buf].filetype
        return ft ~= "lazy" and ft ~= "neo-tree" and ft ~= "oil"
      end,
    },
    -- Highlight groups for active/inactive tabs / 活动/非活动标签高亮
    highlights = {
      buffer_selected = {
        bold = true,
        italic = false,
      },
    },
  },
}
