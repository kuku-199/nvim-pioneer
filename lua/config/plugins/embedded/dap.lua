-- lua/config/plugins/embedded/dap.lua
-- Debug Adapter Protocol (Debugging)
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui", -- UI for debugging
    "nvim-neotest/nvim-nio", -- Async IO for UI
    "theHamsta/nvim-dap-virtual-text", -- Show variable values in code
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")
    
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()

    -- Auto open UI on debug start
    -- 调试开始时自动打开 UI
    dap.listeners.before.attach.dapui_config = function() ui.open() end
    dap.listeners.before.launch.dapui_config = function() ui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
    dap.listeners.before.event_exited.dapui_config = function() ui.close() end

    -- Keymaps
    -- 调试快捷键 (类似 IDE 风格)
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
  end
}
