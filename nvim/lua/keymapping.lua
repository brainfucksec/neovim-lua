-----------------------------------------------------------
-- Keymapping
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
--- init.lua

local map = vim.api.nvim_set_keymap

local defaults = {noremap = true, silent = true}

-- basic autopair
map('i', '"', '""<left>', defaults)
map('i', '`', '``<left>', defaults)
map('i', '(', '()<left>', defaults)
map('i', '[', '[]<left>', defaults)
map('i', '{', '{}<left>', defaults)
map('i', '{<CR>', '{<CR}<ESC>0', defaults)
map('i', '{;<CR>', '{<CR};<ESC>0', defaults)

-- autocomplete with Tab
map('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
map('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
map('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- clear search highlighting
map('n', '<leader>c', ':nohl<CR>', defaults)

-- press kk to exit
map('i', 'kk', '<Esc>', {noremap = true})

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- fast saving
map('n', '<leader>s', ':w<cr>', defaults)
map('i', '<leader>s', '<C-c>:w<cr>', defaults)

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', defaults)
map('n', '<C-j>', '<C-w>j', defaults)
map('n', '<C-k>', '<C-w>k', defaults)
map('n', '<C-l>', '<C-w>l', defaults)

-- nvim-tree shortcuts
map('n', '<C-n>', ':NvimTreeToggle<CR>', defaults)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', defaults)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', defaults)

-- open/close tagbar
map('', '<C-m>', ':TagbarToggle<CR>', defaults)
