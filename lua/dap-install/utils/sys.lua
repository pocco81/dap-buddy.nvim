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

-- original: https://stackoverflow.com/questions/132397/get-back-the-output-of-os-execute-in-lua
-- source: https://gist.github.com/dukeofgaming/453cf950abd99c3dc8fc
function M.return_exe(cmd, raw)
	local handle = assert(io.popen(cmd, "r"))
	local output = assert(handle:read("*a"))

	handle:close()

	if raw then
		return output
	end

	output = string.gsub(string.gsub(string.gsub(output, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")

	return output
end

function M.program_exists(program)
	if
		M.return_exe([[if command -v ]] .. program .. [[ &> /dev/null ; then echo "exists" ; fi
]], false):find("exists", 1, true) == 1
	then
		return true
	end
	return false
end

return M
