-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

local g = vim.g

-- Plugin: nvim-tree
--- https://github.com/kyazdani42/nvim-tree.lua
g.nvim_tree_width = 27
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_width_allow_resize  = 1
g.nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
	default = "‣ "
}

-- Keybindings are defined in `keymapping.lua`
--- See: `help NvimTree`
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

