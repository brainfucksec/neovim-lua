-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- See: https://github.com/brainfucksec/neovim-lua#appearance

--[[
Set Neovim UI color scheme.
Note: The instruction to load the color scheme may vary depending on the
package.
See the README of color scheme (i.e. git package) for information, for
example: require('color_scheme').setup{}, vim.cmd('color_scheme').
--]]

-- Current available color schemes: onedark, monokai, rose-pine.
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

-- Add the color scheme in the `require` values below.
-- e.g.: require('monokai').setup{}

-- Set color scheme: OneDark
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
require('onedark').load()

--[[
Statusline color schemes.

Return the selected color scheme in this file with: `return M.colorscheme_name`
where the color scheme name is the value of the variables below.

e.g.: `local colors = return M.onedark_dark`
The return value is also used by `core/statusline.lua`.
--]]
local M = {}

--[[
The color schemes below are created by following the "palette" file color
schemes. Color names are adapted to maintain a pattern, original names can be
different.
--]]

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
  bg = '#282c34',
  fg = '#b2bbcc',
  pink = '#c678dd',
  green = '#98c379',
  cyan = '#56b6c2',
  yellow = '#e5c07b',
  orange = '#d19a66',
  red = '#e86671',
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
  red = '#e95678',
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
  red = '#ebbcba',
}

-- Current color scheme
return M.onedark_dark
