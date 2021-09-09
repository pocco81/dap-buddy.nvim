local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "dart/"

M.dap_info = {
    name_adapter = "dart",
    name_configuration = "dart"
}

M.config = {
    adapters = {
        type = "executable",
        command = "node",
        args = {dbg_path.."Dart-Code/out/dist/debug.js", "flutter"}
    },
    configurations = {
        {
            type = "dart",
            request = "launch",
            name = "Launch flutter",
            dartSdkPath = os.getenv("HOME") .. "/flutter/bin/cache/dart-sdk/",
            flutterSdkPath = os.getenv("HOME") .. "/flutter",
            program = "${workspaceFolder}/lib/main.dart",
            cwd = "${workspaceFolder}"
        }
    }
}

M.installer = {
    before = "",
    install = [[
		git clone https://github.com/Dart-Code/Dart-Code
		cd Dart-code && sudo npx webpack --mode production
	]],
    uninstall = "simple"
}

return M
