local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.debuggers_list").debuggers
local cnf_sys = require("dap-install.config.sys").options

function M.install_debugger(debugger)
	if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
		if fn.confirm("Do you want to install the debugger '" .. debugger .. "'?", "&Yes\n&Cancel") ~= 1 then
			return
		end

		local dbg = require(cnf_sys.dbgs_path .. debugger)
		local dbg_dir = cnf_sys.dbgs_path .. debugger .. "/"

		if utils_paths.assert_dir(dbg_dir) == 1 then
			fn.delete("" .. dbg_dir .. "", "rf")
		end

		fn.mkdir("" .. dbg_dir .. "", "p")

		local function onExit(_, code)
			if code ~= 0 then
				error("DAPInstall: Could not install the debugger " .. debugger .. "!")
			end
			print("DAPInstall: Successfully installed the debugger " .. debugger .. "!")
		end

		cmd("new")
		local shell = o.shell
		o.shell = "/bin/bash"

		cmd(dbg.installer["before"])
		fn.termopen("set -e\n" .. dbg.installer["install"], { ["cwd"] = dbg_dir, ["on_exit"] = onExit })
		o.shell = shell

		cmd("startinsert")
	else
		print("DAPInstall: the debugger " .. debugger .. " does not exist/support is under development")
	end
end

return M
