<p align="center">
<img src="img/logo.png" alt="neovim-lua_logo">
</p>

<h3 align="center">
Neovim KISS configuration with Lua
</h3>

---

## Table of Contents

* [Plugins](#plugins)
* [Directory Tree](#directory-tree)
* [Files and Settings](#files-and-settings)
* [Installation](#installation)
* [LSP Configuration](#lsp-configuration)
* [Appearance](#appearance)
* [Keymaps](#keymaps)
* [Configuration Check](#configuration-check)
* [Screenshots](#screenshots)
* [Guides and Resources](#guides-and-resources)
* [Other Neovim Lua Projects and Examples](#other-neovim-lua-projects-and-examples)
* [Lua Resources](#lua-resources)

## Plugins

[lazy.nvim](https://github.com/folke/lazy.nvim) - A modern plugin manager for Neovim

[feline.nvim](https://github.com/freddiehaddad/feline.nvim) (freddiehaddad Fork) - A minimal, stylish and customizable statusline for Neovim written in Lua

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

![alt text](img/dir-tree.png)

## Files and Settings

`/nvim`

* [init.lua](nvim/init.lua): Main configuration file that call `lua` modules

* [lua](nvim/lua): Folder of `lua` modules, here reside all the Lua modules that needed. These modules are called from `init.lua` file (see below).

See: https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files

`/nvim/lua/core`

* [autocmds.lua](nvim/lua/core/autocmds.lua): Define autocommands with Lua APIs

* [colors.lua](nvim/lua/core/colors.lua): Define Neovim and plugins color scheme

* [keymaps.lua](nvim/lua/core/keymaps.lua): Keymaps configuration file, vim/neovim and plugins keymaps

* [lazy.lua](nvim/lua/core/lazy.lua): Plugin manager configuration file

* [options.lua](nvim/lua/core/options.lua): General Neovim settings

* [statusline.lua](nvim/lua/core/statusline.lua): Statusline configuration file

`/nvim/lua/lsp`

* [lspconfig.lua](nvim/lua/lsp/lspconfig.lua): LSP configuration (language servers, keybinding)

`/nvim/lua/plugins`

* [alpha-nvim.lua](nvim/lua/plugins/alpha-nvim.lua): Dashboard

* [indent-blankline.lua](nvim/lua/plugins/indent-blankline.lua): Indent line

* [nvim-cmp.lua](nvim/lua/plugins/nvim-cmp.lua): Autocompletion settings

* [nvim-tree.lua](nvim/lua/plugins/nvim-tree.lua): File manager settings

* [nvim-treesitter](nvim/lua/plugins/nvim-treesitter): Treesitter interface configuration

## Installation

1. Install [Neovim v0.8.x](https://github.com/neovim/neovim/releases/latest).

2. Install [Nerd Fonts](https://www.nerdfonts.com/font-downloads), (the font of the screenshots are `JetBrainsMono Nerd Font`).

3. Install [Node.js - npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) for download packages of LSP language servers, see: [LSP Configuration](#lsp-configuration).

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

6. Install [lazy.nvim](https://github.com/folke/lazy.nvim) for install and manage the plugins, see: [lazy.nvim - Installation](https://github.com/folke/lazy.nvim#-installation)

7. Run Neovim for download/sync plugins with `lazy`

```term
nvim
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

**Fonts:** See: [Installation](#installation)

**Icons:** [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

The color scheme (default: OneDark) is defined in the following files:

* Neovim UI - [nvim/lua/core/colors.lua](nvim/lua/core/colors.lua):

```lua
-- Load nvim color scheme:
local status_ok, color_scheme = pcall(require, 'onedark')
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
```

* Statusline - [nvim/lua/core/statusline.lua](nvim/lua/core/statusline.lua):

```lua
-- Set colorscheme (from core/colors.lua/colorscheme_name)
local colors = require('core/colors').onedark_dark
```

## Keymaps

These are the default keymaps, in the following shortcuts, the `<leader>` key is set up to `,` (comma) character, see: [keymaps.lua](nvim/lua/core/keymaps.lua).

| Shortcut             | Mode          | Description                                       |
|----------------------|---------------|---------------------------------------------------|
| `kk`                 | Insert        | Esc with `kk`                                     |
| `<leader>c`          | Normal        | Clear search highlights                           |
| `<F2>`               | Normal        | Toggle Paste mode                                 |
| `<leader>tk/th`      | Normal        | Change split orientation (vertical/horizontal)    |
| `<Ctrl> + {h,j,k,l}` | Normal        | Move around splits windows                        |
| `<leader>r`          | Normal        | Reload configuration file                         |
| `<leader>s`          | Normal        | Save file                                         |
| `<leader>q`          | Normal        | Save (close all windows) and exit from Neovim     |
| `<Ctrl> + t`         | Normal        | Open terminal (`:Term`)                           |
| `<Esc>`              | Terminal      | Exit terminal                                     |
| `<Ctrl> + n`         | Normal        | Open NvimTree                                     |
| `<leader>z`          | Normal        | Open Tagbar                                       |

## Configuration Check

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

Also you can check the configuration of the Plugins and Neovim startup time with `lazy` commands:

```vim
:Lazy check

:Lazy profile
```

See: [lazy.nvim - Usage](https://github.com/folke/lazy.nvim#-usage)

## Screenshots

<p align="center">
<img src="img/banner.png">
</p>

<details><summary> <b>(Click to expand)</b></summary>

**OneDark (darker)**

![1-onedark.png](img/1-onedark.png)

**Monokai**

![2-monokai.png](img/2-monokai.png)

**Rosé Pine**

![3-rose-pine.png](img/3-rose-pine.png)

**lazy.nvim**

![4-lazy-nvim.png](img/4-lazy-nvim.png)

</details>

## Guides and Resources

* https://neovim.io/doc/user/lua.html

* https://github.com/nanotee/nvim-lua-guide

* https://dev.to/vonheikemen/everything-you-need-to-know-to-configure-neovim-using-lua-3h58

* https://www.old.reddit.com/r/neovim/

## Other Neovim Lua Projects and Examples

* https://github.com/LunarVim/Neovim-from-scratch

* https://github.com/siduck76/NvChad

* https://github.com/artart222/CodeArt

* https://github.com/crivotz/nv-ide

## Lua Resources

* Lua in Y minutes - https://learnxinyminutes.com/docs/lua/

* Lua Quick Guide - https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb

* Lua 5.4 Reference Manual - https://www.lua.org/manual/5.4/

---

## Disclaimer

This setup is based on [KISS](https://en.wikipedia.org/wiki/KISS_principle) principle, probably some concepts may not be valid for everyone. Then feel free to take what you need but **don't install anything without checking first!**

This setup is not a Framework but it is the configuration I use to work on Linux, it can be used by default as it can be a start point to understand how Neovim is structured and maybe improve this config.

## Thanks to:

- [All the contributors](https://github.com/brainfucksec/neovim-lua/graphs/contributors) who helped improve this setup with their reports and advices.

- All the authors of the sources mentioned above.

- The users of /r/Neovim subreddit for the support of the configuration.

