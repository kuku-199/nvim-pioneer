-- lua/config/plugins/tools/persistence.lua
-- persistence.nvim: Automatic session restore — reopen files where you left off
-- 自动 session 恢复 — 重新打开上次关闭时的文件布局

return {
  "olimorris/persisted.nvim",
  event = "VimEnter",
  keys = {
    { "<leader>qs", "<cmd>SessionSave<cr>", desc = "Session: Save / 保存会话" },
    { "<leader>ql", "<cmd>SessionLoad<cr>", desc = "Session: Load / 加载会话" },
    { "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Session: Delete / 删除会话" },
    { "<leader>qf", "<cmd>Telescope persisted<cr>", desc = "Session: Find / 查找会话" },
  },
  opts = {
    -- Save on exit / 退出时自动保存
    save_dir = vim.fn.stdpath("data") .. "/sessions/",
    silent = true,
    -- Use git branch to scope sessions / 用 git 分支隔离会话
    use_git_branch = true,
    -- Auto-save on VimLeave / 退出时自动保存
    autosave = true,
    -- Auto-load if no args / 无启动参数时自动加载
    autoload = true,
    -- Don't save/load these filetypes / 排除以下文件类型
    ignored_dirs = {
      vim.fn.stdpath("data"),
      "/tmp",
    },
    -- Follow symlinks when resolving cwd / 解析 cwd 时跟踪符号链接
    follow_cwd = true,
    -- Telescope integration / Telescope 集成
    telescope = {
      reset_prompt = true,
      theme = "dropdown",
      previewer = true,
      layout_strategy = "center",
      sorting_strategy = "ascending",
      layout_config = { width = 0.6, height = 0.4 },
      mappings = {
        i = {
          ["<C-d>"] = function() require("persisted").actions.delete() end,
        },
        n = {
          ["d"] = function() require("persisted").actions.delete() end,
        },
      },
    },
    -- Commands to run before saving / 保存前执行的命令
    before_save = function()
      -- Close oil/neo-tree before saving to avoid clutter
      -- 保存前关闭文件树避免干扰
      pcall(vim.cmd, "Neotree close")
    end,
  },
}
