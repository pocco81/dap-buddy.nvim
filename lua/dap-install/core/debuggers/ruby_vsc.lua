local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "ruby_vsc/"

M.details = {
	dependencies = { "wget", "unzip" },
}

M.dap_info = {
	name_adapter = "ruby",
	name_configuration = "ruby",
}

M.config = {
	adapters = {
		type = "executable",
		command = "node",
		args = { dbg_path .. "extension/dist/debugger/main.js" },
	},
	configurations = {
		{
			type = "ruby",
			name = "ruby",
			request = "launch",
			program = "${file}",
			args = { "*${args}" },
		},
	},
}

M.installer = {
	before = "",
	install = [[
        wget https://github.com/rubyide/vscode-ruby/releases/download/v0.25.0/ruby-0.25.0.vsix
        mv ruby-0.25.0.vsix ruby-0.25.0.zip
        unzip ruby-0.25.0.zip
        printf "\n\n\n"
        echo 'Do not forget to add `ruby-debug-ide` gem to your bundle or system!'
    ]],
	uninstall = "simple",
}

return M
