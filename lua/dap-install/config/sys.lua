local sys = {}

local util_sys = require("dap-install.utils.sys")

sys.options = {
	dbgs_path = "dap-install.core.debuggers.",
	slash = util_sys.get_shell(),
	shell = util_sys.get_shell(),
}

return sys
