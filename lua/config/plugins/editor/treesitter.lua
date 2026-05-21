-- lua/config/plugins/editor/treesitter.lua
-- Treesitter: Syntax highlighting, text objects, incremental selection
-- 语法高亮、文本对象、增量选择

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.config").setup {
      -- Auto-install languages that are not installed
      -- 自动安装缺失的语言解析器
      auto_install = true,

      -- Syntax highlighting
      -- 语法高亮
      highlight = { enable = true },

      -- Indentation based on syntax tree
      -- 基于语法树的智能缩进
      indent = { enable = true },

      -- Incremental selection: select larger code blocks
      -- 增量选择：从一个节点逐步扩展到更大的语法单元
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",    -- Start selection / 开始选择
          node_incremental = "<c-space>",  -- Expand selection / 扩大选择范围
          scope_incremental = "<c-s>",     -- Expand to scope / 扩展到作用域
          node_decremental = "<M-space>",  -- Shrink selection / 缩小选择范围
        },
      },

      -- Text objects: operate on code structures
      -- 文本对象：对语法结构进行操作
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump to textobj / 自动跳转到文本对象
          keymaps = {
            -- Function inner/outer
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            -- Class inner/outer
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            -- Parameter inner/outer
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            -- Block inner/outer
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",   -- Next function start / 下一个函数开头
            ["]f"] = "@call.outer",       -- Next call / 下一个调用
            ["]]"] = "@class.outer",      -- Next class start / 下一个类开头
          },
          goto_next_end = {
            ["]M"] = "@function.outer",   -- Next function end / 下一个函数结尾
            ["]["] = "@class.outer",      -- Next class end / 下一个类结尾
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",   -- Previous function start / 上一个函数开头
            ["[f"] = "@call.outer",       -- Previous call / 上一个调用
            ["[["] = "@class.outer",      -- Previous class start / 上一个类开头
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",   -- Previous function end / 上一个函数结尾
            ["[]"] = "@class.outer",      -- Previous class end / 上一个类结尾
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",  -- Swap parameter next / 交换到下一个参数
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",  -- Swap parameter prev / 交换到上一个参数
          },
        },
      },
    }

    -- Register additional file extensions for languages
    -- 注册额外文件类型
    vim.filetype.add { extension = { tf = "terraform" } }
    vim.filetype.add { extension = { tfvars = "terraform" } }
  end,
}
