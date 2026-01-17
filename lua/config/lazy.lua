-- lua/config/lazy.lua
-- Bootstrap lazy.nvim (Plugin Manager)
-- 自动安装插件管理器 lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if file exists
-- 检查文件是否存在
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  print("⬇️  Cloning lazy.nvim plugin manager...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Robust Error Handling
-- 错误捕获：防止因网络问题下载失败导致的报错
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    -- Normalize path for Windows display. 
    -- We use string.char(92) for backslash to avoid JS regex parsing errors.
    local display_path = lazypath:gsub("/", string.char(92))

    print(" ")
    print("❌ Error: lazy.nvim module not found!")
    print("---------------------------------------------------")
    print("⚠️  Network Issue Detected / 检测到网络问题")
    print("Git clone failed to download the plugin manager.")
    print("Git 下载失败，通常是因为 GitHub 连接不稳定。")
    print(" ")
    print("👉 Solution / 解决方法:")
    print("Run this command in your terminal manually:")
    print("请在终端手动运行以下命令尝试下载：")
    print(" ")
    print("git clone https://github.com/folke/lazy.nvim.git " .. display_path)
    print(" ")
    return
end

lazy.setup({
  -- 1. UI Plugins / 界面插件
  { 
      "nvim-lualine/lualine.nvim", 
      config = function() require("config.plugins.lualine") end 
  },
  { 
      "nvim-tree/nvim-tree.lua", 
      config = function() require("config.plugins.tree") end 
  },
  -- [NEW] Icon Driver / 图标驱动
  -- Crucial for showing icons in Lualine and Telescope
  -- 必须安装这个插件，Lualine 才能显示漂亮的图标
  { "nvim-tree/nvim-web-devicons" },
  
  -- 2. Fuzzy Finder / 模糊查找
  { 
      "nvim-telescope/telescope.nvim", 
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function() require("config.plugins.telescope") end 
  },

  -- 3. LSP & Completion / 语言服务与补全
  {
      "neovim/nvim-lspconfig",
      dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "hrsh7th/nvim-cmp",
          "hrsh7th/cmp-nvim-lsp",
          "L3MON4D3/LuaSnip",
      },
      config = function() require("config.plugins.lsp") end
  },

  -- 4. Syntax Highlighting / 语法高亮
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      -- Lazy load on file open to avoid startup errors
      -- 懒加载：仅在打开文件时加载，防止启动报错
      event = { "BufReadPost", "BufNewFile" },
      config = function() 
        -- Check if module exists before loading to prevent startup errors
        -- 检查模块是否存在，防止因插件未安装而报错
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return 
        end

        configs.setup({
          ensure_installed = { "c", "lua", "vim", "python", "javascript", "typescript", "go", "rust", "markdown", "markdown_inline" },
          auto_install = true,
          highlight = { enable = true },
        })
      end
  },

  -- 5. Extra Tools / 增强工具
  {
      "folke/which-key.nvim",
      "akinsho/bufferline.nvim",
      "lewis6991/gitsigns.nvim",
      "akinsho/toggleterm.nvim",
      config = function() require("config.plugins.extras") end
  },

  -- 6. Markdown Preview / Markdown 预览
  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && npm install",
      init = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
  },

  -- 7. Themes / 主题包
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "EdenEast/nightfox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/dracula.nvim" }, -- Dracula Theme
})
