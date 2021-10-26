-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim


local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
-- for packages info see: init.lua (Lua modules)
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  use 'kyazdani42/nvim-tree.lua'
  use 'Yggdroot/indentLine'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use 'liuchengxu/vista.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tanvirtin/monokai.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use { 'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }
end)
