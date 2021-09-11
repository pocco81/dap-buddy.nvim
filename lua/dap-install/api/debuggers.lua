local M = {}

local utils_paths = require("dap-install.utils.paths.init")

function M.get_debuggers()
	return require("dap-install.core.debuggers_list").debuggers
end

function M.get_installed_debuggers()
	local dbg_list = M.get_debuggers()
	local installed_debuggers = {}
	local installation_path = require("dap-install.config.settings").options["installation_path"]

	for debugger, _ in pairs(dbg_list) do
		if utils_paths.assert_dir(installation_path .. debugger .. "/") == 1 then
			table.insert(installed_debuggers, debugger)
		end
	end

	return installed_debuggers
end

return M
