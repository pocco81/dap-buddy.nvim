local TITLE = "dap-buddy"
local log_levels = vim.log.levels

return function(msg, level)
	local has_notify_plugin = pcall(require, "notify")
	if level then
		if level == "w" then
			level = log_levels.WARN
		elseif level == "e" then
			level = log_levels.ERROR
		end
	end
	level = log_levels.INFO
	if has_notify_plugin then
		vim.notify(msg, level, {
			title = TITLE,
		})
	else
		vim.notify(("[%s]: %s"):format(TITLE, msg), level)
	end
end
