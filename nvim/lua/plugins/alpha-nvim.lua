-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- Configuration start: https://github.com/goolord/alpha-nvim#quick-start
-- For configuration examples (alpha-themes), see: https://github.com/goolord/alpha-nvim/discussions/16

local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

-- Use `dashboard-nvim` theme, other themes: `vim-startify` and `theta`
-- see: https://github.com/goolord/alpha-nvim?tab=readme-ov-file#quick-start
local dashboard = require('alpha.themes.dashboard')


-- Load banner:
-- Set the different banners to the variables `bx` (b0, b1, ..)
-- to add a new banner create a new variable `bx` to the list :)
-- by default there are six different banners (from b0 to b5).
local b0 = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

local b1 = {
  "                                                   ",
  " ███    ██ ███████  ██████  ██    ██ ██ ███    ███ ",
  " ████   ██ ██      ██    ██ ██    ██ ██ ████  ████ ",
  " ██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██ ",
  " ██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██ ",
  " ██   ████ ███████  ██████    ████   ██ ██      ██ ",
  "                                                   "
}

local b2 = {
  "                                                              ",
  " ░   ░░░  ░░        ░░░      ░░░  ░░░░  ░░        ░░  ░░░░  ░ ",
  " ▒    ▒▒  ▒▒  ▒▒▒▒▒▒▒▒  ▒▒▒▒  ▒▒  ▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒   ▒▒   ▒ ",
  " ▓  ▓  ▓  ▓▓      ▓▓▓▓  ▓▓▓▓  ▓▓▓  ▓▓  ▓▓▓▓▓▓  ▓▓▓▓▓        ▓ ",
  " █  ██    ██  ████████  ████  ████    ███████  █████  █  █  █ ",
  " █  ███   ██        ███      ██████  █████        ██  ████  █ ",
  "                                                              "
}

local b3 = {
  "                                                     ",
  "  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓  ",
  "  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒  ",
  " ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ",
  " ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ",
  " ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ",
  " ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
  " ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ",
  "    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ",
  "          ░    ░  ░    ░ ░        ░   ░         ░    ",
  "                                 ░                   ",
  "                                                     "
}

local b4 = {
  "                                                      ",
  " ##    ## ########  #######  ##     ## #### ##     ## ",
  " ###   ## ##       ##     ## ##     ##  ##  ###   ### ",
  " ####  ## ##       ##     ## ##     ##  ##  #### #### ",
  " ## ## ## ######   ##     ## ##     ##  ##  ## ### ## ",
  " ##  #### ##       ##     ##  ##   ##   ##  ##     ## ",
  " ##   ### ##       ##     ##   ## ##    ##  ##     ## ",
  " ##    ## ########  #######     ###    #### ##     ## ",
  "                                                      "
}

local b5 = {
  "                                                             ",
  " '##::: ##:'########::'#######::'##::::'##:'####:'##::::'##: ",
  "  ###:: ##: ##.....::'##.... ##: ##:::: ##:. ##:: ###::'###: ",
  "  ####: ##: ##::::::: ##:::: ##: ##:::: ##:: ##:: ####'####: ",
  "  ## ## ##: ######::: ##:::: ##: ##:::: ##:: ##:: ## ### ##: ",
  "  ##. ####: ##...:::: ##:::: ##:. ##:: ##::: ##:: ##. #: ##: ",
  "  ##:. ###: ##::::::: ##:::: ##::. ## ##:::: ##:: ##:.:: ##: ",
  "  ##::. ##: ########:. #######::::. ###::::'####: ##:::: ##: ",
  " ..::::..::........:::.......::::::...:::::....::..:::::..:: ",
  "                                                             "
}

-- Assigns the value of the preferred `bx` banner to `section.header.val`
dashboard.section.header.val = b1

-- Menu (Shortcuts)
dashboard.section.buttons.val = {
  dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', '  Find file', ':NvimTreeOpen<CR>'),
  dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  Update plugins', ':Lazy update<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M')

  return print_version .. ' - ' .. datetime
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
