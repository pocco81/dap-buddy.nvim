local M = {}

local dbg_list = require("dap-install.debuggers_list").debuggers
local utils_paths = require("dap-install.utils.paths.init")

function M.available_commands()
    local arguments = {}

    for debugger, _ in pairs(dbg_list) do
        if (utils_paths.assert_dir(dbg_list[debugger][2]) == 1) then
            arguments[debugger] = debugger
        end
    end

    return vim.tbl_keys(arguments)
end

return M
