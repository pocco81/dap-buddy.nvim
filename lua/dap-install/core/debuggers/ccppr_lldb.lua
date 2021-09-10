local M = {}

M.dap_info = {
	name_adapter = "cpp",
}

M.config = {
	adapters = {
		type = "executable",
		attach = {
			pidProperty = "pid",
			pidSelect = "ask",
		},
		command = "lldb-vscode", -- my binary was called 'lldb-vscode-11'
		env = {
			LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
		},
		name = "lldb",
	},
}

M.installer = {
	before = "",
	install = [[
		echo 'It seems that you do not need to install this debugger: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode'
	]],
	uninstall = "simple",
}

return M
