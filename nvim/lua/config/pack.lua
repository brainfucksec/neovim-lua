-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Manage (git) plugins with vim.pack
-- See: :help vim.pack
-- https://neovim.io/doc/user/pack/#vim.pack

--[[
  NOTE:
    - vim.pack-directory: ~/.local/share/nvim-new/site/pack/core/opt
    - lock file: ~/.config/nvim/nvim-pack-lock.json

  For information about installed plugins on neovim-lua see:
  neovim-lua/#plugins: https://github.com/brainfucksec/neovim-lua?tab=readme-ov-file#plugins
--]]

-- Load plugins:
vim.pack.add({
  --[[
  Colorschemes:
  The colorscheme should be available when starting Neovim.
  Current available color schemes: onedark (default), kanagawa, monokai-pro, rose-pine
  See: /nvim/lua/core/colors.lua
  --]]
  'https://github.com/navarasu/onedark.nvim',       -- OneDark
  'https://github.com/rebelot/kanagawa.nvim',       -- Kanagawa
  'https://github.com/loctvl842/monokai-pro.nvim',  -- Monokai Pro

  {
    src = 'https://github.com/rose-pine/neovim',    -- Rosè Pine
    name = 'rose-pine'
  },

  -- Icons: nvim-web-devicons
  'https://github.com/kyazdani42/nvim-web-devicons',

  -- Dashboard: alpha-nvim
  'https://github.com/goolord/alpha-nvim',

  -- Gitsigns
  'https://github.com/lewis6991/gitsigns.nvim',

  -- Statusline: lualine
  'https://github.com/nvim-lualine/lualine.nvim',

  -- Indentline: indentBlankline
  'https://github.com/lukas-reineke/indent-blankline.nvim',

  -- File Explorer: nvim-tree.lua
  'https://github.com/kyazdani42/nvim-tree.lua',

  -- Treesitter: nvim-treesitter
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main'
  },

  -- Tagbar
  'https://github.com/preservim/tagbar',

  -- Autopairs: nvim-autopairs
  'https://github.com/windwp/nvim-autopairs',

  -- Lua functions (for gitsigns etc.)
  'https://github.com/nvim-lua/plenary.nvim',

  -- LSP servers configuration: nvim-lspconfig
  'https://github.com/neovim/nvim-lspconfig',

  -- Snippets: luasnip
  'https://github.com/L3MON4D3/LuaSnip',

  -- Autocomplete: blink.cmp
  {
    src = 'https://github.com/Saghen/blink.cmp',
    -- See: https://cmp.saghen.dev/installation
    version = vim.version.range("1.*"),
  },
})

-- Start plugins setup (use plugins immediately)
require('nvim-autopairs').setup()
require('gitsigns').setup()
