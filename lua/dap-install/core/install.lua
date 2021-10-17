local M = {}

local fn = vim.fn

local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.core.debuggers_list").debuggers
local cnf_sys = require("dap-install.config.sys").options
local cnf_sett = require("dap-install.config.settings").options
local util_term = require("dap-install.utils.term")
local handlers = require("dap-install.core.handlers")

function M.install_debugger(debugger)
	if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
		if fn.confirm("Do you want to install the debugger '" .. debugger .. "'?", "&Yes\n&Cancel") ~= 1 then
			return
		end

		local dbg = require(cnf_sys.dbgs_path .. debugger)
		local dbg_dir = cnf_sett.installation_path .. debugger .. "/"

		local depend = nil
		local succ, rval = pcall(function()
			depend = dbg["details"]["dependencies"]
			return depend
		end)
		if succ then
			depend = rval
		end
		local are_deps_met, missing_deps = handlers.dependencies(depend)

		if not are_deps_met then
			print(
				"Error: some dependencies were not met. In order to install this debugger you must install the following programs: "
					.. table.concat(missing_deps, ", ")
			)
			return
		end

		if utils_paths.assert_dir(dbg_dir) == 1 then
			fn.delete("" .. dbg_dir .. "", "rf")
		end

		fn.mkdir("" .. dbg_dir .. "", "p")

		util_term.spawn_term(dbg.installer["install"], {
			["cwd"] = dbg_dir,
			["on_exit"] = handlers.exit(
				"DAPInstall: Could not install the debugger " .. debugger .. "!",
				"DAPInstall: Successfully installed the debugger " .. debugger .. "!"
			),
		})
	else
		print("DAPInstall: the debugger " .. debugger .. " does not exist/support is under development")
	end
end

return M
