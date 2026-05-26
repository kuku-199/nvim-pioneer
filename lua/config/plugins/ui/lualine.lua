-- lua/config/plugins/ui/lualine.lua
-- lualine.nvim: Enhanced statusline with system monitor, git, LSP, Copilot, venv, cwd, macro
-- 增强版状态栏：系统监控 + Git + LSP + Copilot + Python venv + cwd + 宏录制

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local uv = vim.loop or vim.uv

    -- ══════════════════════════════════════════
    -- 1. State Management (Persistence)
    -- ══════════════════════════════════════════
    local state_file = vim.fn.stdpath("data") .. "/lualine_state"
    local config = {
      monitor  = true,
      encoding = false,
    }

    local function save_state()
      local f = io.open(state_file, "w")
      if f then
        for k, v in pairs(config) do f:write(k .. "=" .. (v and "true" or "false") .. "\n") end
        f:close()
      end
    end

    local function load_state()
      local f = io.open(state_file, "r")
      if f then
        for line in f:lines() do
          local key, value = line:match("([^=]+)=([^=]+)")
          if key and config[key] ~= nil then config[key] = (value == "true") end
        end
        f:close()
      end
    end
    load_state()

    -- ══════════════════════════════════════════
    -- 2. Commands / 命令
    -- ══════════════════════════════════════════
    vim.api.nvim_create_user_command("ToggleMonitor", function()
      config.monitor = not config.monitor
      save_state()
      require("lualine").refresh()
      print("System Monitor: " .. (config.monitor and "ON" or "OFF"))
    end, {})

    vim.api.nvim_create_user_command("ToggleEncoding", function()
      config.encoding = not config.encoding
      save_state()
      require("lualine").refresh()
      print("Encoding Display: " .. (config.encoding and "ON" or "OFF"))
    end, {})

    -- ══════════════════════════════════════════
    -- 3. Colors: muted blue for status, filename stays default
    -- ══════════════════════════════════════════

    local blue  = function() return { fg = "#8faac8" } end
    local warm  = function() return { fg = "#e8d5b0", gui = "bold" } end

    -- ══════════════════════════════════════════
    -- 4. Component: OS Icon / OS 图标
    -- ══════════════════════════════════════════
    local function os_icon()
      local sysname = uv.os_uname().sysname
      if sysname == "Windows_NT" then return "" end
      if sysname == "Darwin" then return "" end
      if sysname == "Linux" then
        local handle = io.open("/etc/os-release", "r")
        if handle then
          local content = handle:read("*a"):lower(); handle:close()
          if content:match("arch") then return "" end
          if content:match("ubuntu") then return "" end
          if content:match("debian") then return "" end
          if content:match("fedora") then return "" end
        end
        return ""
      end
      return ""
    end

    -- ══════════════════════════════════════════
    -- 5. Component: Encoding (Conditional) / 编码
    -- ══════════════════════════════════════════
    local function encoding_component()
      if not config.encoding then return "" end
      return vim.opt.encoding:get()
    end

    -- ══════════════════════════════════════════
    -- 6. Component: CPU/RAM Monitor / 系统监控
    -- ══════════════════════════════════════════
    local data_refresh_rate = 1500
    local last_data_time = 0
    local cached_ram = 0
    local cached_cpu = 0
    local prev_cpu = { total = 0, idle = 0 }

    local function update_stats()
      local now = uv.now()
      if now - last_data_time >= data_refresh_rate then
        local free = uv.get_free_memory()
        local total = uv.get_total_memory()
        cached_ram = math.floor(((total - free) / total) * 100)
        local cpu_info = uv.cpu_info()
        if cpu_info then
          local curr_total, curr_idle = 0, 0
          for _, cpu in ipairs(cpu_info) do
            curr_idle = curr_idle + cpu.times.idle
            curr_total = curr_total + cpu.times.user + cpu.times.nice + cpu.times.sys + cpu.times.idle + cpu.times.irq
          end
          local diff_total = curr_total - prev_cpu.total
          local diff_idle = curr_idle - prev_cpu.idle
          prev_cpu.total = curr_total; prev_cpu.idle = curr_idle
          if diff_total > 0 then
            cached_cpu = math.floor((1 - (diff_idle / diff_total)) * 100)
          end
        end
        last_data_time = now
      end
    end

    local function cpu_component()
      if not config.monitor then return "" end
      update_stats()
      return " " .. cached_cpu .. "%%"
    end

    local function ram_component()
      if not config.monitor then return "" end
      return " " .. cached_ram .. "%%"
    end

    -- ══════════════════════════════════════════
    -- 7. Component: Python venv / Python 虚拟环境
    -- ══════════════════════════════════════════
    local function python_venv()
      -- Check for common venv indicators / 检查常见 venv 标记
      local venv = os.getenv("VIRTUAL_ENV")
      if venv then
        local name = vim.fn.fnamemodify(venv, ":t")
        return " " .. name
      end
      local conda = os.getenv("CONDA_DEFAULT_ENV")
      if conda and conda ~= "base" then
        return " " .. conda
      end
      -- Check if .venv exists in cwd / 检查 cwd 是否有 .venv
      if vim.fn.isdirectory(".venv") == 1 then
        return " .venv"
      end
      return ""
    end

    -- ══════════════════════════════════════════
    -- 8. Component: CWD (truncated) / 当前工作目录
    -- ══════════════════════════════════════════
    local function cwd_component()
      local cwd = vim.fn.getcwd()
      local home = os.getenv("HOME")
      if home and cwd:sub(1, #home) == home then
        cwd = "~" .. cwd:sub(#home + 1)
      end
      -- Truncate to max 30 chars / 最多 30 字符
      if #cwd > 30 then
        local parts = vim.split(cwd, "/")
        if #parts > 3 then
          cwd = table.concat({ parts[1], parts[2], "…", parts[#parts] }, "/")
        end
      end
      if cwd == "" or cwd == "~" then return "" end
      return " " .. cwd
    end

    -- ══════════════════════════════════════════
    -- 9. Component: Recording macro / 宏录制提示
    -- ══════════════════════════════════════════
    local function macro_component()
      local reg = vim.fn.reg_recording()
      if reg ~= "" then
        return "  REC @" .. reg
      end
      return ""
    end

    -- ══════════════════════════════════════════
    -- 10. Component: LSP Status / LSP 连接状态
    -- ══════════════════════════════════════════
    local function lsp_status()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then return "" end

      local names = {}
      for _, c in ipairs(clients) do
        -- Shorten common names / 缩短常见名称
        local n = c.name
        if n == "rust_analyzer" then n = "rs" end
        if n == "pyright" then n = "py" end
        if n == "clangd" then n = "c/c++" end
        if n == "ts_ls" then n = "ts" end
        if n == "lua_ls" then n = "lua" end
        if n == "gopls" then n = "go" end
        table.insert(names, n)
      end
      return "󰄭 " .. table.concat(names, ",")
    end

    -- ══════════════════════════════════════════
    -- 11. Component: Copilot Status / Copilot 状态
    -- ══════════════════════════════════════════
    local function copilot_status()
      local ok, copilot = pcall(function()
        return require("copilot.client")
      end)
      if not ok then return "" end

      local status = copilot.status()
      if status == "Normal" then
        return " " -- active
      elseif status == "Warning" then
        return " " -- warning
      elseif status == "InProgress" then
        return " " -- processing
      end
      return ""
    end

    -- ══════════════════════════════════════════
    -- 12. Lualine Setup / lualine 配置
    -- ══════════════════════════════════════════
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = { statusline = 100 },
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "neo-tree", "oil", "Trouble" },
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diff",
          "diagnostics",
        },
        lualine_c = {
          { "filename", color = warm },
          { macro_component, color = blue },
        },
        lualine_x = {
          { copilot_status,  color = blue },
          { lsp_status,      color = blue },
          { python_venv,     color = blue },
          { cwd_component,   color = blue },
          { encoding_component, color = blue },
          { cpu_component,   color = blue },
          { ram_component,   color = blue },
          { os_icon,         color = blue, padding = { left = 1, right = 1 } },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
