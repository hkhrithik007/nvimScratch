local dap = require "dap"
local dapui = require "dapui"
-- Setup dapui
dapui.setup()

-- Kotlin adapter configuration
dap.adapters.kotlin = {
  type = "executable",
  command = "kotlin-debug-adapter",
  options = { auto_continue_if_many_stopped = false },
}

-- Kotlin debug configurations
dap.configurations.kotlin = {
  {
    type = "kotlin",
    request = "launch",
    name = "This file",
    mainClass = function()
      local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
      local fname = vim.api.nvim_buf_get_name(0)
      return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
    end,
    projectRoot = "${workspaceFolder}",
    jsonLogFile = "",
    enableJsonLogging = false,
  },
  {
    type = "kotlin",
    request = "attach",
    name = "Attach to debugging session",
    port = 5005,
    args = {},
    projectRoot = vim.fn.getcwd,
    hostName = "localhost",
    timeout = 2000,
  },
}

-- DAP UI listeners
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
