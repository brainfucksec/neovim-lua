--[[
Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua
--]]

-- Import Lua modules
require('config/lazy')
require('config/options')
require('config/autocmds')
require('config/keymaps')
require('config/colors')
require('config/statusline')
require('plugin/nvim-tree')
require('plugin/indent-blankline')
require('plugin/nvim-treesitter')
require('plugin/nvim-cmp')
require('plugin/alpha-nvim')

-- Enable LSP
vim.lsp.enable({
  'bashls',
  'lua_ls',
  'pyright',
  'clangd',
  'html',
  'cssls',
  'ts_ls',
  'rust-analyzer'
})
