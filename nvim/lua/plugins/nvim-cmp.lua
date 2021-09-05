-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
--- https://github.com/hrsh7th/nvim-cmp
local cmp = require 'cmp'
cmp.setup {
  mapping = {
    ['<S-Tab]>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    {
      name = 'buffer',
      opts = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
  },
}
