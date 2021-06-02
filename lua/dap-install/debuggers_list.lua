-- NOTE: _dc = _debugger_config

local opts = require("dap-install.config").options

local M = {}

M.debuggers = {
    ["python_dbg"] = {"dap-install.debuggers.python_dbg", opts.installation_path.."python_dbg/"}
}

return M
