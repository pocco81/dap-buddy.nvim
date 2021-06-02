local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.debuggers_list").debuggers

function M.install_debugger(debugger)
    if not utils_tbl.tbl_has_element(dbg_list, debugger) then
        if (utils_paths.assert_dir(dbg_path) == 1) then
            if fn.confirm("Do you want to uinstall the debugger " .. debugger .. "?", "&Yes\n&Cancel") ~= 1 then
                return
            end

            local function onExit(_, code)
                if code ~= 0 then
                    error("Could not install " .. debugger .. " language server!")
                end
                print("Successfully installed " .. debugger .. " language server!")
            end

            local dbg = require(dbg_list[debugger][1])
            local dbg_path = dbg_list[debugger][2]

            if (dbg.installer["uninstall"] == "simple") then
                fn.delete("" .. dbg_path .. "", "rf")
            else
                cmd("new")
                local shell = o.shell
                o.shell = "/bin/bash"

                cmd(dbg.installer["before"])
                fn.termopen("set -e\n" .. dbg.installer["uninstall"], {["cwd"] = dbg_path, ["on_exit"] = onExit})
                o.shell = shell

                cmd("startinsert")
            end
        end
    else
        cmd("echo 'DAPInstall: the debugger " .. debugger .. " does not exist/support is under development'")
    end
end

return M
