local M = {}


local dap = require("dap")

function M.setup(custom_opts)
    require("dap-install.config").set_options(custom_opts)
end

function M.config(debugger, config)
    config = config or {}

    local dbg_list = require("dap-install.debuggers_list").debuggers
    local dbg = require(dbg_list[debugger][1])

    if next(config) == nil then
        for opt, _ in pairs(config) do
            if (opt == "adapters") then
                for inner_opt, _ in pairs(opt["adapters"]) do
                    if (dbg.config["config"][opt]["adapters"][inner_opt] ~= nil) then -- not nil
                        config.options[opt]["adapters"][inner_opt] = config[opt][inner_opt]
                    end
                end
            elseif (opt == "configurations") then
                for inner_opt, _ in pairs(opt["configurations"]) do
                    if (dbg.config["config"][opt]["configurations"][inner_opt] ~= nil) then -- not nil
                        config.options[opt]["configurations"][inner_opt] = config[opt][inner_opt]
                    end
                end
			else
				print("Opt "..tostring(opt).." was not recognized")
            end
        end
    end
end

return M
