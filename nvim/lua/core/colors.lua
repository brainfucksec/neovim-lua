-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

--[[
Set Neovim UI color scheme.
Current available color schemes: onedark, kanagawa, monokai, rose-pine.

Insert preferred color scheme in the `color_scheme` variable.
Color scheme is loaded at "Load color scheme" after settings sections, setup
must be called before loading.
--]]
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

--[[
Color scheme settings:
For changes to the color scheme refer to the project instructions,
usually found in the README file of the git package.
--]]

-- OneDark
-- https://github.com/navarasu/onedark.nvim/?tab=readme-ov-file#configuration
require('onedark').setup {
  -- styles: dark, darker, cool, deep, warm, warmer, light
  style = 'darker',
  colors = { fg = '#b2bbcc' }, -- override default: #a0a8b7
  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'none',
    keywords = 'bold',
    functions = 'bold',
  },
}

-- Kanagawa
-- https://github.com/rebelot/kanagawa.nvim#configuration
require('kanagawa').setup {
  undercurl = false, -- disable undercurl
  commentStyle = { italic = false },
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
    colors = {  -- add/modify theme and palette colors
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
      return {}
    end,
    theme = "wave",   -- Load "wave" theme when 'background' option is not set
    background = {    -- map the value of 'background' option to a theme
      dark = "wave",  -- try "dragon" !
      light = "lotus"
    },
}

--[[
Load color scheme:
Note: The instruction to load the color scheme may vary depending on the
package.
See the README of the color scheme (i.e. git package) for information, for
example: require('color_scheme').setup{}, vim.cmd('color_scheme')
--]]
require('onedark').load()
--vim.cmd("colorscheme kanagawa")
--require('monokai').setup {}
--vim.cmd("colorscheme rose-pine")

