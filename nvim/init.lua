--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

Neovim init file

Version: 0.2.0 - 2021/10/01
Maintainer: Brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')                 -- settings
require('keymaps')                  -- keymaps
require('plugins/paq-nvim')         -- plugin manager
require('plugins/nvim-tree')	      -- file manager
require('plugins/feline')           -- statusline
require('plugins/nvim-cmp')         -- autocomplete
require('plugins/nvim-lspconfig')   -- LSP settings
require('plugins/vista')            -- tag viewer
require('plugins/nvim-treesitter')  -- tree-sitter interface
require('plugins/nvim-autopairs')   -- autopairs

