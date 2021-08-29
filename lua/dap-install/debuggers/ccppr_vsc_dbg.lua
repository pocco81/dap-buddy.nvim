local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["ccppr_vsc_dbg"][2]

M.dap_info = {
	name_adapter = "cpptools",
	name_configuration = "cpp",
}

M.config = {
	adapters = {
		type = "executable",
		command = dbg_path .. "extension/debugAdapters/OpenDebugAD7",
	},
	configurations = {
		{
			name = "Launch file",
			type = "cpptools",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
		{
			name = "Attach to gdbserver :1234",
			type = "cppdbg",
			request = "launch",
			MIMode = "gdb",
			miDebuggerServerAddress = "localhost:1234",
			miDebuggerPath = "/usr/bin/gdb",
			cwd = "${workspaceFolder}",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
		},
	},
}

M.installer = {
	before = "",
	install = [[
		wget $(curl -s https://api.github.com/repos/microsoft/vscode-cpptools/releases/latest | grep browser_ | cut -d\" -f 4 | grep linux.vsix)
		mv cpptools-linux.vsix cpptools-linux.zip
		unzip cpptools-linux.zip
		chmod +x extension/debugAdapters/bin/OpenDebugAD7
		cp extension/cppdbg.ad7Engine.json extension/debugAdapters/bin/nvim-dap.ad7Engine.json
	]],
	uninstall = "simple",
}

return M
