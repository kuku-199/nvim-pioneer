-- lua/config/plugins/ui/bufferline.lua
-- Bufferline: Tab bar at the top showing open files (like Eclipse/VS Code)
-- 顶部的文件标签栏，类似 Eclipse/VS Code 的标签页

return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  keys = {
    -- Cycle through buffers / 循环切换
    { "<TAB>", ":BufferLineCycleNext<CR>", desc = "Next Buffer / 下一个文件", mode = "n" },
    { "<S-TAB>", ":BufferLineCyclePrev<CR>", desc = "Previous Buffer / 上一个文件", mode = "n" },
    -- Move buffer position
    { "<M-,>", ":BufferLineMovePrev<CR>", desc = "Move Buffer Left / 左移标签" },
    { "<M-.>", ":BufferLineMoveNext<CR>", desc = "Move Buffer Right / 右移标签" },
    -- Pin buffer
    { "<leader>bp", ":BufferLineTogglePin<CR>", desc = "Pin Buffer / 固定标签" },
    -- Close other buffers
    { "<leader>bC", ":BufferLineCloseOthers<CR>", desc = "Close Other Buffers / 关闭其他" },
  },
  opts = {
    options = {
      -- Show buffer numbers
      numbers = "none",
      -- Close icon
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      -- Indicator style
      indicator = {
        icon = "▎",
        style = "icon",
      },
      -- Buffer icons
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      -- Show buffer name only (no path)
      name_formatter = function(buf)
        return buf.name:match("[^/]+$")
      end,
      -- Max name length
      max_name_length = 30,
      max_prefix_length = 30,
      -- Don't show in these filetypes
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
      -- Color icons based on filetype
      color_icons = true,
      -- Show bufferline even with 1 buffer
      always_show = true,
      -- Don't show in terminal/bufferline itself
      custom_filter = function(buf, buf_nums)
        -- Hide special buffers
        if vim.bo[buf].filetype == "lazy" then return false end
        if vim.bo[buf].filetype == "neo-tree" then return false end
        if vim.bo[buf].filetype == "oil" then return false end
        return true
      end,
      -- Separator style between tabs
      separator_style = "slant",   -- Options: "slant", "thick", "thin", "padded_slant"
    },
    highlights = nil, -- Use theme default
  },
}
