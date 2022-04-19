<p align="center">
  <h2 align="center">🐞 dap-budy</h2>
</p>

<p align="center">
	Debug Adapter Protocol manager for Neovim
</p>

<p align="center">
	<a href="https://github.com/Pocco81/dap-buddy.nvim/stargazers">
		<img alt="Stars" src="https://img.shields.io/github/stars/Pocco81/dap-buddy.nvim?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/Pocco81/dap-buddy.nvim/issues">
		<img alt="Issues" src="https://img.shields.io/github/issues/Pocco81/dap-buddy.nvim?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41"></a>
	<a href="https://github.com/Pocco81/dap-buddy.nvim">
		<img alt="Repo Size" src="https://img.shields.io/github/repo-size/Pocco81/dap-buddy.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41"/></a>
</p>

&nbsp;

<p align="center">
	Dap Buddy allows you to manage <a href="https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/">debuggers</a> provided by 
<a href="https://github.com/mfussenegger/nvim-dap">nvim-dap</a>. It should ease out the process of installing, configuring and interacting with said debuggers. No troubleshooting needed. Just _plug and play_. At the moment the plugin has gone through some problems that could be traced back to the codebase itself; that's why I'm going to be doing a rewrite: faster, better, and without all the bugs it originally had.
	Stay tuned!
</p>

&nbsp;

### 🪴 Index

+ [Development](#-development)
+ [License](#-license)

&nbsp;

### 🛠️ Development

1. Clone the repo
2. Run this command:
```bash
make
```
> This will load nvim and append your local clone's git root path to a new sessions' runtime path

3. After changing anything run (within nvim):
```vimscript
:luafile %
```
> Where `%` is the current file. It may be any other file's path.

&nbsp;

### 📜 License

AbbrevMan.nvim is released under the GPL v3.0 license. It grants open-source permissions for users including:

- The right to download and run the software freely
- The right to make changes to the software as desired
- The right to redistribute copies of the software
- The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/AbbrevMan.nvim/blob/main/LICENSE.md).

&nbsp;

---
