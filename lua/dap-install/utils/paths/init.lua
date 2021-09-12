local M = {}

function M.assert_dir(dir)
	return vim.fn.isdirectory("" .. dir .. "")
end

return M
