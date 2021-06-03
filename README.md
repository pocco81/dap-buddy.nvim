# 🦆 DAPInstall

<p align="center">
	A NeoVim plugin for managing several debuggers for Nvim-dap
</p>

<p align="center">
    <a href="https://github.com/Pocco81/DAPInstall.nvim/stargazers"
        ><img
            src="https://img.shields.io/github/stars/Pocco81/DAPInstall.nvim"
            alt="Repository's starts"
    /></a>
    <a href="https://github.com/Pocco81/DAPInstall.nvim/issues"
        ><img
            src="https://img.shields.io/github/issues-raw/Pocco81/DAPInstall.nvim"
            alt="Issues"
    /></a>
    <a href="https://github.com/Pocco81/DAPInstall.nvim/blob/main/LICENSE"
        ><img
            src="https://img.shields.io/github/license/Pocco81/DAPInstall.nvim"
            alt="License"
    /><br />
    <a href="https://saythanks.io/to/Pocco81%40gmail.com"
        ><img
            src="https://img.shields.io/badge/say-thanks-modal.svg"
            alt="Say thanks"/></a
    ></a>    <a href="https://github.com/Pocco81/whid.nvim/commits/main"
    <a href="https://github.com/Pocco81/DAPInstall.nvim/commits/main"
		><img
			src="https://img.shields.io/github/last-commit/Pocco81/DAPInstall.nvim/dev"
			alt="Latest commit"
    /></a>
    <a href="https://github.com/Pocco81/DAPInstall.nvim"
        ><img
            src="https://img.shields.io/github/repo-size/Pocco81/DAPInstall.nvim"
            alt="GitHub repository size"
    /></a>
</p>


<kbd><img src ="https://i.imgur.com/QBqYyyn.gif"></kbd>
<p align="center">
	Demo
</p><hr>

# TL;DR

<div style="text-align: justify">
	DAPInstall.nvim is a NeoVim plugin written in Lua that extends nvim-dap's functionality for managing various debuggers. Everything from installation, configuration, setup, etc... can be done using DAPInstall.nvim. To get started, install it with your favorite plugin manager and then install the debuggers you'd like to use using the ':DIInstall <debugger>' command and [optionally] use their default configs.
</div>



# 🌲 Table of Contents

* [Features](#-features)
* [Notices](#-notices)
* [Installation](#-installation)
	* [Prerequisites](#prerequisites)
	* [Adding the plugin](#adding-the-plugin)
	* [Setup Configuration](#setup-configuration)
		* [For init.lua](#for-initlua)
		* [For init.vim](#for-initvim)
	* [Updating](#updating)
* [Usage (commands)](#-usage-commands)
	* [Default](#default)
* [Configuration](#-configuration)
	* [General](#general)
	* [Debuggers](#debuggers)
	* [List of debuggers](#list-of-debuggers)
* [Contribute](#-contribute)
	* [Need Help](#need-help)
* [Inspirations](#-inspirations)
* [License](#-license)
* [FAQ](#-faq)
* [To-Do](#-to-do)

# 🎁 Features
- (Un)Installs debuggers
- List installed debuggers
- Can manage the configuration of every debugger [individually]
- Supports a wide range of debuggers
- User-friendly interface

# 📺 Notices
Checkout the [CHANGELOG.md](https://github.com/Pocco81/DAPInstall.nvim/blob/main/CHANGELOG.md) file for more information on the notices below:

# 📦 Installation

## Prerequisites

- [NeoVim nightly](https://github.com/neovim/neovim/releases/tag/nightly) (>=v0.5.0)

## Adding the plugin
You can use your favorite plugin manager for this. Here are some examples with the most popular ones:

### Vim-plug

```lua
Plug 'Pocco81/DAPInstall.nvim'
```
### Packer.nvim

```lua
use "Pocco81/DAPInstall.nvim"
```

### Vundle

```lua
Plugin 'Pocco81/DAPInstall.nvim'
```

### NeoBundle
```lua
NeoBundleFetch 'Pocco81/DAPInstall.nvim'
```

## Setup (configuration)
As it's stated in the TL;DR, there are already some sane defaults that you may like, however you can change them to match your taste. These are the defaults:
```lua
installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
verbosely_call_debuggers = false,
```

The way you setup the settings on your configuration varies on whether you are using vimL for this or Lua.


<details>
    <summary>For init.lua</summary>
<p>

```lua
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = "/tmp/test_dap_install/",
	verbosely_call_debuggers = true,
})
```
<br />
</details>


<details>
    <summary>For init.vim</summary>
<p>

```lua
lua << EOF
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = "/tmp/test_dap_install/",
	verbosely_call_debuggers = true,
})
EOF
```
<br />
</details>

For instructions on how to configure the plugin, check out the [configuration](#configuration) section.

## Updating
This depends on your plugin manager. If, for example, you are using Packer.nvim, you can update it with this command:
```lua
:PackerUpdate
```

# 🤖 Usage (commands)
All the commands follow the *camel casing* naming convention and have the `DI` prefix so that it's easy to remember that they are part of the DAPInstall.nvim plugin. These are all of them:

## Default
- `:DIInstall <debugger>` installs `<debugger>`.
- `:DIUninstall <debugger>` uninstalls `<debugger>`.
- `:DIList` lists installed debuggers.

# 🐬 Configuration
Although settings already have self-explanatory names, here is where you can find info about each one of them and their classifications! 

## General
This settings are unrelated to any group and are independent.
- `installation_path`: (String) path to where the debuggers will be installed. The only condition is that the path **must** end with a forward slash ("/")
- `verbosely_call_debuggers`: (Boolean) prints a message whenever a debugger that the user it trying to call for configuration isn't installed.

## Debuggers
To configure the debuggers DAPInstall.nvim provides the `config("<debugger>", {<config>})` function that receives two arguments:

- `<debugger>`: the name of the debugger that can be found in the table below.
- `<config>`: the configuration of the debugger itself.

In the `<config>` you must pass a table with at least one of two keys (`adapters` and/or `configurations`). Every debugger has its own settings but they all something in common, they either have a `adapters = {}` table, a `configurations = {}` table or both. To edit the debuggers' settings in either of those sections just create the key and set the value to whatever you want. **Remember that every debugger has its own config** that can be found [here](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

Examples:

1. Will configure the **Python debugger** with its default values:

```lua
local dap_install = require("dap-install")
dap_install.config("python_dbg", {})
```
2. Will override some values from the **Python debugger**:
```lua
local dap_install = require("dap-install")
dap_install.config(
	"python_dbg",
    {
        adapters = {
            type = "executable",
            command = "python3.9",
            args = {"-m", "debugpy.adapter"}
        },
        configurations = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
                        return cwd .. "/usr/bin/python3.9"
                    elseif vim.fn.executable(cwd .. "/usr/bin/python3.9") == 1 then
                        return cwd .. "/usr/bin/python3.9"
                    else
                        return "/usr/bin/python3.9"
                    end
                end
            }
        }
    }
)
```

You could also use a loop to configure every installed debugger like so:

```lua
local dap_install = require("dap-install")
local dbg_list = require("dap-install.debuggers_list").debuggers

for debugger, _ in pairs(dbg_list) do
	dap_install.config(debugger, {})
end
```

### List of debuggers

| DI. Name         | Pro. Language | Debugger              | Status       |
|------------------|---------------|-----------------------|--------------|
| `python_dbg`     | Python        | debugpy               | Tested       |
| `ccppr_lldb_dbg` | C, C++, Rust  | lldb-vscode           | Experimental |
| `ccppr_vsc_dbg`  | C, C++, Rust  | vsc-cpptools          | Unsupported  |
| `go_dbg`         | Go            | delve, vscode-go      | Tested       |
| `go_delve_dbg`   | Go            | delve                 | Tested       |
| `java_dbg`       | Java          | java-debug            | Unsupported  |
| `markdown_dbg`   | Markdown      | mockdebug             | Experimental |
| `dart_dbg`       | Dart          | dart-code             | Supported    |
| `haskell_dbg`    | Haskell       | haskell-debug-adapter | Unsupported  |
| `jsnode_dbg`     | JavaScript    | node-debug2           | Supported    |
| `php_dbg`        | PHP           | vscode-php-debug      | Tested       |
| `scala_dbg`      | Scala         | nvim-metals           | Unsupported  |
| `lua_dbg`        | Lua           | OSSFV                 | Tested       |
| `dnetcs_dbg`     | .NET, C#      | netcoredbg            | Supported    |

* `Tested`: Fully supported
* `Supported`: Fully supported, but needs testing.
* `Experimental`: Still on the works.
* `Legacy`: No longer supported, please migrate your configuration.
* `Retired`: No longer included or supported.

# 🙋 FAQ

- Q: ***"How can I view the doc from NeoVim?"***
- A: Use `:help DAPInstall.nvim`


# 🫂 Contribute
Pull Requests are welcomed as long as they are properly justified and there are no conflicts. If your PR has something to do with the README or in general related with the documentation, I'll gladly merge it! Also, when writing code for the project **you must** use the [.editorconfig](https://github.com/Pocco81/DAPInstall.nvim/blob/main/.editorconfig) file on your editor so as to "maintain consistent coding styles". For instructions on how to use this file refer to [EditorConfig's website](https://editorconfig.org/).

## Need help
This is a list of things I currently need help with:

1. Testing the installers and reporting back via an issue
2. Creating the missing installers for the various debuggers
3. Correcting the installers that are broken


# 💭 Inspirations

The following projects inspired the creation of DAPInstall.nvim. If possible, go check them out to see why they are so amazing :]
- [kabouzeid/nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall): Provides the missing :LspInstall for nvim-lspconfig

# 📜 License

DAPInstall.nvim is released under the GPL v3.0 license. It grants open-source permissions for users including:

- The right to download and run the software freely
- The right to make changes to the software as desired
- The right to redistribute copies of the software
- The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/DAPInstall.nvim/blob/main/LICENSE.md).

# 📋 TO-DO

**High Priority**
- Test every debugger

**Low Priority**
- None

<hr>
<p align="center">
	Enjoy!
</p>
