local M = {}

---handles exit statuses for terminals by returning a pointer to the handler
---@param msg_error string
---@param msg_success string
---@return function
function M.exit(msg_error, msg_success)
	return function (_, code)
		if code ~= 0 then
			error(msg_error)
		end
		print(msg_success)
	end
end

return M
