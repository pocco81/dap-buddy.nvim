local M = {}

M.debuggers = {
	["python_dbg"] = { "python" },
	["go_dbg"] = { "go" },
	["lua_dbg"] = { "lua" },
	["markdown_dbg"] = { "markdown" },
	["jsnode_dbg"] = { "javascript" },
	["php_dbg"] = { "php" },
	["dnetcs_dbg"] = {"cs"},
	["go_delve_dbg"] = {"go"},
	["ccppr_lldb_dbg"] = {"c", "cpp", "cpp_matchup", "rust"},
	["ccppr_vsc_dbg"] = {"c", "cpp", "cpp_matchup", "rust"},
	["dart_dbg"] = {"dart"},
	["ruby_vsc_dbg"] = {"ruby"},
}

return M
