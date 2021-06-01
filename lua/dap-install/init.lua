local M = {}

function M.setup(custom_opts)
	require("dap-install.config").set_options(custom_opts)
end

return M
