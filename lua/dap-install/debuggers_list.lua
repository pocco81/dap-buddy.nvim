-- NOTE: _dc = _debugger_config

local opts = require("dap-install.config").options

local M = {}

M.debuggers = {
    ["debugpy_dbg"] = {"dap-install.debuggers._dc_debugpy", opts.installation_path.."debugpy_dbg/"}
}

return M
