local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "unity/"

M.details = {
	dependencies = { "mono", "wget", "unzip" },
}

M.dap_info = {
	name_adapter = "unity",
	name_configuration = "cs",
}

M.config = {
	adapters = {
		type = "executable",
		command = "mono",
		args = { dbg_path .. "extension/bin/UnityDebug.exe" },
		name = "Unity Editor",
	},
	configurations = {
		{
			name = "Unity Editor",
			type = "unity",
			request = "launch",
			path = "Library/EditorInstance.json",
			__exceptionOptions = {},
		},
	},
}

M.installer = {
	before = "",
	install = [[
        wget -O unity-debug.zip https://github.com/Unity-Technologies/vscode-unity-debug/releases/download/Version-3.0.1/unity-debug-3.0.1.vsix
        unzip unity-debug.zip
        echo $PWD
        printf "\n\n\n"
    ]],
	uninstall = "simple",
}

return M
