local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_paths = require("dap-install.utils.paths.init")
local cnf_sett = require("dap-install.config.settings").options
local handlers = require("dap-install.core.handlers")

function M.list_debuggers()
	if utils_paths.assert_dir(cnf_sett["installation_path"]) ~= 1 then
		print("DAPInstall: nothing was found")
		return
	end

	cmd("new")
	local shell = o.shell
	o.shell = "/bin/bash"

	fn.termopen("set -e\n ls -Gg " .. cnf_sett["installation_path"] .. "", {
		["on_exit"] = handlers.exit(
			"DAPInstall: Could not list the debuggers!",
			"DAPInstall: Successfully listed debuggers!"
		),
	})
	o.shell = shell

	cmd("startinsert")
end

return M
