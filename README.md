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


<kbd><img src ="https://i.imgur.com/khiAyHd.gif"></kbd>
<p align="center">
	Demo
</p><hr>


# TL;DR

<div style="text-align: justify">
	DAPInstall.nvim is a NeoVim plugin written in Lua that aims to provide a the simple functionality of highlighting text like one would do in a normal document editor. To use it, install it with your favorite plugin manager, select something in visual mode and then run :HSHighlight. You can also add keybindings to the commands.
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
	* [Highlight Colors](#highlight-colors)
* [Key Bindings](#-key-bindings)
* [Contribute](#-contribute)
* [Inspirations](#-inspirations)
* [License](#-license)
* [FAQ](#-faq)
* [To-Do](#-to-do)

# 🎁 Features
- Highlight visual selection in any given *pre-defined* color.
- Remove highlighting from lines in visual selection.
- Users can set up foreground and background of any color.
- Has a "smart" option to set foreground based on background.
- Users can add any amount of colors.
- Produce a *verbose* output for debugging (optional).

# 📺 Notices
Checkout the [CHANGELOG.md](https://github.com/Pocco81/DAPInstall.nvim/blob/main/CHANGELOG.md) file for more information on the notices below:

- **26-05-21**: Fixed bug that prevented adding new colors and added option to remove all highlighting from the current buffer
- **25-05-21**: Just released!

# 📦 Installation

## Prerequisites

- [NeoVim nightly](https://github.com/neovim/neovim/releases/tag/nightly) (>=v0.5.0)
- A nice color scheme to complement your experience ;)

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
verbosity = 0,
highlight_colors = {
	color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
	color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
	color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
	color_3 = {"#8A2BE2", "smart"},	-- Proton purple
	color_4 = {"#FF4500", "smart"},	-- Orange red
	color_5 = {"#008000", "smart"},	-- Office green
	color_6 = {"#0000FF", "smart"},	-- Just blue
	color_7 = {"#FFC0CB", "smart"},	-- Blush pink
	color_8 = {"#FFF9E3", "smart"},	-- Cosmic latte
	color_9 = {"#7d5c34", "smart"},	-- Fallow brown
}
```

The way you setup the settings on your config varies on whether you are using vimL for this or Lua.


<details>
    <summary>For init.lua</summary>
<p>

```lua
local high_str = require("high-str")

high_str.setup({
	verbosity = 0,
	highlight_colors = {
		-- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
		color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
		color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
		color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
		color_3 = {"#8A2BE2", "smart"},	-- Proton purple
		color_4 = {"#FF4500", "smart"},	-- Orange red
		color_5 = {"#008000", "smart"},	-- Office green
		color_6 = {"#0000FF", "smart"},	-- Just blue
		color_7 = {"#FFC0CB", "smart"},	-- Blush pink
		color_8 = {"#FFF9E3", "smart"},	-- Cosmic latte
		color_9 = {"#7d5c34", "smart"},	-- Fallow brown
	}
})
```
<br />
</details>


<details>
    <summary>For init.vim</summary>
<p>

```lua
lua << EOF
local high_str = require("high-str")


high_str.setup({
	verbosity = 0,
	highlight_colors = {
		-- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
		color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
		color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
		color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
		color_3 = {"#8A2BE2", "smart"},	-- Proton purple
		color_4 = {"#FF4500", "smart"},	-- Orange red
		color_5 = {"#008000", "smart"},	-- Office green
		color_6 = {"#0000FF", "smart"},	-- Just blue
		color_7 = {"#FFC0CB", "smart"},	-- Blush pink
		color_8 = {"#FFF9E3", "smart"},	-- Cosmic latte
		color_9 = {"#7d5c34", "smart"},	-- Fallow brown
	}
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
All the commands follow the *camel casing* naming convention and have the `HS` prefix so that it's easy to remember that they are part of the DAPInstall.nvim plugin. These are all of them:

## Default
- `:HSHighlight <integer>` highlights current visual selection and receives an `<integer>` that indicates which colors to use from the `highlight_colors = {}` table; if none is given, DAPInstall.nvim will pick `color_1`.
- `:HSRmHighlight <rm_all>` If the `rm_all` argument is given, removes all the highlighting in the current buffer. If not, does the same but for every line in visual selection.

# 🐬 Configuration
Although settings already have self-explanatory names, here is where you can find info about each one of them and their classifications! 

## General
This settings are unrelated to any group and are independent.
- `verbosity`: (Integer) if greater that zero, enables verbose output (print what it does when you execute any of the two command).

## Highlight Colors
The table `highlight_colors = {}` contains all of the colors DAPInstall.nvim will use when you highlight something. The convention is simple: `color_<a_number>`. Each color is a table in which the first element represents the background of the color (the highlight it self), and the second one represents the foreground (the color of the text that's being highlighted). The second parameter may also be the word "smart", to change the color of the foreground based on the background in order to get a better contrast (e.g. if background is white, set foreground to black). Here is an example:

```
color_1 = {"#FFF9E3", "smart"}
```

Here we are setting a cool color called Cosmic Latte (looks like white), that we are assigning to `color_1` and we are giving its parameters to a table: the first one is the highlight itself ("#FFF9E3") and in the second one ("smart") we are telling it to set a foreground that will make contrast with the background (black in this case).

Conditions:
- The numbers that are assigned to the colors (e.g. `color_2`) should not be repeated, because it's what you'll use to "call" that highlight color.
- The color it self (argument one in a color's table) should be in its hex value.

# 🧻 Key-bindings
There are no default key-bindings. However, you can set them on your own as you'd normally do! Here is an example mapping `<F3>` to highlight stuff and `<F4>` to remove the highlighting:

**For init.lua**
```lua
vim.api.nvim_set_keymap(
    "v",
    "<F3>",
    ":<c-u>HSHighlight 1<CR>",
    {
        noremap = true,
        silent = true
    }
)

vim.api.nvim_set_keymap(
    "v",
    "<F4>",
    ":<c-u>HSRmHighlight<CR>",
    {
        noremap = true,
        silent = true
    }
)
```

**For init.vim**
```vimscript
vnoremap <silent> <f3> :<c-u>HSHighlight 1<CR>
vnoremap <silent> <f4> :<c-u>HSRmHighlight<CR>

```

# 🙋 FAQ

- Q: ***"What if I repeat a color's number?"***
- A: There would a conflict when calling `:HSHighlight`, however it will try and call any of those colors.

- Q: ***"How can I view the doc from NeoVim?"***
- A: Use `:help DAPInstall.nvim`


# 🫂 Contribute

Pull Requests are welcomed as long as they are properly justified and there are no conflicts. If your PR has something to do with the README or in general related with the documentation, I'll gladly merge it! Also, when writing code for the project **you must** use the [.editorconfig](https://github.com/Pocco81/DAPInstall.nvim/blob/main/.editorconfig) file on your editor so as to "maintain consistent coding styles". For instructions on how to use this file refer to [EditorConfig's website](https://editorconfig.org/).

# 💭 Inspirations

The following projects inspired the creation of DAPInstall.nvim. If possible, go check them out to see why they are so amazing :]
- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua): The fastest Neovim colorizer.

# 📜 License

DAPInstall.nvim is released under the GPL v3.0 license. It grants open-source permissions for users including:

- The right to download and run the software freely
- The right to make changes to the software as desired
- The right to redistribute copies of the software
- The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/DAPInstall.nvim/blob/main/LICENSE.md).

# 📋 TO-DO

**High Priority**
- Store and Restore highlights on a per-file basis

**Low Priority**
- Add tab completion to get more than 10 numbers.

<hr>
<p align="center">
	Enjoy!
</p>
