-- lua/config/plugins/ui/mini-animate.lua
-- mini.animate: Cursor/scroll/resize/open animations — the "soul" of a modern editor
-- 光标移动/滚动/窗口缩放/打开动画 — 现代编辑器的"灵魂"

return {
  "echasnovski/mini.animate",
  event = "VeryLazy",
  config = function()
    if os.getenv("NVIM_NO_ANIMATION") == "1" then
      require("mini.animate").setup({ enable = false })
      return
    end

    local animate = require("mini.animate")

    animate.setup({
      -- Cursor movement tracking / 光标轨迹
      cursor = {
        enable = true,
        timing = animate.gen_timing.exponential({ duration = 150, unit = "total" }),
        path = animate.gen_path.line({ predicate = function() return true end }),
      },
      -- Vertical scroll animation / 垂直滚动
      scroll = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 80, unit = "total" }),
      },
      -- Window resize / 窗口缩放
      resize = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
      -- Window open / 打开新窗口
      open = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 120, unit = "total" }),
      },
      -- Window close / 关闭窗口
      close = {
        enable = true,
        timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
      },
    })
  end,
}
