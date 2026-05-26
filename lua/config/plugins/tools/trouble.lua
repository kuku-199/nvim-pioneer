-- lua/config/plugins/tools/trouble.lua
-- trouble.nvim v3: Unified diagnostics/references/symbols/quickfix center
-- 统一诊断/引用/符号/快速修复中心 — <leader>xx 一键盘查看所有问题

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble" },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Trouble: Buffer Diagnostics / 当前文件诊断",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble: Workspace Diagnostics / 工作区诊断",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Trouble: Document Symbols / 文件符号",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "Trouble: LSP References / LSP 引用",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Trouble: Location List / 位置列表",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Trouble: Quickfix List / 快速修复列表",
    },
  },
  opts = {
    -- Modes available / 可用模式
    modes = {
      diagnostics = {
        auto_close = true,
        auto_preview = true,
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.35,
        },
      },
      symbols = {
        desc = "document symbols",
        mode = "lsp_document_symbols",
      },
      lsp_references = {
        desc = "LSP references",
        mode = "lsp_references",
      },
      lsp_definitions = {
        desc = "LSP definitions",
        mode = "lsp_definitions",
      },
      loclist = {
        desc = "location list",
        mode = "loclist",
      },
      qflist = {
        desc = "quickfix list",
        mode = "quickfix",
      },
    },
    -- Window appearance / 窗口外观
    icons = {
      indent = {
        top = "│ ",
        middle = "├╴",
        last = "╰╴",
        fold_open = "",
        fold_closed = "",
        ws = "  ",
      },
      folder_closed = "",
      folder_open = "",
    },
    -- Follow current file's diagnostics / 跟随当前文件
    follow = true,
    -- Start in insert mode when editing / 编辑时进入插入模式
    auto_jump = { "lsp_definitions" },
    -- Hide the cursor in Trouble window / 隐藏光标
    focus = true,
    -- Action keymaps / 操作映射
    action_keys = {
      close = "q",
      cancel = "<esc>",
      refresh = "r",
      jump = "<cr>",
      jump_close = "o",
      open_split = "<c-s>",
      open_vsplit = "<c-v>",
      open_tab = "<c-t>",
      preview = "P",
      previous = "k",
      next = "j",
    },
    -- Highlight groups / 高亮组
    indent_lines = true,
    auto_preview = true,
    multiline = true,
    warn_no_results = false,
    open_no_results = false,
    -- Window configuration / 窗口配置
    win = {
      position = "bottom",
      size = 0.35,
      type = "split",
      wo = {
        winblend = 5,
        number = false,
        relativenumber = false,
        signcolumn = "no",
        foldenable = false,
      },
    },
  },
}
