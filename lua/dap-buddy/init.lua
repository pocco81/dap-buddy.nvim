local M = {}

local debuggers = require("dap-buddy.debuggers.metadata")
local notify = require("dap-buddy.notify")

function M.get_install_completion(add_all)
	local all = {}
	if add_all == true then all = { all = true } end
	return vim.tbl_keys(vim.tbl_extend("force", all, debuggers))
end

function M.get_uninstall_completion(add_all)
	local all = {}
	if add_all == true then all = { all = true } end
	return vim.tbl_keys(vim.tbl_extend("force", all, debuggers))
end

function M.install(debugger, installation_type)
	installation_type = installation_type or "normal"
	notify("debugger -> " .. debugger)
	notify("installation_type -> " .. installation_type)
end

function M.uninstall(debugger, uninstallation_type)
	uninstallation_type = uninstallation_type or "normal"
	notify("debugger -> " .. debugger)
	notify("installation_type -> " .. uninstallation_type)
end

function M.setup(custom_opts)
	require("dap-install.config.settings").set_options(custom_opts)
end

function M.config(debugger, config)
	require("dap-install.core.loader").config(debugger, config)
end

return M
