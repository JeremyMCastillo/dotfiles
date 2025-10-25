return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"
    local os_name = vim.loop.os_uname().sysname
    local netcoredbg_path = ""

    if os_name == "Linux" then
      netcoredbg_path = "/home/jcast/snap/netcoredbg/current/netcoredbg"
    elseif os_name == "Windows_NT" then
      netcoredbg_path = "C:\\Users\\jcast\\scoop\\apps\\netcoredbg\\current\\netcoredbg"
    end

    dap.adapters.coreclr = {
      type = "executable",
      command = netcoredbg_path,
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
    }
  end,
}
