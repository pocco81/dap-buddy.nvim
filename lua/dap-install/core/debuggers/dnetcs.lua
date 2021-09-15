local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "dnetcs/"
local fn = vim.fn

M.details = {
	dependencies = { "wget", "tar" },
}

M.dap_info = {
	name_adapter = "netcoredbg",
	name_configuration = "cs",
}

M.config = {
	adapters = {
		type = "executable",
		command = dbg_path .. "netcoredbg/netcoredbg",
		args = { "--interpreter=vscode" },
	},
	configurations = {
		{
			type = "netcoredbg",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return fn.input(dbg_path .. "netcoredbg/ManagedPart.dll", fn.getcwd() .. "/bin/Debug/", "file")
			end,
		},
	},
}

M.installer = {
	before = "",
	install = [[
		os=$(uname); if [ "$os" = "Linux" ]; then printf "Detected OS: Linux\n"; wget https://github.com/Samsung/netcoredbg/releases/latest/download/netcoredbg-linux-amd64.tar.gz; elif [ "$os" = "Darwin" ]; then printf "Detected OS: Mac\n"; wget https://github.com/Samsung/netcoredbg/releases/download/1.2.0-786/netcoredbg-osx.tar.gz; fi; tar -xvzf netcoredbg-*
	]],
	uninstall = "simple",
}

return M
