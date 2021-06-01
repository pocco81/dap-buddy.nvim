-- NOTE: _dc = _debugger_config

local opts = require("dap-install.config").options

local M = {}

M.debuggers = {
    ["debugpy"] = {"dap-install.debuggers._dc_debugpy", opts.installation_path.."debugpy/"}
}

function M.available_commands()
	return vim.tbl_keys(M.debuggers)
end

return M

