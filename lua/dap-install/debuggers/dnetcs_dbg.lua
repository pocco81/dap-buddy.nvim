local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["dnetcs_dbg"][2]
local fn = vim.fn

M.dap_info = {
    name_adapter = "netcoredbg",
    name_configuration = "cs"
}

M.config = {
    adapters = {
        type = "executable",
        command = dbg_path .. "netcoredbg/netcoredbg",
        args = {"--interpreter=vscode"}
    },
    configurations = {
        {
            type = "netcoredbg",
            name = "launch - netcoredbg",
            request = "launch",
            program = function()
                return fn.input(dbg_path .. "netcoredbg/ManagedPart.dll", fn.getcwd() .. "/bin/Debug/", "${file}")
            end
        }
    }
}

M.installer = {
    before = "",
    install = [[
		wget https://github.com/Samsung/netcoredbg/releases/latest/download/netcoredbg-linux-amd64.tar.gz && tar -xvzf netcoredbg-*
	]],
    uninstall = "simple"
}

return M
