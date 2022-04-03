--[[

Neovim init file
Version: 0.52.0 - 2022/04/03
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require('packer_init')
require('core/settings')
require('core/keymaps')
require('core/statusline')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/vista')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')
