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
  code_style = {
    -- styles: italic, bold, none
    comments = 'none',
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

--[[
Statusline color schemes.
Return the selected color scheme from this file with: `return M.colorscheme_name`
where the color scheme name is the value of the variables below.

e.g.: `local colors = return M.onedark_dark`
The return value is also used by `core/statusline.lua`.

The color schemes below are created by following the "palette" schemes
retrieved from the READMEs of git project.  Color names are adapted to maintain
a pattern of the statusline settings, original names can be different.
--]]

local M = {}

-- Theme: OneDark (darker)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
  bg = '#282c34',
  fg = '#b2bbcc',
  pink = '#c678dd',
  green = '#98c379',
  cyan = '#56b6c2',
  yellow = '#e5c07b',
  orange = '#d19a66',
  red = '#e86671'
}

-- Theme: Kanagawa
-- Colors: https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file#color-palette
M.kanagawa = {
  bg = '#16161d',
  fg = '#c8c093',
  pink = 'd27e99',
  green = '76946a',
  cyan = '6a9589',
  yellow = 'dca561',
  orange = 'ff9e3b',
  red = 'c34043'
}

-- Theme: Monokai (classic)
-- Colors: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
M.monokai = {
  bg = '#202328', -- default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  red = '#e95678'
}

-- Theme: Rosé Pine (main)
-- Colors: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
-- color names are adapted to the formats above
M.rose_pine = {
  bg = '#111019', -- default: #191724
  fg = '#e0def4',
  pink = '#eb6f92',
  green = '#9ccfd8',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  red = '#ebbcba'
}

-- Set status line color scheme
return M.onedark_dark
