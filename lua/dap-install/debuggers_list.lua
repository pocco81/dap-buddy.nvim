local opts = require("dap-install.config").options

local M = {}

M.debuggers = {
    ["python_dbg"] = {"dap-install.debuggers.python_dbg", opts.installation_path .. "python_dbg/"},
    ["go_dbg"] = {"dap-install.debuggers.go_dbg", opts.installation_path .. "go_dbg/"},
    ["lua_dbg"] = {"dap-install.debuggers.lua_dbg", opts.installation_path .. "lua_dbg/"},
    ["markdown_dbg"] = {"dap-install.debuggers.markdown_dbg", opts.installation_path .. "markdown_dbg/"},
    ["jsnode_dbg"] = {"dap-install.debuggers.jsnode_dbg", opts.installation_path .. "jsnode_dbg/"},
    ["php_dbg"] = {"dap-install.debuggers.php_dbg", opts.installation_path .. "php_dbg/"},
    ["dnetcs_dbg"] = {"dap-install.debuggers.dnetcs_dbg", opts.installation_path .. "dnetcs_dbg/"},
    ["go_delve_dbg"] = {"dap-install.debuggers.go_delve_dbg", opts.installation_path .. "go_delve_dbg/"},
    ["ccppr_lldb_dbg"] = {"dap-install.debuggers.ccppr_lldb_dbg", opts.installation_path .. "ccppr_lldb_dbg/"},
    ["ccppr_vsc_dbg"] = {"dap-install.debuggers.ccppr_vsc_dbg", opts.installation_path .. "ccppr_vsc_dbg/"},
    ["dart_dbg"] = {"dap-install.debuggers.dart_dbg", opts.installation_path .. "dart_dbg/"}
}

return M
