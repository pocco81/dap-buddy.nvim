local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_paths = require("dap-install.utils.paths.init")
local cnf_sett = require("dap-install.config.settings").options

function M.list_debuggers()
	local function onExit(_, code)
		if code ~= 0 then
			error("DAPInstall: Could not list the debuggers!")
		end
		print("DAPInstall: Successfully listed debuggers!")
	end

	if utils_paths.assert_dir(cnf_sett["installation_path"]) ~= 1 then
		print("DAPInstall: nothing was found")
		return
	end

	cmd("new")
	local shell = o.shell
	o.shell = "/bin/bash"

	fn.termopen("set -e\n ls -Gg " .. cnf_sett["installation_path"] .. "", { ["on_exit"] = onExit })
	o.shell = shell

	cmd("startinsert")
end

return M
