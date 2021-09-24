-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

--[[
  Plugin: feline.nvim
  https://github.com/famiu/feline.nvim

  Thanks to ibhagwan for the example to follow
  see: https://github.com/ibhagwan/nvim-lua
--]]

--require('feline').setup()

local colors = {
  bg = '#1d1f22',
  fg = '#f8f8f0',
  yellow = '#e6db74',
  cyan = '#78dce8',
  blue = '#27406b',
  green = '#a6e22e',
  orange = '#fa8419',
  violet = '#9c64fe',
  pink = '#f92672',
  red = '#e95678',
}

local vi_mode_colors = {
  NORMAL = colors.cyan,
  INSERT = colors.green,
  VISUAL = colors.yellow,
  OP = colors.cyan,
  BLOCK = colors.cyan,
  REPLACE = colors.red,
  ['V-REPLACE'] = colors.red,
  ENTER = colors.orange,
  MORE = colors.orange,
  SELECT = colors.pink,
  COMMAND = colors.cyan,
  SHELL = colors.cyan,
  TERM = colors.cyan,
  NONE = colors.blue
}

local function file_osinfo()
  local os = vim.bo.fileformat:upper()
  local icon
  if os == 'UNIX' then
    icon = ' '
  elseif os == 'MAC' then
    icon = ' '
  else
    icon = ' '
  end
  return icon .. os
end

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local lsp_get_diag = function(str)
  local count = vim.lsp,diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- set components
local comps = {
  vi_mode = {
    left = {
      provider = function()
        return vi_mode_utils.get_vim_mode()
      end,
      hl = function()
        local val = {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color(),
          style = 'bold'
        }
        return val
      end,
      left_sep = ' ',
      right_sep = ' ',
    }
  },
  file = {
    info = {
      provider = 'file_info',
      left_sep = ' ',
      file_modified_icon = '',
      hl = {
        fg = colors.cyan,
        style = 'bold'
      }
    },
    type = {
      provider = 'file_type'
    },
    os = {
      provider = file_osinfo,
      left_sep = ' ',
      hl = {
        fg = colors.fg,
        style = 'bold'
      }
    },
    position = {
      provider = 'position',
      left_sep = ' ',
      right_sep = ' ',
      hl = {
        fg = colors.cyan,
        style = 'bold'
      }
    },
  },
  left_end = {
    provider = function() return '⏵' end,
    hl = {
      fg = colors.bg,
      bg = colors.red,
    }
  },
  diagnos = {
    err = {
      provider = 'diagnostic_errors',
      left_sep = ' ',
      icon = '⚠ ',
      hl = {
        fg = colors.red
      }
    },
    warn = {
      provider = 'diagnostic_warnings',
      left_sep = ' ',
      icon = ' ',
      hl = {
        fg = colors.yellow
      }
    },
    info = {
      provider = 'diagnostic_info',
      left_sep = ' ',
      hl = {
        fg = colors.green
      }
    },
    hint = {
      provider = 'diagnostic_hints',
      left_sep = ' ',
      hl = {
        fg = colors.cyan
      }
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      left_sep = ' ',
      right_sep = ' ',
      icon = ' ',
      hl = {
        fg = colors.yellow
      }
    }
  },
  git = {
    branch = {
      provider = 'git_branch',
      icon = ' ',
      left_sep = ' ',
      hl = {
        fg = colors.pink,
        style = 'bold'
      }
    },
    add = {
      provider = 'git_diff_added',
      hl = {
        fg = colors.green
      }
    },
    change = {
      provider = 'git_diff_changed',
      hl = {
        fg = colors.orange
      }
    },
    remove = {
      provider = 'git_diff_removed',
      hl = {
        fg = colors.red
      }
    }
  }
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.position)

require('feline').setup {
  colors = { bg = colors.bg, fg = colors.fg  },
  components = components,
  vi_mode_colors = vi_mode_colors
}
