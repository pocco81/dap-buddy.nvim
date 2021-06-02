
local M = {}

local dbg_list = require("dap-install.debuggers_list").debuggers

local function is_debugger_installed(debugger)
	return require("dap-install.utils.paths.init").assert_dir(dbg_list[debugger][2]) == 1
end

function M.available_commands()
	return vim.tbl_filter(function(key) return is_debugger_installed(key) end, dbg_list)
end

return M
