-----------------------------------------------------------
-- Autocommand Functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', {clear = true})
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = '1000'})
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Settings for fyletypes:
-- Disable line lenght marker
augroup('setLineLenght', {clear = true})
autocmd('Filetype', {
  group = 'setLineLenght',
  pattern = {'*.txt', '*.md', '*.html', '*.xhtml', '*.js', '*.ts'},
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', {clear = true})
autocmd('Filetype', {
  group = 'setIndent',
  pattern = {'*.xml', '*.html', '*.xhtml', '*.css', '*.scss', '*.js',
    '*.ts', '*.json', '*.yaml', '*.lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Terminal:
-- open a Terminal on the right tab
autocmd('CmdlineEnter', {
  pattern = '*',
  command = 'command! Term :botright vsplit term://$SHELL'
})

-- Terminal settings:
-- enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})

-- close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})
