-- lua/config/plugins/ui/lualine.lua
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
        local uv = vim.loop or vim.uv

        -- 1. State Management (Persistence)
        -- 状态管理：持久化保存开关设置
        local state_file = vim.fn.stdpath("data") .. "/lualine_state"
        
        -- Default Configuration
        local config = {
            monitor = true,  -- Show CPU/RAM by default / 默认开启监控
            encoding = false -- Hide UTF-8 by default / 默认隐藏编码
        }

        local function save_state()
            local f = io.open(state_file, "w")
            if f then
                -- Save as key=value lines
                for k, v in pairs(config) do
                    f:write(k .. "=" .. (v and "true" or "false") .. "\n")
                end
                f:close()
            end
        end

        local function load_state()
            local f = io.open(state_file, "r")
            if f then
                for line in f:lines() do
                    local key, value = line:match("([^=]+)=([^=]+)")
                    if key and config[key] ~= nil then
                        config[key] = (value == "true")
                    end
                end
                f:close()
            end
        end

        load_state()

        -- 2. Commands (Toggle)
        -- 2. 注册切换命令

        -- :ToggleMonitor (开关 CPU/RAM)
        vim.api.nvim_create_user_command("ToggleMonitor", function()
            config.monitor = not config.monitor
            save_state()
            require('lualine').refresh()
            print("System Monitor: " .. (config.monitor and "ON" or "OFF"))
        end, {})

        -- :ToggleEncoding (开关编码显示)
        vim.api.nvim_create_user_command("ToggleEncoding", function()
            config.encoding = not config.encoding
            save_state()
            require('lualine').refresh()
            print("Encoding Display: " .. (config.encoding and "ON" or "OFF"))
        end, {})

        -- 3. Components Logic
        -- 3. 组件逻辑

        -- A. Smart OS Icon (Arch / Windows / Mac)
        local function os_icon()
            local sysname = uv.os_uname().sysname
            
            -- Windows
            if sysname == "Windows_NT" then return "" end
            
            -- macOS
            if sysname == "Darwin" then return "" end
            
            -- Linux Detection (Read /etc/os-release)
            if sysname == "Linux" then
                local handle = io.open("/etc/os-release", "r")
                if handle then
                    local content = handle:read("*a")
                    handle:close()
                    content = content:lower()
                    
                    if content:match("arch") then return "" end      -- Arch Linux
                    if content:match("ubuntu") then return "" end    -- Ubuntu
                    if content:match("debian") then return "" end    -- Debian
                    if content:match("fedora") then return "" end    -- Fedora
                    if content:match("opensuse") then return "" end  -- openSUSE
                    if content:match("alpine") then return "" end    -- Alpine
                    if content:match("centos") then return "" end    -- CentOS
                end
                return "" -- Generic Linux
            end
            
            return "" -- Unknown
        end

        -- B. Encoding Component (Conditional)
        local function encoding_component()
             if not config.encoding then return "" end
             return vim.opt.encoding:get()
        end

        -- C. Monitor Component (CPU/RAM + Animation)
        local data_refresh_rate = 1500
        local animation_rate = 100
        local spinner_symbols = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
        local spinner_idx = 1
        local last_anim_time = 0
        local last_data_time = 0
        
        local cached_ram = ""
        local cached_cpu = ""
        local prev_cpu = { total = 0, idle = 0 }

        -- Helper colors
        local colors = {
            green  = '#50fa7b',
            yellow = '#f1fa8c',
            red    = '#ff5555',
            cyan   = '#8be9fd',
            purple = '#bd93f9',
            gray   = '#6272a4',
        }
        
        local function get_color(percent)
            if percent < 50 then return { fg = colors.green, gui = 'bold' } 
            elseif percent < 80 then return { fg = colors.yellow, gui = 'bold' } 
            else return { fg = colors.red, gui = 'bold' } 
            end
        end

        local function update_stats()
            local now = uv.now()
            
            -- Animation update (always)
            if now - last_anim_time >= animation_rate then
                spinner_idx = (spinner_idx % #spinner_symbols) + 1
                last_anim_time = now
            end

            -- Data update (throttled)
            if now - last_data_time >= data_refresh_rate then
                -- RAM (Percentage)
                local free = uv.get_free_memory()
                local total = uv.get_total_memory()
                local used_ram_percent = math.floor(((total - free) / total) * 100)
                cached_ram = "RAM: " .. used_ram_percent .. "%%"
                
                -- CPU
                local cpu_info = uv.cpu_info()
                if cpu_info then
                    local curr_total = 0
                    local curr_idle = 0
                    for _, cpu in ipairs(cpu_info) do
                        curr_idle = curr_idle + cpu.times.idle
                        curr_total = curr_total + cpu.times.user + cpu.times.nice + cpu.times.sys + cpu.times.idle + cpu.times.irq
                    end
                    local diff_total = curr_total - prev_cpu.total
                    local diff_idle = curr_idle - prev_cpu.idle
                    prev_cpu.total = curr_total
                    prev_cpu.idle = curr_idle
                    
                    if diff_total > 0 then
                        local usage = math.floor((1 - (diff_idle / diff_total)) * 100)
                        cached_cpu = " CPU: " .. usage .. "%%"
                    end
                end
                
                last_data_time = now
            end
        end

        local function cpu_component()
            if not config.monitor then return "" end
            update_stats() -- Trigger update check
            return cached_cpu
        end

        local function ram_component()
            if not config.monitor then return "" end
            local icon = spinner_symbols[spinner_idx]
            return icon .. " " .. cached_ram
        end
        
        -- Dynamic colors functions
        local function get_cpu_color()
             if not config.monitor then return nil end
             local num = tonumber(cached_cpu:match("(%d+)%%")) or 0
             return get_color(num)
        end
        
        local function get_ram_color()
             if not config.monitor then return nil end
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
            refresh = { statusline = 100 } 
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            
            lualine_x = { 
                { cpu_component, color = get_cpu_color }, 
                { ram_component, color = get_ram_color },      
                { encoding_component, color = { fg = colors.gray } }, -- Conditional Encoding
                { 'filetype', icon_only = true },
                { os_icon, color = { fg = colors.purple, gui = 'bold' } },
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
          }
        }
    end
}
