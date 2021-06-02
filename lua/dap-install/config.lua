local config = {}

config.options = {
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	verbosely_call_debuggers = false,
}

function config.set_options(opts)
    opts = opts or {}

    for opt, _ in pairs(opts) do
        if (config.options[opt] ~= nil) then -- not nil
            config.options[opt] = opts[opt]
        end
    end
end

return config
