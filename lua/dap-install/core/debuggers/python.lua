local M = {}

local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "python/"
local proxy = require("dap-install.config.settings").options["proxy"]
local fn = vim.fn
local util_sys = require("dap-install.utils.sys")

M.details = {
	dependencies = { "python", "pip" },
}

M.dap_info = {
	name_adapter = "python",
	name_configuration = "python",
}

M.config = {
	adapters = {
		type = "executable",
		command = dbg_path .. "bin/python",
		args = { "-m", "debugpy.adapter" },
	},
	configurations = {
		{
			type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = "launch",
			name = "Launch file",
			program = "${file}", -- This configuration will launch the current file if used.
			pythonPath = function()
				local venv_path = os.getenv("VIRTUAL_ENV")
				if venv_path then
					if util_sys.is_windows() then
						return venv_path .. "\\Scripts\\python.exe"
					end
					return venv_path .. "/bin/python"
				end
				if fn.executable(dbg_path .. "bin/python") == 1 then
					return dbg_path .. "bin/python"
				elseif fn.executable(dbg_path .. "bin/python") == 1 then
					return dbg_path .. "bin/python"
				else
					return "/usr/bin/python"
				end
			end,
		},
	},
}

local install_string
if proxy == nil or proxy == "" then
	install_string = [[
		python3 -m venv .
		bin/python -m pip install debugpy
  ]]
else
	install_string = string.format(
		[[
      python3 -m venv .
      bin/python -m pip install debugpy --proxy %s
    ]],
		proxy
	)
end

M.installer = {
	before = "",
	install = install_string,
	uninstall = "simple",
}

return M
