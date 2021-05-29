-----------------------------------------------------------
-- Keymapping
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
-- init.lua

local map = vim.api.nvim_set_keymap

-- basic autopair
map('i', '"', '""<left>', {noremap = true, silent = true})
map('i', '`', '``<left>', {noremap = true, silent = true})
map('i', '(', '()<left>', {noremap = true, silent = true})
map('i', '[', '[]<left>', {noremap = true, silent = true})
map('i', '{', '{}<left>', {noremap = true, silent = true})
map('i', '{<CR>', '{<CR}<ESC>0', {noremap = true, silent = true})
map('i', '{;<CR>', '{<CR};<ESC>0', {noremap = true, silent = true})

-- autocomplete with Tab
map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', {noremap = true, silent = true})

-- press kk to exit
map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- fast saving
map('n', '<leader>s', ':w<cr>', {noremap = true, silent = true})
map('i', '<leader>s', '<C-c>:w<cr>', {noremap = true, silent = true})

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', {noremap = true, silent = true})
map('n', '<C-j>', '<C-w>j', {noremap = true, silent = true})
map('n', '<C-k>', '<C-w>k', {noremap = true, silent = true})
map('n', '<C-l>', '<C-w>l', {noremap = true, silent = true})

-- nvim-tree shortcuts
map('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<leader>r', ':NvimTreeRefresh<CR>', {noremap = true, silent = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})

-- open/close tagbar
map('', '<C-m>', ':TagbarToggle<CR>', {noremap = true, silent = true})
