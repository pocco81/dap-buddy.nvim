local M = {}

local cmd = vim.cmd

function M.main(option, command_option)
	option = option or 0
	command_option = command_option or "NONE"

	if option == 0 then
		require("dap-install.core.install").install_debugger(command_option)
	elseif option == 1 then
		require("dap-install.core.uninstall").uninstall_debugger(command_option)
	elseif option == 2 then
		require("dap-install.core.list").list_debuggers()
	else
		cmd("echo 'DAPInstall: Command was not recognized'")
	end
end

return M
