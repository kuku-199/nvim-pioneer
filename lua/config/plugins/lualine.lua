-- lua/config/plugins/lualine.lua

-- --- Configuration / 配置区域 ---

-- 1. Data Refresh Rate (CPU/RAM numbers)
-- 1. 数据刷新频率 (CPU/RAM 数值更新)
local data_refresh_rate = 1000 -- 1000ms = 1s

-- 2. Animation Refresh Rate (Spinner icon)
-- 2. 动画刷新频率 (转圈圈图标速度)
local animation_rate = 500 -- 500ms

-- --- System Monitor Logic / 系统监控逻辑 ---

-- Global toggle for system monitor
vim.g.monitor_enable = true

vim.api.nvim_create_user_command("ToggleMonitor", function()
    vim.g.monitor_enable = not vim.g.monitor_enable
    print("System Monitor: " .. (vim.g.monitor_enable and "ON" or "OFF"))
    require('lualine').refresh()
end, {})

local spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
local spinner_idx = 1
local last_anim_time = 0 -- Timestamp for animation

-- Theme Colors
local colors = {
    green  = '#50fa7b',
    yellow = '#f1fa8c',
    red    = '#ff5555',
    cyan   = '#8be9fd',
    purple = '#bd93f9',
    orange = '#ffb86c',
}

local function get_color(percent)
    if percent < 50 then return { fg = colors.green, gui = 'bold' } 
    elseif percent < 80 then return { fg = colors.orange, gui = 'bold' } 
    else return { fg = colors.red, gui = 'bold' } 
    end
end

-- Component: Smart OS Icon
local function os_icon()
    local sysname = vim.loop.os_uname().sysname
    if sysname == "Windows_NT" then return "" end
    if sysname == "Darwin" then return "" end
    local handle = io.open("/etc/os-release", "r")
    if handle then
        local content = handle:read("*a")
        handle:close()
        content = content:lower()
        if content:match('id="?arch"?') or content:match('id_like="?arch"?') then return "" end
        if content:match('id="?ubuntu"?') then return "" end
        if content:match('id="?debian"?') then return "" end
        if content:match('id="?fedora"?') then return "" end
        if content:match('id="?opensuse"?') then return "" end
        if content:match('id="?alpine"?') then return "" end
        if content:match('id="?centos"?') then return "" end
    end
    return "" 
end

-- --- Optimized RAM Component (Caching) ---
local cached_ram_text = ""
local last_ram_time = 0

local function ram_component()
  if not vim.g.monitor_enable then return "" end
  
  local now = vim.loop.now()
  
  -- 1. Update Spinner Animation (Independent of data)
  -- 1. 更新动画 (独立于数据)
  if now - last_anim_time >= animation_rate then
      spinner_idx = (spinner_idx % #spinner_symbols) + 1
      last_anim_time = now
  end
  local icon = spinner_symbols[spinner_idx]

  -- 2. Update RAM Data (Only if interval passed)
  -- 2. 更新内存数据 (仅当时间间隔到达时)
  if now - last_ram_time >= data_refresh_rate then
      local uv = vim.loop
      local free = uv.get_free_memory()
      local total = uv.get_total_memory()
      local used_percent = (total - free) / total * 100
      cached_ram_text = string.format("RAM: %.0f%%%%", used_percent)
      last_ram_time = now
  end
  
  -- Return combined result (Real-time icon + Cached text)
  return icon .. " " .. cached_ram_text
end

-- --- Optimized CPU Component (Caching) ---
local prev_idle = 0
local prev_total = 0
local cached_cpu_text = ""
local last_cpu_time = 0

local function cpu_component()
  if not vim.g.monitor_enable then return "" end
  
  local now = vim.loop.now()
  
  -- Check if we need to update data
  -- 检查是否需要更新数据，如果时间没到，直接返回缓存
  -- This prevents the value from jumping when selecting text with mouse!
  if now - last_cpu_time < data_refresh_rate and cached_cpu_text ~= "" then
      return cached_cpu_text
  end

  local handle = io.open("/proc/stat", "r")
  if not handle then return "" end
  
  local content = handle:read("*l")
  handle:close()

  local user, nice, system, idle, iowait, irq, softirq, steal =
      content:match("(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)")

  if not user then return "" end

  local current_idle = tonumber(idle) + tonumber(iowait)
  local current_total = tonumber(user) + tonumber(nice) + tonumber(system) +
                        tonumber(irq) + tonumber(softirq) + tonumber(steal) +
                        current_idle

  local diff_idle = current_idle - prev_idle
  local diff_total = current_total - prev_total
  local usage = 0

  if diff_total > 0 then
      usage = ((diff_total - diff_idle) / diff_total) * 100
  end

  prev_idle = current_idle
  prev_total = current_total
  
  -- Update Cache
  cached_cpu_text = string.format(" CPU: %.0f%%%%", usage)
  last_cpu_time = now

  return cached_cpu_text
end

local function get_ram_color()
    if not vim.g.monitor_enable then return nil end
    local uv = vim.loop
    local free = uv.get_free_memory()
    local total = uv.get_total_memory()
    return get_color((total - free) / total * 100)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto', 
    component_separators = '|',
    section_separators = '',
    refresh = { 
        statusline = 100, -- Check often for animation, but calculation is throttled
        tabline = 1000,
        winbar = 1000
    } 
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    
    lualine_x = { 
        { cpu_component, color = { fg = colors.cyan, gui = 'bold' } }, 
        { ram_component, color = get_ram_color },      
        -- 'encoding', 
        { 'filetype', colored = true, icon_only = false },
        { os_icon, color = { fg = colors.purple, gui = 'bold' } },
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
} 
