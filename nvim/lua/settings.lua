-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-- This file can be loaded by calling `require('module_name')` from your
--- init.lua

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	-- execute Vimscript
local fn = vim.fn       				-- call Vim functions
local g = vim.g         				-- global variables
local o = vim.o         				-- global options
local b = vim.bo        				-- buffer-scoped options
local w = vim.wo        				-- windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','           -- change leader to a comma
o.mouse = 'a'               -- enable mouse support
o.clipboard = 'unnamedplus' -- copy/paste to system clipboard
b.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
o.syntax = 'enable'         -- enable syntax highlighting
w.number = true             -- show line number
o.showmatch = true          -- highlight matching parenthesis
w.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
w.colorcolumn = '80'        -- line lenght marker at 80 columns
o.splitright = true         -- vertical split to the right
o.splitbelow = true         -- orizontal split to the bottom
o.ignorecase = true         -- ignore case letters when search
o.smartcase = true          -- ignore lowercase for the whole pattern

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
o.hidden = true         -- enable background buffers
o.history = 100         -- remember n lines in history
o.lazyredraw = true     -- faster scrolling
b.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
o.termguicolors = true          -- enable 24-bit RGB colors
cmd([[colorscheme molokai]])    -- set colorscheme

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
b.expandtab = true      -- use spaces instead of tabs
b.shiftwidth = 4        -- shift 4 spaces when tab
b.tabstop = 4           -- 1 tab == 4 spaces
b.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
cmd([[
  autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0
]])

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]])

-- 8 spaces for Go files
cmd([[autocmd FileType go setlocal shiftwidth=8 tabstop=8]])

-- IndentLine
--g.indentLine_setColors = 0  -- set indentLine color
g.indentLine_char = '|'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
cmd([[
	autocmd FileType markdown let g:indentLine_enabled=0
]])

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
o.completeopt = 'menuone,noselect,noinsert' -- completion options
o.shortmess = 'c' 	-- don't show completion messages
