local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["python_dbg"][2]
local fn = vim.fn

M.dap_info = {
    name_adapter = "node2",
    name_configuration = "node2",
}

M.config = {
    adapters = {
        type = "executable",
        command = "node",
        args = {dbg_path .. "vscode-node-debug2/out/src/nodeDebug.js"}
    },
    configurations = {
        {
            type = "node2",
            request = "launch",
            program = "${file}",
            cwd = fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal"
        }
    }
}

M.installer = {
    before = "",
    install = [[
		git clone https://github.com/microsoft/vscode-node-debug2.git && cd vscode-node-debug2
		sudo npm install
		gulp build
	]],
    uninstall = [[
		cd vscode-node-debug2 && sudo npm uninstall
		cd ../..
		sudo rm -rf jsnode_dbg
	]]
}

return M
