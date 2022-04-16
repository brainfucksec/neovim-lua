----------------------------------------------------------
-- Vista (tagbar) configuration file
-----------------------------------------------------------

-- Plugin: vista.vim
-- url: https://github.com/liuchengxu/vista.vim


local status_ok, vista = pcall(require, 'vista')
if not status_ok then
  return
end

-- How each level is indented and what to prepend.
-- This could make the display more compact or more spacious.
-- e.g., more compact: ["▸ ", ""]
-- Note: this option only works for the kind renderer, not the tree renderer
vim.g.vista_icon_indent = {'╰─▸ ', '├─▸ '}

-- Executive used when opening vista sidebar without specifying it.
-- See all the avaliable executives via `:echo g:vista#executives`.
vim.g.vista_default_executive = 'nvim_lsp'

-- Ensure you have installed some decent font to show these pretty symbols,
-- then you can enable icon for the kind.
vim.g['vista#renderer#enable_icon'] = 1

