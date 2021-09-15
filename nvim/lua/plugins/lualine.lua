-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: lualine
-- https://github.com/hoob3rt/lualine.nvim

require('lualine').setup {
  options = {
    theme = 'molokai',
    icons_enabled = true,
    extensions = {'nvim-tree'},
  };
}
