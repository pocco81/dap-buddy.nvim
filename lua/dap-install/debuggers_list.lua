-- NOTE: _dc = _debugger_config

local opts = require("dap-install.config").options

local M = {}

M.debuggers = {
    ["debugpy_dbg"] = {"dap-install.debuggers.debugpy_dbg", opts.installation_path.."debugpy_dbg/"}
}

return M
