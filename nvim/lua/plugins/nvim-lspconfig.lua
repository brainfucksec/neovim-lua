-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
--- `init.lua`

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
--- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  capabilities = capabilities,
}

