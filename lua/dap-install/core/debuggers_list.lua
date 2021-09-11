local M = {}

M.debuggers = {
	["python"] = {
		ft = { "python" },
		deps = {},
	},
	["go"] = {
		ft = { "go" },
		deps = {},
	},
	["lua"] = {
		ft = { "lua" },
		deps = {},
	},
	["markdown"] = {
		ft = { "markdown" },
		deps = {},
	},
	["jsnode"] = {
		ft = { "javascript" },
		deps = {},
	},
	["php"] = {
		ft = { "php" },
		deps = {},
	},
	["dnetcs"] = {
		ft = { "cs" },
		deps = {},
	},
	["go_delve"] = {
		ft = { "go" },
		deps = {},
	},
	["ccppr_lldb"] = {
		ft = { "c", "cpp", "cpp_matchup", "rust" },
		deps = {},
	},
	["ccppr_vsc"] = {
		ft = { "c", "cpp", "cpp_matchup", "rust" },
		deps = { gdb = false },
	},
	["dart"] = {
		ft = { "dart" },
		deps = {},
	},
	["ruby_vsc"] = {
		ft = { "ruby" },
		deps = {},
	},
}

return M
