-- NOTE: _dc = _debugger_config

local opts = require("dap-install.config").options

local M = {}

M.debuggers = {
    ["python_dbg"] = {"dap-install.debuggers.python_dbg", opts.installation_path.."python_dbg/"},
    ["go_dbg"] = {"dap-install.debuggers.go_dbg", opts.installation_path.."go_dbg/"},
    ["markdown_dbg"] = {"dap-install.debuggers.markdown_dbg", opts.installation_path.."markdown_dbg/"},
    ["jsnode_dbg"] = {"dap-install.debuggers.jsnode_dbg", opts.installation_path.."jsnode_dbg/"},
}

return M
