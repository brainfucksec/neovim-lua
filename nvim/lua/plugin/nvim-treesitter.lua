-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- URL: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter')
if not status_ok then
  return
end

nvim_treesitter.setup({
-- Diffs against already-installed parsers so it doesn't reinstall everything
-- on every startup:
  init = function()
    -- See: `TSInstallInfo` commmand
    local ensureInstalled = {
      'angular', 'awk', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css', 'csv',
      'go', 'haskell', 'html', 'http', 'java', 'javascript', 'json', 'lua',
      'luadoc', 'make', 'markdown', 'markdown_inline', 'nix', 'perl', 'python',
      'ruby','rust', 'sql', 'toml', 'typescript', 'vim', 'yaml'
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,
})

