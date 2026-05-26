-- lua/config/plugins/tools/telescope.lua
-- Telescope: Fuzzy finder with live preview / 模糊查找器
-- Note: vim.ui.select handled by dressing.nvim (replaces telescope-ui-select)

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Faster fzf sorter / fzf 排序器
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    -- Icons
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find Files / 查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",     desc = "Live Grep / 全文搜索" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",        desc = "Find Buffers / 切换缓存" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",      desc = "Find Help / 查找帮助" },
    { "<leader>f;", "<cmd>Telescope git_files<cr>",      desc = "Git Files / Git 文件" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",       desc = "Recent Files / 最近文件" },
    { "<leader>f.", "<cmd>Telescope resume<cr>",         desc = "Resume / 恢复上次搜索" },
    { "<leader>fw", "<cmd>Telescope grep_string<cr>",    desc = "Search Word / 搜索当前词" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",    desc = "Diagnostics / 诊断列表" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols / 文件符号" },
    { "<leader>fgc", "<cmd>Telescope git_commits<cr>",   desc = "Git Commits / 提交历史" },
    { "<leader>fgb", "<cmd>Telescope git_branches<cr>",  desc = "Git Branches / 分支" },
  },
  config = function()
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    require("telescope").setup({
      defaults = {
        -- Rounded border for consistency / 统一圆角
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- Layout: preview on the right / 右侧预览
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.6,
            width = { padding = 0 },
            height = { padding = 0 },
          },
        },
        -- Natural file sorting
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        file_ignore_patterns = {
          "node_modules", ".git", ".venv", "__pycache__",
          "target", "build", "%.o$", "%.so$",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-l>"] = actions.select_default,
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
        path_display = {
          filename_first = { reverse_directories = true },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git" },
        },
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git" },
        },
        buffers = {
          sort_lastused = true,
          mappings = { n = { ["d"] = actions.delete_buffer } },
        },
      },
      extensions = {
        fzf = {},
      },
    })

    -- Load fzf extension
    pcall(require("telescope").load_extension, "fzf")

    -- Extra keymaps / 额外快捷键
    vim.keymap.set("n", "<leader><tab>",  builtin.buffers, { desc = "Find Buffers / 切换缓存" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find Buffers / 切换缓存" })
    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(
        require("telescope.themes").get_dropdown({ previewer = false })
      )
    end, { desc = "Fuzzy find in current buffer / 当前文件模糊搜索" })

    -- Custom dotfiles picker / 自定义 dotfiles 搜索
    vim.api.nvim_create_user_command("TelescopeDotfiles", function()
      local dotfiles_path = vim.fn.stdpath("config")
      builtin.find_files({
        cwd = dotfiles_path,
        prompt_title = "Dotfiles",
      })
    end, { desc = "Search dotfiles / 搜索配置文件" })
  end,
}
