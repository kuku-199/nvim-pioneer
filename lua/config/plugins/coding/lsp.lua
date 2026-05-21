-- lua/config/plugins/coding/lsp.lua
-- LSP Configuration (Language Server Protocol)
-- 语言服务器配置
-- Note: Autocompletion moved to blink.lua (blink.cmp)

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Install LSPs automatically
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Automatically install missing tools
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- Status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- Get capabilities from blink.cmp
    -- 使用 blink.cmp 提供的 LSP capabilities
    local ok, blink = pcall(require, "blink.cmp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if ok then
      capabilities = blink.get_lsp_capabilities()
    end

    -- List of servers to install
    local servers = {
      "pyright",       -- Python
      "clangd",        -- C/C++
      "gopls",         -- Go
      "ts_ls",         -- JS/TS
      "lua_ls",        -- Lua
      "html",          -- HTML
      "cssls",         -- CSS
      "jsonls",        -- JSON
      "marksman",      -- Markdown
      "rust_analyzer", -- Rust
    }

    -- Function running when LSP attaches to a buffer
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
      -- Go to declaration / 跳转声明
      keymap("n", "gD", vim.lsp.buf.declaration, opts)
      -- Open floating diagnostic
      keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
      -- Next/prev diagnostic
      keymap("n", "]d", vim.diagnostic.goto_next, opts)
      keymap("n", "[d", vim.diagnostic.goto_prev, opts)

      -- Document highlight
      if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = bufnr,
          group = group,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = bufnr,
          group = group,
          callback = vim.lsp.buf.clear_references,
        })
      end

      -- Inlay hints toggle
      if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        keymap("n", "<leader>th", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
        end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
      end
    end

    -- Initialize Mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Ensure servers are installed
    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_installation = true,
      handlers = {
        -- Default handler for all servers
        function(server_name)
          if server_name == "rust_analyzer" then return end
          lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
        -- Lua special config
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
              Lua = {
                completion = { callSnippet = "Replace" },
                runtime = { version = "LuaJIT" },
                workspace = {
                  checkThirdParty = false,
                  library = vim.api.nvim_get_runtime_file("", true),
                },
                diagnostics = {
                  globals = { "vim" },
                  disable = { "missing-fields" },
                },
                format = { enable = false },
              },
            },
          })
        end,
      },
    })

    -- Ensure extra tools are installed
    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",  -- Lua formatter
      },
    })
  end,
}
