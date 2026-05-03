-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- URL: https://github.com/goolord/alpha-nvim

--[[
Configuration start: https://github.com/goolord/alpha-nvim#quick-start
Configuration examples (alpha-themes): https://github.com/goolord/alpha-nvim/discussions/16
--]]

local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

-- Use `dashboard-nvim` theme, other themes: `vim-startify` and `theta`
-- see: https://github.com/goolord/alpha-nvim?tab=readme-ov-file#quick-start
local dashboard = require('alpha.themes.dashboard')


-- Load banner:
-- Set the different banners to the variables `bx` (b0,b1,..),
-- to add a new banner create a new variable `bx` to the list :)
-- By default there are six different banners (from b0 to b5).
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

-- Load Footer
local function footer()
  -- Print nvim package version
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  -- Print Datetime
  local datetime = os.date('%Y/%m/%d %H:%M')

  -- Example output: v0.10.4 - 2025/03/09 08:47
  return print_version .. ' - ' .. datetime
end

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
