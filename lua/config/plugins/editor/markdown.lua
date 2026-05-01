return {
  -- 1. Browser Live Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    -- Fallback via shell to prevent git issues (reverts any yarn.lock changes)
    build = "cd app && npx --yes yarn install && git restore .",
 init = function()
 vim.g.mkdp_filetypes = { "markdown" }
 vim.g.mkdp_open_to_the_world = 1
 vim.g.mkdp_open_ip = '127.0.0.1'
 vim.g.mkdp_port = '8080'
 -- 设置默认浏览器，使用 xdg-open 打开系统默认浏览器
 vim.g.mkdp_browser = 'xdg-open'
 -- 预览完成后在命令行显示 URL
 vim.g.mkdp_echo_preview_url = 1
 end,
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview (Browser)" }
    }
  },
  -- 2. In-Editor Rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown", "quarto", "rmd" },
    opts = {
      heading = {
        sign = false,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
      },
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle Render Markdown (In-Editor)" }
    }
  }
}
