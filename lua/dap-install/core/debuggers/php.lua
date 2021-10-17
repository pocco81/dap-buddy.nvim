local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "php/"

M.details = {
	dependencies = { "git", "npm" },
}

M.dap_info = {
	name_adapter = "php",
	name_configuration = "php",
}

M.config = {
	adapters = {
		type = "executable",
		command = "node",
		args = { dbg_path .. "vscode-php-debug/out/phpDebug.js" },
	},
	configurations = {
		{
			type = "php",
			request = "launch",
			name = "Listen for Xdebug",
			port = 9000,
		},
	},
}

M.installer = {
	before = "",
	install = [[
		git clone https://github.com/xdebug/vscode-php-debug.git && cd vscode-php-debug
		npm install && npm run build
	]],
	uninstall = [[
		cd vscode-php-debug &&  npm uninstall .
		cd ../..
		rm -rf php
	]],
}

return M
