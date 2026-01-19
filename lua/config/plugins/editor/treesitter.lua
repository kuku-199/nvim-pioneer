-- lua/config/plugins/editor/treesitter.lua
-- PLAN B: SAFE MODE / 方案 B：安全模式
return {
    "nvim-treesitter/nvim-treesitter",
    -- Disable build step to prevent startup failure
    -- 禁用自动构建，防止启动报错
    -- build = ":TSUpdate", 
    event = { "BufReadPost", "BufNewFile" },
    config = function() 
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      
      -- If treesitter is broken, we just exit silently.
      -- 如果 Treesitter 损坏，直接静默退出，不报错。
      if not status_ok then
          vim.notify("⚠️ Treesitter failed to load. Syntax highlighting disabled.", vim.log.levels.WARN)
          return 
      end

      configs.setup({
        -- SAFE MODE: Empty list means NO auto-downloads on startup
        -- 安全模式：列表留空，禁止启动时自动下载，防止崩溃
        ensure_installed = {}, 
        
        -- Disable auto install
        -- 禁止自动安装
        auto_install = false,
        sync_install = false,

        highlight = { enable = true },
        indent = { enable = true }, 
      })
    end
}

