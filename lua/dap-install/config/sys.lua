local sys = {}
local cnf_sett = require("dap-install.config").options

sys.options = {
	dbgs_path = "dap-install.debuggers.",
	dbgs_dir = cnf_sett.installation_path,
}

return sys
