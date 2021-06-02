local M = {}


local dap = require("dap")

function M.setup(custom_opts)
    require("dap-install.config").set_options(custom_opts)
end

function M.config(debugger, config)
    config = config or {}

    local dbg_list = require("dap-install.debuggers_list").debuggers
    local dbg = require(dbg_list[debugger][1])

	print("Debugger = "..debugger.."; Config = "..tostring(config))

    if next(config) then
		print("Got here!!")
        for opt, _ in pairs(config) do
			print("Opt = "..opt)
            if (opt == "adapters") then
					--                 for inner_opt, _ in pairs(opt["adapters"]) do
					-- print("Inner opt (adapters) = "..inner_opt)
					--                     if (dbg.config["config"][opt]["adapters"][inner_opt] ~= nil) then -- not nil
					--                         config.options[opt]["adapters"][inner_opt] = config[opt][inner_opt]
					--                     end
					--                 end
            elseif (opt == "configurations") then
				-- should iterate through index one
				print("Config -1 = "..tostring(config[opt]))
				print("Config 0 = "..tostring(config[opt]["configurations"]))
				print("Config 1 = "..tostring(config[opt]["configurations"][1]))
					--                 for inner_opt, _ in pairs(opt["configurations"][1]) do
					-- print("Inner opt (configurations) = "..inner_opt)
					--                     if (dbg.config["config"][opt]["configurations"][1][inner_opt] ~= nil) then -- not nil
					--                         config.options[opt]["configurations"][1][inner_opt] = config[opt][1][inner_opt]
					--                     end
					--                 end
			else
				print("Opt "..tostring(opt).." was not recognized!")
            end
        end
    end
end

return M
