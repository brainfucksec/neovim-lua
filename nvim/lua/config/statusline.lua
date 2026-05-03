-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim

--[[
For the configuration see README #Usage and customization:
https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#usage-and-customization

You can also help with documentation in the wiki:
https://github.com/nvim-lualine/lualine.nvim/wiki
--]]

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

require('lualine').setup {
  -- Global options
  -- https://github.com/nvim-lualine/lualine.nvim#global-options
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      'NvimTree',
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = false,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },

  -- General component options
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
      {
        'diagnostics',
        sources = {'nvim_lsp'},
      }
    },
    lualine_c = {
      { 'filename', path=3 }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename', path=3 }
    },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
    lualine_c = {
      { 'filename', path=0 }
    },
  },
  inactive_winbar = {},
  extensions = {}
}

