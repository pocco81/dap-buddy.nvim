local M = {}

M.debuggers = {
	["python"] = { "python" },
	["go"] = { "go" },
	["lua"] = { "lua" },
	["markdown"] = { "markdown" },
	["jsnode"] = { "javascript" },
	["php"] = { "php" },
	["dnetcs"] = { "cs" },
	["go_delve"] = { "go" },
	["ccppr_lldb"] = { "c", "cpp", "cpp_matchup", "rust" },
	["ccppr_vsc"] = { "c", "cpp", "cpp_matchup", "rust" },
	["dart"] = { "dart" },
	["ruby_vsc"] = { "ruby" },
	["chrome"] = { "javascriptreact", "typescriptreact" },
	["unity"] = { "unity" },
	["codelldb"] = { "c", "cpp", "rust", "swift" },
}

return M
