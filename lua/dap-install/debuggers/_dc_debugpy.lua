local M = {}


local opts = require("dap-install.config").options


M.dap_info = {
    name = "python",
    has_adapter = true,
    has_configuration = true
}

M.config = {
    adapters = {
        type = "executable",
        command = opts.installation_path.."/debugpy/bin/python",
        args = {"-m", "debugpy.adapter"}
    },
    configurations = {
        {
            type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(opts.installation_path.."/debugpy/bin/python") == 1 then
                    return opts.installation_path.."/debugpy/bin/python"
                elseif vim.fn.executable(opts.installation_path.."/debugpy/bin/python") == 1 then
                    return opts.installation_path.."/debugpy/bin/python"
                else
                    return "/usr/bin/python"
                end
            end
        }
    }
}

M.installer = {
	before = [[cd ]]..opts.installation_path..[[]],
	after = [[
		cd debugpy/
		python -m venv
		bin/python -m pip install debugpy
	]]
}


return M
