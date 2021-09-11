local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.core.debuggers_list").debuggers
local cnf_sys = require("dap-install.config.sys").options
local cnf_sett = require("dap-install.config.settings").options

local function insall_cmd_merger(dbgr, deps)
	local final = [[]]
	local deps_pre = [[]]
	local deps_post = [[]]


	final = deps_pre .. [[

	]] .. dbgr .. [[

	]] .. deps_post .. [[

	]]

	return final
end

local function create_dirs(dbgr, deps)
	deps = deps or {}
	local deps_path = cnf_sett.installation_path .. "deps/"

	if utils_paths.assert_dir(dbgr) == 1 then
		fn.delete("" .. dbgr .. "", "rf")
	end

	fn.mkdir("" .. dbgr .. "", "p")

	for dep, _ in pairs(deps) do
		local present, _ = pcall(require, cnf_sys.deps_path .. dep)
		local dep_dir = ""
		if present then
			dep_dir = deps_path .. dep .. "/"
		else
			dep_dir = cnf_sett.installation_path .. dep .. "/"
		end
		if utils_paths.assert_dir(dep_dir) == 1 then
			fn.delete("" .. dep_dir .. "", "rf")
		end

		fn.mkdir("" .. dep_dir .. "", "p")
	end

end

function M.install_debugger(debugger)

	-- create dirs for debugger and deps
	-- fetch configs

	if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
		if fn.confirm("Do you want to install the debugger '" .. debugger .. "'?", "&Yes\n&Cancel") ~= 1 then
			return
		end

		local dbg = require(cnf_sys.dbgs_path .. debugger)
		local dbg_dir = cnf_sett.installation_path .. debugger .. "/"
		local dbg_deps = dbg_list[debugger]["deps"]

		create_dirs(dbg_dir, dbg_deps)
		local install_cmd = insall_cmd_merger(dbg["installer"], dbg_deps)

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
		fn.termopen("set -e\n" .. install_cmd, { ["cwd"] = dbg_dir, ["on_exit"] = onExit })
		o.shell = shell

		cmd("startinsert")
	else
		print("DAPInstall: the debugger " .. debugger .. " does not exist/support is under development")
	end
end

return M
