local M = {}

function M.available_commands()
	return vim.tbl_keys(require("dap-install.core.debuggers_list").debuggers)
end

return M
