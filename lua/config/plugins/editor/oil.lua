-- lua/config/plugins/editor/oil.lua
-- Oil: Edit directories as buffers (vim-vinegar style file management)
-- 像编辑文件一样编辑目录，快速文件操作

return {
  "stevearc/oil.nvim",
  cmd = { "Oil" },
  keys = {
    { "<leader>o", ":Oil<CR>", desc = "Open Oil (Directory Edit) / 打开目录编辑" },
    { "-", ":Oil<CR>", desc = "Open parent directory / 打开父目录", mode = "n" },
  },
  opts = {
    -- Oil will open in the current working directory
    default_file_explorer = false,
    -- Columns to show
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    -- Keymaps in Oil buffer
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    -- Use the current directory's natural sort
    sort = {
      natural_order = true,
    },
    -- Show dotfiles by default
    show_hidden_files = true,
    -- Watch for filesystem changes
    watch_for_changes = true,
    -- Send LSP progress notifications
    lsp_file_methods = {
      enabled = true,
    },
  },
}
