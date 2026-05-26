-- lua/config/plugins/editor/flash.lua
-- flash.nvim: Modern motion engine — treesitter-aware, animated, Telescope-integrated
-- 现代 motion 引擎 — treesitter 感知，动画搜索，Telescope 联动

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- Labels for targets / 标签样式
    labels = "asdfghjklqwertyuiopzxcvbnm",
    label = {
      -- Uppercase labels are easier to spot / 大写标签更易识别
      uppercase = true,
      rainbow = {
        enabled = true,
        shade = 5,
      },
      after = { false, false }, -- don't show after cursor
      before = { false, false },
    },
    -- Search integration / 搜索集成
    search = {
      multi_window = true,
      wrap = true,
    },
    -- Jump integration / 跳转集成
    jump = {
      autojump = false, -- require label press / 需要按标签
      jumplist = true,
    },
    -- Treesitter integration / Treesitter 联动
    modes = {
      char = {
        enabled = true,
        multi_line = true,
        -- Jump to any character with `s` / 按 `s` 跳转到任意字符
        keys = { "s", "f", "F", "t", "T" },
        char_actions = function(motion)
          return {
            [";"] = motion:repeat_last(), -- repeat last / 重复上次
            [","] = motion:repeat_last({ opposite = true }),
          }
        end,
      },
      -- Treesitter node selection / 语法树节点选择
      treesitter = {
        label = { before = false, after = false },
        jump = { pos = "range" },
        search = { wrap = false, multi_window = true },
        remote_op = { restore = true },
      },
      -- Treesitter search / 语法树搜索
      treesitter_search = {
        jump = { pos = "range" },
        search = { multi_window = true, wrap = true },
        remote_op = { restore = true },
      },
    },
    -- Telescope integration / Telescope 下的行为
    prompt = {
      enabled = true,
      prefix = { { "⚡", "FlashPrompt" } },
    },
    -- Highlight groups / 高亮组
    highlight = {
      backdrop = false,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "FlashLabel",
      },
    },
    -- Keymaps for operations on remote selections / 远程操作映射
    remote_op = {
      restore = true,
      window = {
        border = "rounded",
        highlight = "FloatBorder",
      },
    },
  },
  keys = {
    -- Standard flash motions / 标准 flash 动作
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump / 闪电跳转" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter / 语法树跳转" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Flash Remote / 远程操作" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash TS Search / 语法树搜索" },
  },
}
