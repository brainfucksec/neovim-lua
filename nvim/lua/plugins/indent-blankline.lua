-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim


require('indent_blankline').setup {
  char = '|',
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'terminal',
    'packer'
  },
  buftype_exclude = {
    'terminal',
    'nofile'
  },
}
