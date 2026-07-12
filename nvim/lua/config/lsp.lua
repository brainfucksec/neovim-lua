-----------------------------------------------------------
-- LSP Configuration file
-----------------------------------------------------------

-- See: :help lsp

-- Enable LSP servers with LSP API
vim.lsp.enable({
  'bashls',
  'lua_ls',
  'pyright',
  'clangd',
  'html',
  'cssls',
  'ts_ls',
  'rust_analyzer',
})

vim.diagnostic.config({ virtual_text = true })

