local M = {}

function M.is_windows()
	return vim.loop.os_uname().sysname:find("Windows", 1, true) and true
end

function M.get_slash()
	if M.is_windows() then
		return "\\"
	end
	return "/"
end

function M.get_shell()
	if M.is_windows() then
		return "cmd.exe"
	end
	return "/usr/bin/env bash"
end

return M
