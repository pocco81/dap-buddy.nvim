local M = {}

local cnf_sys = require("dap-install.config.sys").options

function M.fetch_installer(dependency)
	local present, dep = pcall(require, cnf_sys.deps_path .. dependency)
	if not present then
		return [[]]
	end



end

return M
