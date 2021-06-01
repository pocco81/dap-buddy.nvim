
local M = {}

local cmd  = vim.cmd


function M.main(option, command_option)

	option = option or 0
	command_option = command_option or "NONE"

	if (option == 0) then
		require("dap-install.tools.tool_install.init").install_debugger(command_option)
	elseif (option == 1) then
	else
		cmd("echo 'DAPInstall: Command was not recognized'")
	end
end



return M

