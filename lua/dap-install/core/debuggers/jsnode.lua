local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "jsnode/"
local fn = vim.fn

M.details = {
	dependencies = { "npm", "git" },
}

M.dap_info = {
	name_adapter = "node2",
	name_configuration = "javascript",
}

M.config = {
	adapters = {
		type = "executable",
		command = "node",
		args = { dbg_path .. "vscode-node-debug2/out/src/nodeDebug.js" },
	},
	configurations = {
		{
			type = "node2",
			request = "launch",
			program = "${workspaceFolder}/${file}",
			cwd = fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			console = "integratedTerminal",
		},
	},
}

M.installer = {
	before = "",
	install = [[
		git clone https://github.com/microsoft/vscode-node-debug2.git && cd vscode-node-debug2
		npm install
		npm run build
	]],
	uninstall = [[
		cd vscode-node-debug2 && npm uninstall .
		cd ../..
		rm -rf jsnode
	]],
}

return M
