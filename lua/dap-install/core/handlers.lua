local M = {}

---handles exit statuses for terminals by returning a pointer to the handler
---@param msg_error string
---@param msg_success string
---@return function
function M.exit(msg_error, msg_success)
	return function(_, code)
		if code ~= 0 then
			error(msg_error)
		end
		print(msg_success)
	end
end

function M.dependencies(dependencies)
	local util_sys = require("dap-install.utils.sys")
	local unmet_dps = {}

	if dependencies ~= nil then
		if type(dependencies) == "table" then
			for _, dep in pairs(dependencies) do
				if not (util_sys.program_exists(dep)) then
					table.insert(unmet_dps, dep)
				end
			end
		else
			if not (util_sys.program_exists(dependencies)) then
				table.insert(unmet_dps, dependencies)
			end
		end
	end

	if next(unmet_dps) == nil then
		return true, {}
	end

	return false, unmet_dps
end

return M
