local TITLE = "dap-buddy"
-- local log_levels =
local platform = require("dap-buddy.platform")

local M = {}

function M.m(msg, level)
	local has_notify_plugin = pcall(require, "notify")

	if level == "w" then
		level = vim.log.levels.WARN
	elseif level == "e" then
		level = vim.log.levels.ERROR
	else
		level = vim.log.levels.INFO
	end

	if has_notify_plugin then
		vim.notify(msg, level, {
			title = TITLE,
		})
	else
		vim.notify(("[%s]: %s"):format(TITLE, msg), level)
	end
end

-- function M.raise_error(msg, code)
--     if platform.is_headless then
--         vim.schedule(function()
--             -- We schedule the exit to make sure the call stack is exhausted
--             os.exit(code or 1)
--         end)
--     end
--     error(msg)
-- end

return M
