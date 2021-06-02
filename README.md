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
	DAPInstall.nvim is a NeoVim plugin written in Lua that extends nvim-dap's functionality for managing various debuggers. Everything from installation, configuration, setup, etc... can all be done using DAPInstall.nvim. To get started, install it with your favorite plugin manager and then install the debuggers you'd like to use using the :DIInstall <debugger_name> command and configure it using a loop provided in the Doc.
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
* [Contribute](#-contribute)
* [Inspirations](#-inspirations)
* [License](#-license)
* [FAQ](#-faq)
* [To-Do](#-to-do)

# 🎁 Features
- (Un)Installs debuggers
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

The way you setup the settings on your config varies on whether you are using vimL for this or Lua.


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
- `installation_path`: (String) path to where the debuggers will be installed.
- `verbosely_call_debuggers`: (Boolean) prints a message whenever a debugger that the user it trying to call for configuration isn't installed.

# 🙋 FAQ

- Q: ***"What if I repeat a color's number?"***
- A: There would a conflict when calling `:HSHighlight`, however it will try and call any of those colors.

- Q: ***"How can I view the doc from NeoVim?"***
- A: Use `:help DAPInstall.nvim`


# 🫂 Contribute

Pull Requests are welcomed as long as they are properly justified and there are no conflicts. If your PR has something to do with the README or in general related with the documentation, I'll gladly merge it! Also, when writing code for the project **you must** use the [.editorconfig](https://github.com/Pocco81/DAPInstall.nvim/blob/main/.editorconfig) file on your editor so as to "maintain consistent coding styles". For instructions on how to use this file refer to [EditorConfig's website](https://editorconfig.org/).

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
