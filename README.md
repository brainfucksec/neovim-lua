# Neovim Lua

### My Neovim configuration with Lua

![.](img/1-init.lua.png)

This setup is for [neovim >= v0.5.0](https://github.com/neovim/neovim/releases/tag/v0.5.0)

## Plugins

[paq-nvim](https://github.com/savq/paq-nvim) - Neovim package manager written in Lua

[indentLine](https://github.com/Yggdroot/indentLine) - Show indent lines

[lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - Statusline written in pure Lua

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Auto completion plugin

[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of common configurations for Neovim's built-in language server client.

[nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) - A File Explorer written In Lua

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Nvim Treesitter configurations and abstraction layer

[nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - A Lua fork of vim-devicons

[vista.vim](https://github.com/liuchengxu/vista.vim) - View and search LSP symbols, tags in Vim/NeoVim

## Directory tree of Lua files
```
~/.config/nvim
├── after
├── lua
│   ├── plugins
│   │   ├── lualine.lua
│   │   ├── nvim-cmp.lua
│   │   ├── nvim-lspconfig.lua
│   │   ├── nvim-tree.lua
│   │   ├── nvim-treesitter.lua
│   │   ├── paq-nvim.lua
│   │   └── vista.lua
│   ├── keymaps.lua
│   └── settings.lua
└── init.lua
```

## Files and settings

* [init.lua](nvim/init.lua): Main configuration file (call `lua` modules, load plugins etc.)

* [lua](nvim/lua): Folder of `lua` modules, here reside all the Lua modules that needed. These modules are called from `init.lua` file (See below).  For plugins settings I use the convention `/lua/plugins/<plugin_name>.lua>`.  See: https://github.com/nanotee/nvim-lua-guide#where-to-put-lua-files

* [keymaps.lua](nvim/lua/keymaps.lua): Keymaps configuration file, vim/neovim and plugins keymaps.

* [settings.lua](nvim/lua/settings.lua): General Neovim settings and configuration

* [plugins/lualine.lua](nvim/lua/plugins/lualine.lua): Statusline configuration file (in this case I use this file for [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) configuration)

* [plugins/nvim-cmp.lua](nvim/lua/plugins/nvim-cmp.lua): Autocompletion settings, TAB completion also for LSP

* [plugins/nvim-lspconfig.lua](nvim/lua/plugins/nvim-lspconfig.lua): LSP configuration: in this file I insert the language servers for LSP

* [plugins/nvim-tree.lua](nvim/lua/plugins/nvim-tree.lua): File manager settings

* [plugin/nvim-treesitter](nvim/lua/plugins/nvim-treesitter): Treesitter interface

* [plugins/paq-nvim.lua](nvim/lua/plugins/paq-nvim.lua): Plugin manager settings

* [plugins/vista.lua](nvim/lua/plugins/vista.lua): Tag viewer settings

## Screenshots

`Bash`

![.](img/2-bash.png)

`C`

![.](img/3-c.png)

`Python`

![.](img/4-python.png)

## Appearance

Colorscheme: [Neovim Monokai](https://github.com/tanvirtin/monokai.nvim)

Fonts: [Cozette](https://github.com/slavfox/Cozette)

Icons: [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)

## Startup time

![.](img/5-startuptime.png)

## Installation

1. Install [neovim >= v0.5.0](https://github.com/neovim/neovim/releases/tag/v0.5.0)

2. Install [npm](https://github.com/npm/cli) (for download the packages of LSP language servers)

3. Download [this repository](https://github.com/brainfucksec/neovim-lua) with `git` and copy the `nvim` folder
```bash
    git clone https://github.com/brainfucksec/neovim-lua.git
    cd neovim-lua/
    cp -Rv nvim ~/.config/nvim/
```

4. Install [Paq](https://github.com/savq/paq-nvim#installation)

5. Open `neovim` and run the command [:PaqInstall](https://github.com/savq/paq-nvim#commands) to install the plugins

## LSP Configuration

1. Install LSP language servers with `npm`
```bash
    sudo npm install -g bash-language-server pyright vscode-langservers-extracted
```

2. Install [clang](https://clangd.llvm.org/installation.html) for use LSP with [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd)

3. Open a file with `neovim` and run command [:LspInfo](https://github.com/neovim/nvim-lspconfig#built-in-commands) for testing the LSP support

Supported languages in my configuration:

Bash - [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls)

Python - [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright)

C, C++ - [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd)

HTML, CSS, JavaScript - [vscode-html](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html)

See: [nvim-lspconfig #CONFIG.md](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)

## TODO

* Improve LSP configuration

* Add Go,Lua (and other languages) to LSP configuration

* Add custom startscreen when Neovim is opened without arguments
---

## Guides and resources

* https://github.com/nanotee/nvim-lua-guide

* https://alpha2phi.medium.com/neovim-init-lua-e80f4f136030

* https://oroques.dev/notes/neovim-init/

* https://github.com/ibhagwan/nvim-lua

* https://github.com/mjlbach/defaults.nvim/blob/master/init.lua

* https://github.com/siduck76/NvChad

* https://www.reddit.com/r/neovim/

## Lua resources

* Lua in Y minutes - https://learnxinyminutes.com/docs/lua/

* Lua Quick Guide - https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb

* Lua 5.1 Reference Manual - https://www.lua.org/manual/5.1/

## Disclaimer

* This configuration is in development version.  See: `Version` on [init.lua](nvim/init.lua) file.

* The configuration is being migrated from VimL (Vim Script) to Lua.

* As all my setups I try to follow the [KISS](https://en.wikipedia.org/wiki/KISS_principle) principle, probably some concepts may not be valid for everyone, then feel free to take what you need but don't install anything without checking first!
---

#### Thanks to all the authors of the sources mentioned above and to all the others from whom I "stole" some configs :)
