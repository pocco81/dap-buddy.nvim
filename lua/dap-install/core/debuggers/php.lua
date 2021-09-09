local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["php_dbg"][2]

M.dap_info = {
    name_adapter = "php",
    name_configuration = "php"
}

M.config = {
    adapters = {
        type = "executable",
        command = "node",
        args = {dbg_path.."vscode-php-debug/out/phpDebug.js"}
    },
    configurations = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9000
        }
    }
}

M.installer = {
    before = "",
    install = [[
		git clone https://github.com/xdebug/vscode-php-debug.git && cd vscode-php-debug
		sudo npm install && sudo npm run build
	]],
    uninstall = [[
		cd vscode-php-debug && sudo npm uninstall .
		cd ../..
		sudo rm -rf php_dbg
	]]
}

return M
