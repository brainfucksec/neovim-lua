-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
-- `init.lua`

local g = vim.g

-- plugin: nvim-lspconfig
--- For language server setup see: https://github.com/neovim/nvim-lspconfig

-- Bash --> bashls
--- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
require('lspconfig').bashls.setup{}

-- Python --> pyright
--- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
require('lspconfig').pyright.setup{}

-- C, C++ -->  clangd
--- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
require('lspconfig').clangd.setup{}

-- HTML, CSS, JavaScript --> vscode-html-languageserver
--- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html
require('lspconfig').html.setup {
  capabilities = capabilities,
}


