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
		local name_adapter = dbg.dap_info["name_adapter"]
		if type(name_adapter) == "table" then
			for _, adapter in pairs(name_adapter) do
				dap.adapters[adapter] = final_config["adapters"]
			end
		else
			dap.adapters[name_adapter] = final_config["adapters"]
		end
	end

	if dbg.config["configurations"] ~= nil then
		local name_configurations = dbg.dap_info["name_configuration"]
		if type(name_configurations) == "table" then
			for _, lang in pairs(name_configurations) do
				dap.configurations[lang] = final_config["configurations"]
			end
		else
			dap.configurations[name_configurations] = final_config["configurations"]
		end
	end
end

function M.config(debugger, config)
	config = config or {}

	if utils_tbl.tbl_has_element(dbg_list, debugger, "index") then
		if utils_paths.assert_dir(cnf_sett.installation_path .. debugger .. "/") == 1 then
			load(debugger, config)
		end
	else
		print("DAPInstall: The debugger " .. debugger .. " is unsupported")
	end
end

return M
