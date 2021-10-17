local M = {}

local fn = vim.fn

local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.core.debuggers_list").debuggers
local cnf_sys = require("dap-install.config.sys").options
local cnf_sett = require("dap-install.config.settings").options
local util_term = require("dap-install.utils.term")
local handlers = require("dap-install.core.handlers")

function M.uninstall_debugger(debugger)
	if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
		local dbg = require(cnf_sys.dbgs_path .. debugger)
		local dbg_dir = cnf_sett.installation_path .. debugger .. "/"

		if utils_paths.assert_dir(dbg_dir) == 1 then
			if fn.confirm("Do you want to uninstall the debugger '" .. debugger .. "'?", "&Yes\n&Cancel") ~= 1 then
				return
			end

			if dbg.installer["uninstall"] == "simple" then
				fn.delete("" .. dbg_dir .. "", "rf")
				print("DAPInstall: Successfully uninstalled the debugger " .. debugger .. "!")
			else
				util_term.spawn_term(dbg.installer["uninstall"], {
					["cwd"] = dbg_dir,
					["on_exit"] = handlers.exit(
						"DAPInstall: Could not uninstall the debugger " .. debugger .. "!",
						"DAPInstall: Successfully uninstalled the debugger " .. debugger .. "!"
					),
				})
			end
		end
	else
		print("DAPInstall: the debugger " .. debugger .. " does not exist/support is under development")
	end
end

return M
