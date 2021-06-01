local M = {}

local cmd = vim.cmd
local fn = vim.fn
local o = vim.o

local utils_tbl = require("dap-install.utils.tables.init")
local utils_paths = require("dap-install.utils.paths.init")
local dbg_list = require("dap-install.debuggers_list").debuggers

function M.install_debugger(debugger)
    if not utils_tbl.tbl_has_element(dbg_list, debugger) then
        --         cmd("new")
        --         local shell = o.shell
        --         o.shell = "/bin/bash"
        -- cmd(require(dbg_list[debugger][1]).installer["before"])
        --         fn.termopen("set -e\n" .. require(dbg_list[debugger][1]).installer["after"], {["cwd"] = require(dbg_list[debugger][2]), ["on_exit"] = onExit})
        --         o.shell = shell
        --         cmd("startinsert")
        if fn.confirm("Do you want to install the debugger " .. debugger .. "?", "&Yes\n&Cancel") ~= 1 then
            return
        end

        -- if not (utils_paths.assert_dir(dbg_list[debugger]) == 1) then
        --     fn.mkdir("" .. dbg_list[debugger] .. "", "p")
        -- end

        local function onExit(_, code)
            if code ~= 0 then
                error("Could not install " .. debugger .. " language server!")
            end
            print("Successfully installed " .. debugger .. " language server!")
        end

        local dbg = require(dbg_list[debugger][1])
		local dbg_path = dbg_list[debugger][2]

        -- cmd("echo 'Installing Debugger " .. debugger .. "'")
        -- cmd("echo 'Installer before cmd = " .. require(dbg_list[debugger][1]).installer["before"] .. "'")
        -- cmd("echo 'Installer after cmd = '" .. require(dbg_list[debugger][1]).installer["after"] .. "'")
        -- cmd("echo 'Installation path = '" .. require(dbg_list[debugger][2]) .. "'")
        -- cmd("echo ''")

        cmd("echo 'Installing Debugger " .. debugger .. "'")
        cmd("echo 'Installer before cmd = " .. dbg.installer["before"] .. "'")
        cmd("echo 'Installer after cmd = " .. dbg.installer["after"] .. "'")
        cmd("echo 'Installation path = " .. dbg_path .. "'")
        cmd("echo ''")
    else
        cmd("echo 'DAPInstall: the debugger " .. debugger .. " does not exist/support is under development'")
    end
end

return M
