local M = {}

local dap = require("dap")
local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local di_api = require("dap-install.api.debuggers")

function M.setup(custom_opts)
    require("dap-install.config.settings").set_options(custom_opts)
end

local function call_on_dap(debugger, dbg_list, user_config)
    local dbg = require(dbg_list[debugger][1])
    local final_config = vim.tbl_deep_extend("force", dbg.config, user_config)

    if (dbg.config["adapters"] ~= nil) then
        dap.adapters[dbg.dap_info["name_adapter"]] = final_config["adapters"]
    end

    if (dbg.config["configurations"] ~= nil) then
        dap.configurations[dbg.dap_info["name_configuration"]] = final_config["configurations"]
    end
end

function M.config(debugger, config)
    config = config or {}
    local dbg_list = di_api.get_debuggers()

    if (require("dap-install.config").options["verbosely_call_debuggers"] == true) then
        print("DAPInstall: Passing the " .. debugger .. " to nvim-dap...")
    end

    if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
        if (utils_paths.assert_dir(dbg_list[debugger][2]) == 1) then
            call_on_dap(debugger, dbg_list, config)
        end
    else
        print("DAPInstall: The debugger " .. debugger .. " is unsupported")
    end
end

return M
