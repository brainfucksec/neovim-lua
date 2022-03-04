-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

--- Keybindings are defined in `core/keymapping.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

--- Note: options under the g: command should be set BEFORE running the
--- setup function: https://github.com/kyazdani42/nvim-tree.lua#setup
--- Default options are not included.
--- See: `help NvimTree`
local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}

g.nvim_tree_icons = {
	default = "‣ "
}

require('nvim-tree').setup {
  open_on_setup = true,
  auto_close = false,
  update_cwd = true,
  actions = {
    open_file = {
      resize_window = false,
      quit_on_open = false,
      window_picker = { enable = false },
    },
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  view = { width = 32 },
}
