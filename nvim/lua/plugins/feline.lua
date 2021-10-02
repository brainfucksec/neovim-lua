-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

--[[

Plugin: feline.nvim
https://github.com/famiu/feline.nvim

Thanks to ibhagwan for the example to follow
see: https://github.com/ibhagwan/nvim-lua

--]]

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
  COMMAND = colors.green,
  SHELL = colors.cyan,
  TERM = colors.cyan,
  NONE = colors.blue
}

local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local lsp_get_diag = function(str)
  local count = vim.lsp,diagnostic.get_count(0, str)
  return (count > 0) and ' '..count..' ' or ''
end

-- my components
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
  -- File info
  file = {
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'unique',
          file_modified_icon = ''
        }
      },
      hl = {
        fg = colors.cyan,
        --style = 'bold'
      },
      icon = '',
    },
  type = {
      provider = { name = 'file_type' },
    },
    os = {
      provider = function()
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
      end,
      hl = {
        fg = colors.fg,
        style = 'bold'
      },
      left_sep = ' ',
    },
    position = {
      provider = {name = 'position'},
      hl = {
        fg = colors.cyan,
        style = 'bold'
      },
      left_sep = '  ',
    },
    line_percentage = {
      provider = { name = 'line_percentage' },
      hl = {
        fg = colors.fg,
        style = 'bold'
      },
      left_sep = ' ',
    },
    scroll_bar = {
      provider = { name = 'scroll_bar' },
      hl = {
        fg = colors.green
      },
      left_sep = ' ',
      right_sep = ' '
    },
  },
  -- LSP info
  diagnos = {
    err = {
      provider = 'diagnostic_errors',
      icon = '⚠ ',
      hl = { fg = colors.red },
      left_sep = ' ',
    },
    warn = {
      provider = 'diagnostic_warnings',
      icon = ' ',
      hl = { fg = colors.yellow },
      left_sep = ' ',
    },
    info = {
      provider = 'diagnostic_info',
      icon = ' ',
      hl = { fg = colors.green },
      left_sep = ' ',
    },
    hint = {
      provider = 'diagnostic_hints',
      icon = ' ',
      hl = { fg = colors.cyan },
      left_sep = ' ',
    },
  },
  lsp = {
    name = {
      provider = 'lsp_client_names',
      icon = ' ',
      hl = { fg = colors.fg },
      left_sep = '  ',
      right_sep = ' ',
    }
  },
  -- git info
  git = {
    branch = {
      provider = 'git_branch',
      icon = ' ',
      hl = {
        fg = colors.pink,
        style = 'bold'
      },
      left_sep = ' ',
    },
    add = {
      provider = 'git_diff_added',
      hl = { fg = colors.green },
    },
    change = {
      provider = 'git_diff_changed',
      hl = { fg = colors.orange },
    },
    remove = {
      provider = 'git_diff_removed',
      hl = { fg = colors.red },
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
table.insert(components.active[2], comps.file.line_percentage)
table.insert(components.active[2], comps.file.scroll_bar)

require('feline').setup {
  colors = { bg = colors.bg, fg = colors.fg  },
  components = components,
  vi_mode_colors = vi_mode_colors
}
