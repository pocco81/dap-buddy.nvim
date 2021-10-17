local M = {}

local cnf_sys = require("dap-install.config.sys").options
local util_sys = require("dap-install.utils.sys")
local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

function M.spawn_term(task, opts)
	cmd("new")
	local shell = o.shell
	o.shell = cnf_sys.shell
	if util_sys.is_windows() then
		fn.termopen(task, opts)
	else
		fn.termopen("set -e\n" .. task, opts)
	end
	o.shell = shell
	cmd("startinsert")
end

return M
