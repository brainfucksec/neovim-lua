--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝


neovim configuration file

Version: 0.3.1_alpha - 2021/08/01
Maintainer: Brainfuck
Website: https://github.com/brainfucksec/dotfiles

--]]


-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
-- paq-nvim
vim.cmd 'packadd paq-nvim'            -- load package
local paq = require('paq-nvim').paq   -- import module with `paq` function

-- add packages
require 'paq'{
  'savq/paq-nvim';  -- let paq manage itself

  'Yggdroot/indentLine';
  'hoob3rt/lualine.nvim';
  'hrsh7th/nvim-compe';
  'neovim/nvim-lspconfig';
  'kyazdani42/nvim-tree.lua';
  'kyazdani42/nvim-web-devicons';
  'preservim/tagbar';
}

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')             -- settings
require('keymapping')           -- keymapping
require('statusline')   	      -- statusline
require('nvim-compe/main') 	    -- autocomplete
require('nvim-tree/main')	      -- file manager
require('nvim-lspconfig/main') 	-- LSP settings
