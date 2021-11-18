-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- https://github.com/goolord/alpha-nvim


local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

-- setup footer
local function footer()
  local datetime = os.date('%Y/%m/%d %H:%M:%S')
  return datetime
end

-- header
dashboard.section.header.val = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

-- menu
dashboard.section.buttons.val = {
  dashboard.button('e', ' New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', ' Find file', ':NvimTreeOpen<CR>'),
  dashboard.button('s', ' Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', ' Update plugins', ':PackerUpdate<CR>'),
  dashboard.button('q', ' Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

require('alpha').setup { dashboard.opts }
