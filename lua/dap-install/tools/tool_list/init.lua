local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local opts = require("dap-install.config").options

function M.list_debuggers()
    local function onExit(_, code)
        if code ~= 0 then
            error("Could not list the debuggers!")
        end
        print("Successfully listed debuggers!")
    end

    cmd("new")
    local shell = o.shell
    o.shell = "/bin/bash"

    fn.termopen("set -e\n ls -la " .. opts["installation_path"] .. "", {["on_exit"] = onExit})
    o.shell = shell

    cmd("startinsert")
end

return M
