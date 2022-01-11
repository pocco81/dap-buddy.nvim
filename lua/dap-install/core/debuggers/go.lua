local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "go/"
local fn = vim.fn

M.details = {
	dependencies = { "go", "npm" },
}

M.dap_info = {
	name_adapter = "go",
	name_configuration = "go",
}

M.config = {
	adapters = {
		type = "executable",
		command = "node",
		args = { dbg_path .. "vscode-go/dist/debugAdapter.js" },
	},
	configurations = {
		{
			type = "go",
			name = "Debug",
			request = "launch",
			showLog = false,
			program = "${file}",
			dlvToolPath = fn.exepath("dlv"), -- Adjust to where delve is installed
		},
	},
}

M.installer = {
	before = "",
	install = [[
		git clone https://github.com/go-delve/delve && cd delve
		go install github.com/go-delve/delve/cmd/dlv
		cd ..
		git clone https://github.com/golang/vscode-go && cd vscode-go
		npm install
		npm run compile
	]],
	uninstall = "simple",
}

return M
