-- lua/config/plugins/ui/incline.lua
-- incline.nvim: Floating filename bar at the top of each window
-- 每个窗口顶部的浮动标题栏 — 文件名 + 诊断 + 修改标记

return {
  "b0o/incline.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local devicons = require("nvim-web-devicons")

    local function get_diag_icons(bufnr)
      local ok, counts = pcall(vim.diagnostic.count, bufnr)
      if not ok or not counts then return "" end
      local total = (counts[vim.diagnostic.severity.ERROR] or 0)
        + (counts[vim.diagnostic.severity.WARN] or 0)
        + (counts[vim.diagnostic.severity.INFO] or 0)
        + (counts[vim.diagnostic.severity.HINT] or 0)
      if total == 0 then return "" end

      local parts = {}
      if (counts[vim.diagnostic.severity.ERROR] or 0) > 0 then
        table.insert(parts, "󰅚" .. counts[vim.diagnostic.severity.ERROR])
      end
      if (counts[vim.diagnostic.severity.WARN] or 0) > 0 then
        table.insert(parts, "󰀪" .. counts[vim.diagnostic.severity.WARN])
      end
      return table.concat(parts, " ")
    end

    require("incline").setup({
      window = {
        margin = { horizontal = 1, vertical = 0 },
        padding = { left = 1, right = 1 },
        placement = { horizontal = "right", vertical = "top" },
      },
      render = function(props)
        local bufname = vim.api.nvim_buf_get_name(props.buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")
        if filename == "" then filename = "[No Name]" end

        local ft = vim.bo[props.buf].filetype
        local icon, icon_hl = devicons.get_icon_color(filename, ft, { default = true })

        local modified = vim.bo[props.buf].modified and " ●" or ""
        local diag = get_diag_icons(props.buf)
        if diag ~= "" then diag = "  " .. diag end

        return {
          { " ", group = "InclineNormal" },
          { icon .. " ", group = icon_hl },
          { filename, group = "InclineNormalNC" },
          { modified, group = "DiagnosticWarn" },
          { diag, group = "InclineNormal" },
          { " ", group = "InclineNormal" },
        }
      end,
      hide = {
        cursorline = true,
        focused_win = false,
        only_win = false,
      },
    })
  end,
}
