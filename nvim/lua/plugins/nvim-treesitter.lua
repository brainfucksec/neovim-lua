-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- URL: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup {
  -- A list of parser names, or "all"
  -- See: `TSInstallInfo` commmand
  ensure_installed = {
    'angular', 'awk', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css', 'csv',
    'go', 'haskell', 'html', 'http', 'java', 'javascript', 'json', 'lua',
    'luadoc', 'make', 'markdown', 'markdown_inline', 'nix', 'perl', 'python',
    'ruby','rust', 'sql', 'toml', 'typescript', 'vim', 'yaml',
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
