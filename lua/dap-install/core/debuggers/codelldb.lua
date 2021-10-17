local M = {}
local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "codelldb/"
local codelldb_path = dbg_path .. "extension/adapter/codelldb"

M.dap_info = {
	name_adapter = "codelldb",
	name_configuration = { "c", "cpp", "rust", "swift" },
}

M.details = {
	dependencies = { "wget", "unzip" },
}

M.config = {
	adapters = function(callback, config)
		local stdout = vim.loop.new_pipe(false)
		local stderr = vim.loop.new_pipe(false)

		local handle, pid_or_err
		local opts = {
			stdio = { nil, stdout, stderr },
			env = {
				["RUST_TRACEBACK"] = "1",
				["RUST_LOG"] = "error,codelldb=debug",
			},
			args = {},
			detached = true,
		}

		if config["liblldb"] ~= nil then
			opts.args[1] = "--liblldb"
			opts.args[2] = config["liblldb"]
		end

		handle, pid_or_err = vim.loop.spawn(codelldb_path, opts, function(code)
			stdout:close()
			stderr:close()
			handle:close()
			if code ~= 0 then
				print("codelldb exited with code", code)
			end
		end)

		assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
		stdout:read_start(function(err, chunk)
			assert(not err, err)
			if chunk then
				local port = chunk:match("Listening on port (%d+)")
				if port then
					vim.schedule(function()
						callback({
							type = "server",
							host = "127.0.0.1",
							port = port,
						})
					end)
				else
					vim.schedule(function()
						require("dap.repl").append(chunk)
					end)
				end
			end
		end)

		stderr:read_start(function(err, chunk)
			assert(not err, err)
			if chunk then
				vim.schedule(function()
					require("dap.repl").append(chunk)
				end)
			end
		end)
	end,

	configurations = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = true,
		},
	},
}

M.installer = {
	before = "",
	install = [[
		os=$(uname);
		arch=$(uname -m);

		if [ "$os" = "Linux" ]; then
			case $(uname -m) in
				x86_64) wget -O CodeLLDB.zip "https://github.com/vadimcn/vscode-lldb/releases/latest/download/codelldb-x86_64-linux.vsix" ;;
				aarch64|arm64) wget -O CodeLLDB.zip "https://github.com/vadimcn/vscode-lldb/releases/latest/download/codelldb-aarch64-linux.vsix" ;;
			esac
		elif [ "$os" = "Darwin" ]; then
			case $(uname -m) in
				x86_64) wget -O CodeLLDB.zip "https://github.com/vadimcn/vscode-lldb/releases/latest/download/codelldb-x86_64-darwin.vsix" ;;
				aarch64|arm64) wget -O CodeLLDB.zip "https://github.com/vadimcn/vscode-lldb/releases/latest/download/codelldb-aarch64-darwin.vsix" ;;
			esac
		fi;

		unzip CodeLLDB.zip
		rm -rf CodeLLDB.zip
	]],
	uninstall = "simple",
}

return M
