--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝


neovim configuration file

Version: 0.2.0_alpha - 2021/07/04
Maintainer: Brainfuck
Website: https://github.com/brainfucksec/dotfiles
--]]


-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
-- paq-nvim
vim.cmd 'packadd paq-nvim'      -- load package
local paq = require('paq-nvim').paq   -- import module with `paq` function
paq{'savq/paq-nvim', opt=true}  -- let paq manage itself

-- add packages
paq 'Yggdroot/indentLine'
paq 'hoob3rt/lualine.nvim'
paq 'hrsh7th/nvim-compe'
paq 'neovim/nvim-lspconfig'
paq 'kyazdani42/nvim-tree.lua'
paq 'kyazdani42/nvim-web-devicons'
paq 'preservim/tagbar'

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')         -- settings
require('keymapping')       -- keymapping
require('statusline')   	  -- statusline
require('nvim-compe/main') 	-- autocomplete
require('nvim-tree/main')	  -- file manager
require('nvim-lspconfig/main') 	-- LSP settings
