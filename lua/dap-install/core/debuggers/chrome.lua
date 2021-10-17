local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "chrome/"

M.details = {
	dependencies = { "npm", "git" },
}

M.dap_info = {
	name_adapter = "chrome",
	name_configuration = {
		"javascriptreact",
		"typescriptreact",
		"typescript",
	},
}

M.config = {
	adapters = {
		type = "executable",
		command = "node",
		args = { dbg_path .. "vscode-chrome-debug/out/src/chromeDebug.js" },
	},
	configurations = {
		{
			type = "chrome",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
			port = 9222,
			webRoot = "${workspaceFolder}",
		},
	},
}

M.installer = {
	before = "",
	install = [[
		git clone https://github.com/Microsoft/vscode-chrome-debug && cd vscode-chrome-debug
		npm install
		npm run build
	]],
	uninstall = [[
		cd vscode-chrome-debug && npm uninstall .
		cd ../..
		rm -rf chrome
	]],
}

return M
