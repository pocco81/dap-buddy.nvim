local M = {}

local debuggers = require("dap-buddy.debuggers.metadata")

function M.get_install_completion()
	return vim.tbl_keys(debuggers)
end

function M.get_uninstall_completion()
	return vim.tbl_keys(debuggers)
end

function M.setup(custom_opts)
	require("dap-install.config.settings").set_options(custom_opts)
end

function M.config(debugger, config)
	require("dap-install.core.loader").config(debugger, config)
end

return M
