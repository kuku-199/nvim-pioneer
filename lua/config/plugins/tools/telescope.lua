-- lua/config/plugins/tools/telescope.lua
-- Telescope: Fuzzy finder with live preview
-- 模糊查找器，支持文件/文本/LSP/ Git 搜索，默认开启预览

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Faster fzf sorter
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    -- UI selector (for things like which-key integration)
    "nvim-telescope/telescope-ui-select.nvim",
    -- Icons
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    -- File search / 文件搜索
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files / 查找文件" },
    -- Full text grep / 全文搜索
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep / 全文搜索" },
    -- Buffer switcher / 缓存切换
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers / 切换缓存" },
    -- Help tags
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help / 查找帮助" },
    -- Git files
    { "<leader>f;", "<cmd>Telescope git_files<cr>", desc = "Git Files / Git 文件" },
    -- Recent files
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files / 最近文件" },
    -- Resume last picker
    { "<leader>f.", "<cmd>Telescope resume<cr>", desc = "Resume / 恢复上次搜索" },
    -- Search current word
    { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Search Word / 搜索当前词" },
    -- Diagnostics
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics / 诊断列表" },
  },
  config = function()
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        -- Layout: preview on the right, 60% width for preview
        -- 布局：右侧预览，预览占 60%
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.6,
            width = { padding = 0 },
            height = { padding = 0 },
          },
        },
        -- Sort files naturally
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        -- Default previewer is already enabled
        -- 预览默认开启
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".venv",
          "__pycache__",
          "target",
          "build",
          ".o",
          ".so",
        },
        -- Mappings
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-l>"] = actions.select_default,  -- Open file
            ["<C-v>"] = actions.select_vertical,
            ["<C-s>"] = actions.select_horizontal,
            ["<C-t>"] = actions.select_tab,
          },
          n = {
            ["q"] = actions.close,
            ["<C-v>"] = actions.select_vertical,
            ["<C-s>"] = actions.select_horizontal,
          },
        },
        -- Show file path in results
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        -- Set theme for certain pickers
        set_env = {
          ["ui-select"] = function()
            return require("telescope.themes").get_dropdown()
          end,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          -- Follow symlinks
          find_command = {
            "rg", "--files", "--hidden", "--glob", "!.git",
          },
        },
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git" },
        },
        buffers = {
          sort_lastused = true,
          mappings = {
            n = {
              ["d"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        fzf = {},
      },
    })

    -- Load extensions
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    -- Additional keymaps not covered by lazy loading
    -- 额外的快捷键（lazy.nvim 无法延迟加载的那些）
    vim.keymap.set("n", "<leader><tab>", builtin.buffers, { desc = "Find Buffers / 切换缓存" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find Buffers / 切换缓存" })
    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({ previewer = false })
      )
    end, { desc = "Fuzzy find in current buffer / 当前文件模糊搜索" })
  end,
}
