-----------------------------------------------------------
-- Keymapping
--- Keymaps configuration file, keymaps of neovim
--- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default = {noremap = true, silent = true}

-- Neovim shortcuts
-- basic autopair
map('i', '"', '""<left>', default)
map('i', '`', '``<left>', default)
map('i', '(', '()<left>', default)
map('i', '[', '[]<left>', default)
map('i', '{', '{}<left>', default)
map('i', '{<CR>', '{<CR}<ESC>0', default)
map('i', '{;<CR>', '{<CR};<ESC>0', default)

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', default)

-- press kk to exit
map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- fast saving
map('n', '<leader>s', ':w<cr>', default)
map('i', '<leader>s', '<C-c>:w<cr>', default)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default)
map('n', '<C-j>', '<C-w>j', default)
map('n', '<C-k>', '<C-w>k', default)
map('n', '<C-l>', '<C-w>l', default)

-- Plugins shortcuts:
-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default)       -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default)  -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default) -- search file

-- tagbar
map('', '<C-m>', ':TagbarToggle<CR>', default)  -- open/close
