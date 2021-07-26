local M = {}

local utils_paths = require("dap-install.utils.paths.init")

function M.get_debuggers()
    return require("dap-install.debuggers_list").debuggers
end

function M.get_installed_debuggers()
    local dbg_list = M.get_debuggers()
    local installed_debuggers = {}

    for debugger, _ in pairs(dbg_list) do
        if (utils_paths.assert_dir(dbg_list[debugger][2]) == 1) then
            installed_debuggers[#installed_debuggers + 1] = debugger
        end
    end

    return installed_debuggers
end

return M
