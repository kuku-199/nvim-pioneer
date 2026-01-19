-- lua/config/plugins/coding/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
  },
  config = function()
      local lspconfig = require('lspconfig')
      local mason = require('mason')
      local mason_lspconfig = require('mason-lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      -- List of servers to install
      -- 需要自动安装的语言服务器列表
      local servers = {
          "pyright",       -- Python
          "clangd",        -- C/C++
          "gopls",         -- Go
          "ts_ls",         -- JS/TS
          "lua_ls",        -- Lua
          "html",          -- HTML
          "cssls",         -- CSS
          "jsonls",        -- JSON
          "rust_analyzer"  -- Rust
      }

      -- Capabilities for auto-completion
      -- 补全能力设置
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Function running when LSP attaches to a buffer
      -- 当 LSP 连接到缓冲区时执行的函数 (设置快捷键)
      local on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          local keymap = vim.keymap.set
          -- Go to definition / 跳转定义
          keymap("n", "gd", vim.lsp.buf.definition, opts)
          -- Show hover info / 显示悬停信息
          keymap("n", "K", vim.lsp.buf.hover, opts)
          -- Rename symbol / 重命名
          keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
          -- Code Action / 代码操作
          keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          -- Find references / 查找引用
          keymap("n", "gr", vim.lsp.buf.references, opts)
      end

      -- Initialize Mason
      -- 初始化 Mason 包管理器
      mason.setup({ ui = { icons = { package_installed = "✓", package_pending = "➜", package_uninstalled = "✗" } } })

      -- Setup Mason-LSPConfig
      -- 配置 Mason 与 LSP 的连接
      mason_lspconfig.setup({
          ensure_installed = servers, -- Auto install servers / 自动安装
          automatic_installation = true,
          -- Handlers handle the setup automatically
          -- 使用 handlers 自动处理 setup
          handlers = {
              -- Default handler for all servers
              -- 默认处理程序
              function(server_name)
                  lspconfig[server_name].setup({
                      on_attach = on_attach,
                      capabilities = capabilities,
                  })
              end,
              
              -- Specific configuration for Lua
              -- Lua 语言的特殊配置
              ["lua_ls"] = function()
                  lspconfig.lua_ls.setup({
                      on_attach = on_attach,
                      capabilities = capabilities,
                      settings = {
                          Lua = {
                              diagnostics = { globals = { "vim" } }, -- Recognize 'vim' global / 识别 vim 全局变量
                          },
                      },
                  })
              end,
          }
      })

      -- Setup Auto-completion (nvim-cmp)
      -- 配置自动补全
      local cmp = require('cmp')
      cmp.setup({
          mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll docs up / 向上滚动文档
              ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll docs down / 向下滚动文档
              ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion / 触发补全
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection / 确认选择
          }),
          sources = cmp.config.sources({
              { name = 'nvim_lsp' }, -- LSP source / LSP 源
              { name = 'luasnip' },  -- Snippets / 代码片段
              { name = 'path' },     -- File paths / 文件路径
          }, {
              { name = 'buffer' },   -- Buffer words / 当前文件单词
          })
      })
  end
}
