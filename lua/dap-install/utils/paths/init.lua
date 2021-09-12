local M = {}

function M.assert_dir(dir)
	return vim.fn.isdirectory("" .. dir .. "")
end

function M.is_windows()
	return vim.loop.os_uname().sysname:find("Windows", 1, true) and true
end

return M
