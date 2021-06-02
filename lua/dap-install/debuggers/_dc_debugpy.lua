local M = {}


local opts = require("dap-install.config").options
local dbg_path = require("dap-install.debuggers_list").debuggers["debugpy"][2]
local fn = vim.fn

M.dap_info = {
    name = "python",
    has_adapter = true,
    has_configuration = true
}

M.config = {
    adapters = {
        type = "executable",
        command = dbg_path.."bin/python",
        args = {"-m", "debugpy.adapter"}
    },
    configurations = {
        {
            type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                local cwd = fn.getcwd()
                if fn.executable(dbg_path.."bin/python") == 1 then
                    return dbg_path.."bin/python"
                elseif fn.executable(dbg_path.."/debugpy/bin/python") == 1 then
                    return dbg_path.."/debugpy/bin/python"
                else
                    return "/usr/bin/python"
                end
            end
        }
    }
}

M.installer = {
	before = "",
	install = [[
		python -m venv .
		bin/python -m pip install debugpy
	]],
	uninstall = "simple"
}


return M
