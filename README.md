<h1 align="center">🦆 DAPInstall</h1>

<p align="center">
	A NeoVim plugin for managing several debuggers for Nvim-dap
</p>

<p align="center">
    <a href="https://github.com/Pocco81/DAPInstall.nvim/stargazers"
        ><img
            src="https://img.shields.io/github/stars/Pocco81/DAPInstall.nvim?style=flat-square"
            alt="Repository's starts"
    /></a>
    <a href="https://github.com/Pocco81/DAPInstall.nvim/issues"
        ><img
            src="https://img.shields.io/github/issues-raw/Pocco81/DAPInstall.nvim?style=flat-square"
            alt="Issues"
    /></a>
    <a href="https://github.com/Pocco81/DAPInstall.nvim/blob/main/LICENSE"
        ><img
            src="https://img.shields.io/github/license/Pocco81/DAPInstall.nvim?style=flat-square"
            alt="License"
    /><br />
    <a href="https://saythanks.io/to/Pocco81%40gmail.com"
        ><img
            src="https://img.shields.io/badge/say-thanks-modal.svg?style=flat-square"
            alt="Say thanks"/></a
    ></a>    <a href="https://github.com/Pocco81/whid.nvim/commits/main"
    <a href="https://github.com/Pocco81/DAPInstall.nvim/commits/main"
		><img
			src="https://img.shields.io/github/last-commit/Pocco81/DAPInstall.nvim/dev?style=flat-square"
			alt="Latest commit"
    /></a>
    <a href="https://github.com/Pocco81/DAPInstall.nvim"
        ><img
            src="https://img.shields.io/github/repo-size/Pocco81/DAPInstall.nvim?style=flat-square"
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

-   [Features](#-features)
-   [Notices](#-notices)
-   [Caveats](#-caveats)
-   [Installation](#-installation)
    -   [Prerequisites](#prerequisites)
    -   [Adding the plugin](#adding-the-plugin)
    -   [Setup Configuration](#setup-configuration)
        -   [For init.lua](#for-initlua)
        -   [For init.vim](#for-initvim)
    -   [Updating](#updating)
-   [Usage](#usage)
    -   [Commands](#commands)
    -   [Api](#api)
-   [Configuration](#-configuration)
    -   [General](#general)
    -   [Debuggers](#debuggers)
    -   [List of debuggers](#list-of-debuggers)
-   [Contribute](#-contribute)
    -   [Need Help](#need-help)
-   [Inspirations](#-inspirations)
-   [License](#-license)
-   [FAQ](#-faq)
-   [To-Do](#-to-do)

# 🎁 Features

-   (Un)Installs debuggers
-   List installed debuggers
-   Can manage the configuration of every debugger [individually]
-   Supports a wide range of debuggers
-   User-friendly interface

# 📺 Notices

Checkout the [CHANGELOG.md](https://github.com/Pocco81/DAPInstall.nvim/blob/main/CHANGELOG.md) file for more information on the notices below:

-   **09-09-21**: Refactored and formatted code.
-   **26-07-21**: Added API.

# 👻 Caveats

-   Currently it only works for \*nix systems (Linux, MacOS, ...) and Windows through WSL. Native support for Windows is coming soon.

# 📦 Installation

## Prerequisites

-   [NeoVim 0.5+](https://github.com/neovim/neovim/releases/tag/v0.5.0)

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
```

The way you setup the settings on your configuration varies on whether you are using vimL for this or Lua.

<details>
    <summary>For init.lua</summary>
<p>

```lua
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
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
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
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

# 🤖 Usage

## Commands

All the commands follow the _camel casing_ naming convention and have the `DI` prefix so that it's easy to remember that they are part of the DAPInstall.nvim plugin. These are all of them:

-   `:DIInstall <debugger>` asserts dependencies and if they are met, installs `<debugger>`.
-   `:DIUninstall <debugger>` uninstalls `<debugger>`.
-   `:DIList` lists installed debuggers.

## API

The API can be accessed by requiring it:

```lua
local di_api = require("dap-install.api.<module>")
```

### Modules:

Currently there is only one module available, and it's the `debuggers` module which has the following functions

```lua
di_api.get_debuggers()
```

> Returns a `table` with debuggers available on DAPInstall.

```lua
di_api.get_installed_debuggers()
```

> Returns a `table` with the debuggers that are installed.

# 🐬 Configuration

Although settings already have self-explanatory names, here is where you can find info about each one of them and their classifications!

## General

This settings are unrelated to any group and are independent.

-   `installation_path`: (String) path to where the debuggers will be installed. The only condition is that the path **must** end with a forward slash ("/")
-   `verbosely_call_debuggers`: (Boolean) if true, prints messages when calling a debugger.

## Debuggers

To configure the debuggers DAPInstall.nvim provides the `config("<debugger>", {<config>})` function that receives two arguments:

-   `<debugger>`: the name of the debugger that can be found in the table below.
-   `<config>`: the configuration of the debugger itself.

In the `<config>` you must pass a table with at least one of two keys (`adapters` and/or `configurations`). Every debugger has its own settings but they all something in common, they either have a `adapters = {}` table, a `configurations = {}` table or both. To edit the debuggers' settings in either of those sections just create the key and set the value to whatever you want. **Remember that every debugger has its own config** that can be found [here](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

Examples:

1. Will configure the **Python debugger** with its default values:

```lua
local dap_install = require("dap-install")
dap_install.config("python", {})
```

2. Will override some values from the **Python debugger**:

```lua
local dap_install = require("dap-install")
dap_install.config(
	"python",
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
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for _, debugger in ipairs(dbg_list) do
	dap_install.config(debugger)
end
```

### List of debuggers

| DI. Name     | Pro. Language                    | Debugger              | Dependencies            | Status       |
| ------------ | -------------------------------- | --------------------- | ----------------------- | ------------ |
| `python`     | Python                           | debugpy               | `python`, `pip`         | Tested       |
| `ccppr_vsc`  | C, C++, Rust                     | vsc-cpptools          | `wget`, `unzip`, `make` | Tested       |
| `go`         | Go                               | delve, vscode-go      | `go`, `npm`             | Tested       |
| `php`        | PHP                              | vscode-php-debug      | `git`, `npm`            | Tested       |
| `lua`        | Lua                              | OSSFV                 | N/A                     | Tested       |
| `dnetcs`     | .NET, C#                         | netcoredbg            | `wget`, `tar`           | Tested       |
| `go_delve`   | Go                               | delve                 | `go`                    | Tested       |
| `chrome`     | JavaScriptReact, TypeScriptReact | vscode-chrome-debug   | `npm`, `git`            | Tested       |
| `codelldb`   | C, C++, Rust, Swift              | codelldb              | `wget`, `unzip`         | Tested       |
| `dart`       | Dart                             | dart-code             | `git`, `npx`            | Supported    |
| `jsnode`     | JavaScript                       | node-debug2           | `npm`, `git`            | Supported    |
| `unity`      | Unity3D, C#                      | UnityDebug            | `mono`, `wget`, `unzip` | Supported    |
| `ruby_vsc`   | Ruby                             | netcoredbg            | `git`, `npm`            | Experimental |
| `ccppr_lldb` | C, C++, Rust                     | lldb-vscode           | N/A                     | Experimental |
| `markdown`   | Markdown                         | mockdebug             | N/A                     | Experimental |
| `java`       | Java                             | java-debug            | N/A                     | Unsupported  |
| `haskell`    | Haskell                          | haskell-debug-adapter | N/A                     | Unsupported  |
| `scala`      | Scala                            | nvim-metals           | N/A                     | Unsupported  |

-   `Tested`: Fully supported
-   `Supported`: Fully supported, but needs testing.
-   `Experimental`: Still on the works.
-   `Legacy`: No longer supported, please migrate your configuration.
-   `Retired`: No longer included or supported.
-   `Unsupported`: No implementation whatsoever.

# 🙋 FAQ

-   Q: **_"How can I view the doc from NeoVim?"_**
-   A: Use `:help DAPInstall.nvim`

# 🫂 Contribute

Pull Requests are welcomed as long as they are properly justified and there are no conflicts. If your PR has something to do with the README or in general related with the documentation, I'll gladly merge it! Also, when writing code for the project **you must** use the [.editorconfig](https://github.com/Pocco81/DAPInstall.nvim/blob/main/.editorconfig) file on your editor so as to "maintain consistent coding styles". For instructions on how to use this file refer to [EditorConfig's website](https://editorconfig.org/).

## Need help

This is a list of things I currently need help with:

1. Testing the installers and reporting back via an issue
2. Creating the missing installers for the various debuggers
3. Correcting the installers that are broken

# 💭 Inspirations

The following projects inspired the creation of DAPInstall.nvim. If possible, go check them out to see why they are so amazing :]

-   [kabouzeid/nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall): Provides the missing :LspInstall for nvim-lspconfig

# 📜 License

DAPInstall.nvim is released under the GPL v3.0 license. It grants open-source permissions for users including:

-   The right to download and run the software freely
-   The right to make changes to the software as desired
-   The right to redistribute copies of the software
-   The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/DAPInstall.nvim/blob/main/LICENSE.md).

# 📋 TO-DO

**High Priority**

-   Test every debugger
-   Add support for Windows?

**Low Priority**

-   None

<hr>
<p align="center">
	Enjoy!
</p>
