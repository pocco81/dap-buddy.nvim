local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["ccppr_vsc_dbg"][2]
local fn = vim.fn

M.dap_info = {
    name_adapter = "cpptools",
    name_configuration = "cpptools"
}

M.config = {
    adapters = {
        type = "executable",
        name = "cppdbg",
        command = vim.api.nvim_get_runtime_file(dbg_path .. "extension/debugAdapters/OpenDebugAD7", false)[1],
        args = {},
        attach = {
            pidProperty = "processId",
            pidSelect = "ask"
        }
    },
    configurations = {
        {
            name = "Launch (vscode-cpptools)",
            type = "cpptools",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true
        }
    }
}

M.installer = {
    before = "",
    install = [[
		wget https://github.com/microsoft/vscode-cpptools/releases/download/1.4.1/cpptools-linux.vsix
		mv cpptools-linux.vsix cpptools-linux.zip
		unzip cpptools-linux.zip
		chmod +x extension/debugAdapters/{OpenDebugAD7,mono.linux-x86_64}
		cp extension/cppdbg.ad7Engine.json extension/debugAdapters/bin/nvim-dap.ad7Engine.json
	]],
    uninstall = "simple"
}

return M
