--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝


neovim configuration file

Version: 0.5.0_alpha - 2021/08/25
Maintainer: Brainfuck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-----------------------------------------------------------
-- Load plugins
-----------------------------------------------------------
-- paq-nvim
vim.cmd 'packadd paq-nvim'            -- load package
local paq = require('paq-nvim').paq   -- import module with `paq` function

-- add packages
require 'paq'{
  'savq/paq-nvim';  -- let paq manage itself

  'Yggdroot/indentLine';
  'hoob3rt/lualine.nvim';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
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
require('nvim-cmp/main') 	      -- autocomplete
require('nvim-tree/main')	      -- file manager
require('nvim-lspconfig/main') 	-- LSP settings
