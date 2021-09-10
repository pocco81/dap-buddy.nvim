local M = {}

local dap = require("dap")
local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.core.debuggers_list").debuggers
local cnf_sys = require("dap-install.config.sys").options
local cnf_sett = require("dap-install.config.settings").options

local function load(debugger, user_config)
	local dbg = require(cnf_sys.dbgs_path .. debugger)
	local final_config = vim.tbl_deep_extend("force", dbg.config, user_config)

	if dbg.config["adapters"] ~= nil then
		dap.adapters[dbg.dap_info["name_adapter"]] = final_config["adapters"]
	end

	if dbg.config["configurations"] ~= nil then
		dap.configurations[dbg.dap_info["name_configuration"]] = final_config["configurations"]
	end
end

function M.config(debugger, config)
	config = config or {}

	if require("dap-install.config").options["verbosely_call_debuggers"] == true then
		print("DAPInstall: Passing the " .. debugger .. " to nvim-dap...")
	end

	if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
		if utils_paths.assert_dir(cnf_sett.installation_path .. debugger .. "/") == 1 then
			load(debugger, config)
		end
	else
		print("DAPInstall: The debugger " .. debugger .. " is unsupported")
	end
end

return M
