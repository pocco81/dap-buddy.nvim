local DEBUGGERS = {
	["chrome"] = {
		name = "Chrome",
		filetypes = "js"
	},
	["go-delve"] = {
		name = "Go delve",
		filetypes = "go",
		dependencies = {
			shared = {
				"go",
				"git",
			},
		},
	},
	["dartcode"] = {
		name = "Dart code",
		filetypes = "dart",
		dependencies = {
			shared = {
				"git",
				"npm",
			},
			windows = {
				"jar",
				"curl",
			},
			unix = {
				"wget",
				"tar",
			},
		},
	},
	["debugpy"] = {
		name = "Debugpy",
		filetypes = "python",
		dependencies = {
			shared = {
				"python3",
				"pip",
			},
		},
	},
}

return DEBUGGERS
