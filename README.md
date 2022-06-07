<p align="center">
<img src="img/logo.png" alt="neovim-lua_logo">
</p>

<h3 align="center">
Neovim KISS configuration with Lua
</h3>

## Table of Contents

* [Plugins](#plugins)
* [Directory Tree](#directory-tree)
* [Files and Settings](#files-and-settings)
* [Installation](#installation)
* [LSP Configuration](#lsp-configuration)
* [Appearance](#appearance)
* [Configuration Check](#configuration-check)
* [Screenshots](#screenshots)

## Plugins

[packer.nvim](https://github.com/wbthomason/packer.nvim) -  A use-package inspired plugin manager for Neovim

[feline.nvim](https://github.com/feline-nvim/feline.nvim) - A minimal, stylish and customizable statusline for Neovim written in Lua

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Auto completion plugin

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua

[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer written In Lua

[indentBlankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Adds indentation guides to all lines (including empty lines)

[nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A super powerful autopairs for Neovim

[Tagbar](https://github.com/preservim/tagbar) - A class outline viewer for Vim

[gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Super fast git decorations implemented purely in lua/teal

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[alpha-nvim](https://github.com/goolord/alpha-nvim) - A fast and highly customizable greeter for neovim.

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

## Directory Tree

`${HOME}/.config/nvim`

```
├── lua
│   ├── core
│   │   ├── autocmds.lua
│   │   ├── colors.lua
│   │   ├── keymaps.lua
│   │   ├── options.lua
│   │   └── statusline.lua
│   ├── plugins
│   │   ├── alpha-nvim.lua
│   │   ├── indent-blankline.lua
│   │   ├── nvim-cmp.lua
│   │   ├── nvim-lspconfig.lua
│   │   ├── nvim-tree.lua
│   │   └── nvim-treesitter.lua
│   └── packer_init.lua
├── plugin
│   └── packer_compiled.lua
└── init.lua
```

## Files and Settings

`/nvim`

* [init.lua](nvim/init.lua): Main configuration file that call `lua` modules

* [lua](nvim/lua): Folder of `lua` modules, here reside all the Lua modules that needed. These modules are called from `init.lua` file (see below).

See: https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files

`/nvim/lua`

* [packer_init.lua](nvim/lua/packer_init.lua): Load plugins

`/nvim/lua/core`

* [autocmds.lua](nvim/lua/core/autocmds.lua): Define autocommands with Lua APIs

* [colors.lua](nvim/lua/core/colors.lua): Define Neovim and plugins color scheme

* [keymaps.lua](nvim/lua/core/keymaps.lua): Keymaps configuration file, vim/neovim and plugins keymaps

* [options.lua](nvim/lua/core/options.lua): General Neovim settings

* [statusline.lua](nvim/lua/core/statusline.lua): Statusline configuration file

`/nvim/lua/plugins`

* [packer.lua](nvim/lua/plugins/packer.lua): Plugin manager settings

* [alpha-nvim.lua](nvim/lua/plugins/alpha-nvim.lua): Dashboard

* [indent-blankline.lua](nvim/lua/plugins/indent-blankline.lua): Indent line

* [nvim-cmp.lua](nvim/lua/plugins/nvim-cmp.lua): Autocompletion settings

* [nvim-lspconfig.lua](nvim/lua/plugins/nvim-lspconfig.lua): LSP configuration (language servers, keybinding)

* [nvim-tree.lua](nvim/lua/plugins/nvim-tree.lua): File manager settings

* [nvim-treesitter](nvim/lua/plugins/nvim-treesitter): Treesitter interface configuration

## Installation

1. Install [Neovim v0.7.x](https://github.com/neovim/neovim/releases/latest).

2. Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads), (for the font of the screenshots install [Cozette Font](https://github.com/slavfox/Cozette)).

3. Install [npm](https://github.com/npm/cli) for download packages of LSP language servers, see: [LSP Configuration](#lsp-configuration).

4. Make a backup of your current `nvim` folder if necessary:

```term
mv ~/.config/nvim ~/.config/nvim.backup
```

5. Download neovim-lua with `git` and copy the `nvim` folder in the `${HOME}/.config` directory:

```term
git clone https://github.com/brainfucksec/neovim-lua.git
cd neovim-lua/
cp -Rv nvim ~/.config/
```

6. Install [packer.nvim](https://github.com/wbthomason/packer.nvim) for install and manage the plugins:

```term
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

7. Run Neovim with `PackerSync` command:

```term
nvim +PackerSync
```

## LSP Configuration

1. Install LSP language servers with `npm`

```term
sudo npm install -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server
```

2. Install additional packages for plugins support:

**C, C++:**

* [clang](https://clangd.llvm.org/installation.html) for use LSP with [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd).

* [ctags](https://github.com/universal-ctags/ctags) to view tags with [Tagbar](https://github.com/preservim/tagbar).

**Python:**

* [pynvim](https://github.com/neovim/pynvim)

3. Open a source file of one of the supported languages with Neovim, and run command [:LspInfo](https://github.com/neovim/nvim-lspconfig#built-in-commands) for testing the LSP support.

### Languages Currently Supported

Lua - [builtin](https://neovim.io/doc/user/lua.html)

Bash - [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)

Python - [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright)

C, C++ - [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd)

HTML, CSS, JSON - [vscode-html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)

JavaScript, TypeScript - [tsserver](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)

See: [nvim-lspconfig #doc/server_configurations.md](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## Appearance

### Available Colorschemes

* [OneDark](https://github.com/navarasu/onedark.nvim)

* [Neovim Monokai](https://github.com/tanvirtin/monokai.nvim)

* [Rose Pine](https://github.com/rose-pine/neovim)

**Fonts:** [Cozette](https://github.com/slavfox/Cozette)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

The color scheme is defined in the following files (default: OneDark):

* Neovim UI - [nvim/lua/core/colors.lua](nvim/lua/core/colors.lua):

```lua
-- Load nvim color scheme:
...color_scheme = pcall(require, 'onedark')
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
```

* Statusline - [nvim/lua/plugins/feline.lua](nvim/lua/plugins/feline.lua):

```lua
-- Set colorscheme (from core/colors.lua/colorscheme_name)
local colors = require('core/colors').onedark_dark
```

## Configuration check

- Open nvim and run command `checkhealth`, you should not see any error in the output (except for the one related to the Python 2 interpreter if don't have it):

```vim
:checkhealth
```

![alt text](img/checkhealth.png)

- You can also use the `startuptime` option to read the nvim startup logs:

```term
nvim --startuptime > /tmp/nvim-start.log

nvim /tmp/nvim-start.log
```

See: `:help startuptime`

## Screenshots

<p align="center">
<img src="img/banner.png">
</p>

<details><summary> <b>(Click to expand)</b></summary>

**OneDark (darker)**

![onedark_1](img/1-onedark_1.png)

![onedark_2](img/2-onedark_2.png)

**Monokai**

![monokai_1](img/3-monokai_1.png)

![monokai_2](img/4-monokai_2.png)

**Rosé Pine**

![rose-pine_1](img/5-rose-pine_1.png)

![rose-pine_2](img/6-rose-pine_2.png)

</details>

## TODO

* Add support for Rust programming language.
* Add another color scheme (not important).

## Guides and resources

* https://neovim.io/doc/user/lua.html

* https://github.com/nanotee/nvim-lua-guide

* https://dev.to/vonheikemen/everything-you-need-to-know-to-configure-neovim-using-lua-3h58

* https://www.old.reddit.com/r/neovim/

## Other Neovim Lua projects and examples

* https://github.com/LunarVim/Neovim-from-scratch

* https://github.com/siduck76/NvChad

* https://github.com/artart222/CodeArt

* https://github.com/crivotz/nv-ide

## Lua resources

* Lua in Y minutes - https://learnxinyminutes.com/docs/lua/

* Lua Quick Guide - https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb

* Lua 5.4 Reference Manual - https://www.lua.org/manual/5.4/

## Disclaimer

As all my setups I try to follow the [KISS](https://en.wikipedia.org/wiki/KISS_principle) principle, probably some concepts may not be valid for everyone.
Then feel free to take what you need but **don't install anything without checking first!**

---

**Thanks to all the authors of the sources mentioned above, to all the others from whom I "stole" some configs and thanks to the users of /r/Neovim subreddit for the support of the configuration :)**
