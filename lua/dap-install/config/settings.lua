local settings = {}

settings.options = {
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	proxy = "",
}

function settings.set_options(opts)
	opts = opts or {}

	for opt, _ in pairs(opts) do
		if settings.options[opt] ~= nil then
			settings.options[opt] = opts[opt]
		end
	end
end

return settings
