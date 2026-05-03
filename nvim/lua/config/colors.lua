-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

--[[
Set Neovim UI color scheme.
Current available color schemes: onedark, kanagawa, monokai-pro, rose-pine.
See: https://github.com/brainfucksec/neovim-lua#appearance

Insert preferred color scheme in the `color_scheme` variable.
Note: Color scheme is loaded in the "Load color scheme" section below, setup
must be called before loading.
--]]
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

--[[
Color schemes settings:
For configuration of the color scheme refer to the project instructions,
usually found in the README file of the git package.
--]]

-- OneDark
-- https://github.com/navarasu/onedark.nvim/?tab=readme-ov-file#configuration
require('onedark').setup({
  -- styles: dark, darker, cool, deep, warm, warmer, light
  style = 'darker',
  -- Custom Highlights
  colors = { fg = '#b2bbcc' }, -- override default: #a0a8b7

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = 'none',
    keywords = 'bold',
    functions = 'bold',
    strings = 'none',
    variables = 'none'
  },
})

-- Kanagawa
-- https://github.com/rebelot/kanagawa.nvim#configuration
require('kanagawa').setup({
  undercurl = false, -- disable undercurl
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false, bold = true },
  statementStyle = { bold = true },
  typeStyle = {},
    colors = {  -- add/modify theme and palette colors
      palette = {},
      theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    theme = "wave",   -- Load "wave" theme when 'background' option is not set
    background = {    -- map the value of 'background' option to a theme
      dark = "wave",  -- try "dragon" !
      light = "lotus"
    },
})

-- Monokai Pro
-- https://github.com/loctvl842/monokai-pro.nvim?tab=readme-ov-file#-configuration
require('monokai-pro').setup({
  styles = {
    comment = { italic = false },
    keyword = { italic = true },        -- any other keyword
    type = { italic = false },          -- (preferred) int, long, char, etc
    storageclass = { italic = true },   -- static, register, volatile, etc
    structure = { italic = false },     -- struct, union, enum, etc
    parameter = { italic = false },     -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true },  -- attribute of tag in reactjs
  },
})


--[[
Load color scheme:
Note: The instruction to load the color scheme may vary depending on the
package.
See the README of the related color scheme (i.e. git package) for information,
Examples: require('color_scheme').setup{}, vim.cmd('color_scheme')
--]]
--]]
require('onedark').load()
--vim.cmd("colorscheme kanagawa")
--vim.cmd("colorscheme monokai-pro")
--vim.cmd("colorscheme rose-pine")
