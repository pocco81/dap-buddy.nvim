local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "lua/"
local fn = vim.fn

M.dap_info = {
	name_adapter = "nlua",
	name_configuration = "lua",
}

M.config = {
	adapters = function(callback, config)
		callback({ type = "server", host = config.host, port = config.port })
	end,
	configurations = {
		{
			type = "nlua",
			request = "attach",
			name = "Attach to running Neovim instance",
			host = function()
				local value = fn.input("Host [127.0.0.1]: ")
				if value ~= "" then
					return value
				end
				return "127.0.0.1"
			end,
			port = function()
				local val = tonumber(fn.input("Port: "))
				assert(val, "Please provide a port number")
				return val
			end,
		},
	},
}

M.installer = {
	before = "",
	install = [[
		echo 'You just need to install this plugin: https://github.com/jbyuki/one-small-step-for-vimkind'
	]],
	uninstall = "simple",
}

return M
