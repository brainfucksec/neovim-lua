-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim


local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
  return
end

ibl.setup {
  char = "▏",
  use_treesitter = true,
  show_first_indent_level = true,
  filetype_exclude = {
    'lspinfo',
    'packer',
    'checkhealth',
    'help',
    'man',
    'dashboard',
    'git',
    'markdown',
    'text',
    'terminal',
    'NvimTree',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
    'quickfix',
    'prompt',
  },
}
