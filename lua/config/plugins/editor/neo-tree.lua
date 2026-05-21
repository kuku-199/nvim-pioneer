-- lua/config/plugins/editor/neo-tree.lua
-- Neo-tree: Modern file explorer (replaces nvim-tree)
-- 现代文件浏览器，替代 nvim-tree

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Neotree" },
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle File Explorer / 开关文件树" },
    { "<leader>E", ":Neotree reveal<CR>", desc = "Reveal Current File / 定位当前文件" },
  },
  opts = {
    -- Disable netrw
    disable_netrw = true,
    -- Hide dotfiles by default, toggle with 'H'
    hide_dotfiles = false,
    -- Git status integration
    enable_git_status = true,
    enable_diagnostics = true,
    -- Window options
    window = {
      position = "left",
      width = 35,
      mappings = {
        ["<space>"] = "toggle_node",       -- Space to expand/collapse
        ["<2-leftmouse>"] = "open",
        ["l"] = "open",                    -- 'l' to open file/dir
        ["h"] = "close_node",              -- 'h' to close dir
        ["s"] = "open_split",              -- 's' for horizontal split
        ["v"] = "open_vsplit",             -- 'v' for vertical split
        ["t"] = "open_tabnew",             -- 't' for new tab
        ["w"] = "open_with_window_picker", -- 'w' to open in picker
        ["P"] = { "toggle_preview", config = { use_float = true } },
        ["S"] = "open_split",              -- Capital S for split
        ["H"] = "toggle_hidden",           -- Toggle hidden files
        ["/"] = "fuzzy_finder",            -- Fuzzy find files in tree
        ["d"] = "show_debug_info",
        ["R"] = "refresh",
        ["?"] = "show_help",
            ["q"] = "close_window",
      },
    },
    -- Filesystem filter
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
        never_show = {},
      },
      follow_current_file = {
        enabled = true,     -- Auto-reveal current file in tree
        leave_dirs_open = false,
      },
    },
    -- Default source
    default_source = "filesystem",
  },
  config = function(_, opts)
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("neo-tree").setup(opts)
  end,
}
