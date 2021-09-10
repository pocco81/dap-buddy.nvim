local M = {}

function M.setup(custom_opts)
	require("dap-install.config.settings").set_options(custom_opts)
end

function M.config(debugger, config)
	require("dap-install.core.loader").config(debugger, config)
end

return M
