local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["ccppr_vsc_dbg"][2]
local fn = vim.fn

M.dap_info = {
    name_adapter = "cpp",
    name_configuration = ""
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
    configurations = nil
}

M.installer = {
    before = "",
    install = [[
		wget https://github.com/microsoft/vscode-cpptools/releases/download/1.4.1/cpptools-linux-aarch64.vsix
		mv cpptools-linux-aarch64.vsix cpptools-linux-aarch64.zip
		unzip cpptools-linux-aarch64.zip
	]],
    uninstall = "simple"
}

return M
