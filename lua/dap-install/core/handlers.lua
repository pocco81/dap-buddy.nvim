local M = {}

function M.exit(msg_error, msg_success)
	return function (_, code)
		if code ~= 0 then
			error(msg_error)
		end
		print(msg_success)
	end
end

return M
