-- lua/config/plugins/tools/spectre.lua
-- nvim-spectre: Modern global search & replace panel
-- 现代化全局搜索替换面板 — 大型工程（C++/YOLO）必备

return {
  "nvim-pack/nvim-spectre",
  cmd = { "Spectre" },
  keys = {
    { "<leader>sr", "<cmd>Spectre<cr>", desc = "Spectre: Search & Replace / 全局搜索替换" },
    { "<leader>sw", function()
      -- Search current word under cursor / 搜索光标下单词
      require("spectre").open_visual({ select_word = true })
    end, desc = "Spectre: Search Current Word / 搜索当前词" },
    { "<leader>sp", function()
      -- Search in current file / 在当前文件搜索
      require("spectre").open_file_search({ select_word = true })
    end, desc = "Spectre: Search Current File / 搜索当前文件" },
  },
  opts = {
    -- UI configuration
    open_cmd = "30vnew", -- open in a 30-col vertical split
    live_update = true,  -- live preview as you type
    is_insert_mode = false,
    -- Search/replace paths
    default = {
      find = {
        -- Use ripgrep for search / 用 ripgrep 搜索
        cmd = "rg",
        options = { "hidden", "smart-case", "--color=never" },
      },
      replace = {
        cmd = "sed",
        options = { "i" },
      },
    },
    -- Color scheme
    highlight = {
      ui = "String",
      search = "DiffAdd",
      replace = "DiffDelete",
      headers = "Function",
    },
    -- Don't close on replace / 替换后不关闭
    is_close_on_replace = false,
    -- Panel mappings
    mapping = {
      ["toggle_line"] = { map = "<leader>d", cmd = "<cmd>lua require('spectre').toggle_line()<CR>", desc = "toggle item" },
      ["enter_file"] = { map = "<cr>", cmd = "<cmd>lua require('spectre.actions').select_entry()<cr>", desc = "goto file" },
      ["send_to_qf"] = { map = "<leader>q", cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>", desc = "send to quickfix" },
      ["replace_cmd"] = { map = "<leader>r", cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>", desc = "replace all" },
      ["change_viewport"] = { map = "<leader>v", cmd = "<cmd>lua require('spectre').change_view()<CR>", desc = "change layout" },
    },
  },
}
