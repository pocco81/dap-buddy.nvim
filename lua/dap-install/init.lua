local M = {}

local dap = require("dap")
local dbg_list = require("dap-install.debuggers_list").debuggers

function M.setup(custom_opts)
    require("dap-install.config").set_options(custom_opts)
end

local function call_on_dap(debugger)
    local dbg = require(dbg_list[debugger][1])
	local dbg_info = dbg.dap_info["name"]

	print("Got here!")

	local test_tbl = {
		adapters = dbg.config["adapters"],
		configurations = dbg.config["configurations"]
	}

	print("")
	print("-------------------------------------------")
	print("")

	for key, value in pairs(test_tbl["adapters"]) do
		print("key = "..tostring(key).."; Value = "..value)
	end

--     dap.adapters.dap_info = {
--         type = "executable",
--         command = "python3.9",
--         args = {"-m", "debugpy.adapter"}
--     }
--
--     dap.configurations.python = {
--         {
--             type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
--             request = "launch",
--             name = "Launch file",
--             program = "${file}", -- This configuration will launch the current file if used.
--             pythonPath = function()
--                 local cwd = vim.fn.getcwd()
--                 if vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
--                     return cwd .. "/usr/bin/python3.9"
--                 elseif vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
--                     return cwd .. "/usr/bin/python3.9"
--                 else
--                     return "/usr/bin/python3.9"
--                 end
--             end
--         }
--     }
end

function M.config(debugger, config)
    config = config or {}

    local dbg = require(dbg_list[debugger][1])

    print("Debugger = " .. debugger .. "; Config = " .. tostring(config))

    if next(config) then
        print("Got here!!")
        for opt, _ in pairs(config) do
            print("Opt = " .. opt)
            if (opt == "adapters") then
                print("adapters = " .. tostring(config[opt]))
                for inner_opt, _ in pairs(config[opt]) do
                    print("Inner opt (adapters) = " .. inner_opt)
                    if (dbg.config[opt][inner_opt] ~= nil) then -- not nil
                        dbg.config[opt][inner_opt] = config[opt][inner_opt]
                    end
                end
            elseif (opt == "configurations") then
                print("Config = " .. tostring(config[opt]))
                for inner_opt, _ in pairs(config[opt][1]) do
                    print("Inner opt (configurations) = " .. inner_opt)
                    if (dbg.config[opt][1][inner_opt] ~= nil) then -- not nil
                        dbg.config[opt][1][inner_opt] = config[opt][1][inner_opt]
                    end
                end
            else
                print("Opt " .. tostring(opt) .. " was not recognized!")
            end
        end
    end

    call_on_dap(debugger)
end

return M
