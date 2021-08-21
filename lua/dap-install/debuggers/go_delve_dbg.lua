local M = {}

local dbg_path = require("dap-install.debuggers_list").debuggers["go_delve_dbg"][2]
local fn = vim.fn

M.dap_info = {
    name_adapter = "go",
    name_configuration = "go"
}

---
-- function to update the adapter config after variable parsing
-- for delve, we will set the mode to 'test' if the file is a test file
---
function enrich_adapter_config(config, cb)
  local suffix = "_test.go"
  local match = config.program:sub(-string.len(suffix))
  if match == suffix then 
    -- config.arguments = { mode = "test"}
    config.mode = "test"
  end
  cb(config)
end

M.config = {
    adapters = function(callback, config)
        local handle
        local pid_or_err
        local port = 38697
        handle, pid_or_err =
            vim.loop.spawn(
            "dlv",
            {
                args = {"dap", "-l", "127.0.0.1:" .. port},
                detached = true
            },
            function(code)
                handle:close()
                print("Delve exited with exit code: " .. code)
            end
        )
        vim.defer_fn(
            function()
                callback({type = "server", host = "127.0.0.1", port = port,
                enrich_config = enrich_adapter_config,
              })
            end,
            100
        )
    end,
    configurations = {
        {
            type = "go",
            name = "Debug",
            request = "launch",
            program = "${file}"
        }
    }
}
 
M.installer = {
    before = "",
    install = [[
		git clone https://github.com/go-delve/delve && cd delve
		go install github.com/go-delve/delve/cmd/dlv

	]],
    uninstall = "simple"
}

return M
