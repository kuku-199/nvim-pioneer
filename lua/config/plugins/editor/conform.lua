-- lua/config/plugins/editor/conform.lua
-- Conform: Format-on-save with multiple formatter backends
-- 保存自动格式化，替代已归档的 none-ls

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Lazy load before save
  cmd = { "ConformInfo" },
  keys = {
    -- Manual format trigger / 手动触发格式化
    { "<leader>fm", function()
      require("conform").format({ async = false, lsp_fallback = true })
    end, desc = "Format Code / 格式化代码" },
  },
  opts = {
    -- Notify on error
    notify_on_error = true,

    -- Formatter per filetype
    -- 按文件类型选择格式化工具
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      rust = { "rustfmt", lsp_format = "fallback" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      go = { "gofmt" },
      -- JavaScript / TypeScript
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      -- Web
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },
      -- Terraform
      terraform = { "terraform_fmt" },
      -- Misc
      sql = { "sqlfluff" },
      cmake = { "cmake_format" },
    },

    -- Format on save
    -- 保存时自动格式化
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,  -- Fall back to LSP formatter if no conform formatter
    },

    -- Log level
    log_level = vim.log.levels.WARN,
  },
}
