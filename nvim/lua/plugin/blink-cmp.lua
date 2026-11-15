-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: blink.cmp
-- URL: https://github.com/Saghen/blink.cmp

-- Documentation:
-- https://cmp.saghen.dev/configuration/general.html
-- :help blink, help blink-cmp-config

local cmp_status_ok, blink_cmp = pcall(require, 'blink-cmp')
if not cmp_status_ok then
  return
end

blink_cmp.setup({
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    -- 'full' fuzzy match on the text before _and_ after the cursor
    keyword = { range = "full" },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
      },
    },
    -- Show documentation when selecting a completion item
    documentation = { auto_show = true },
  },
  -- Fuzzy, always use a Lua implementation
  fuzzy = { implementation = "lua" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  -- Use a preset for snippets, check the snippets documentation for more information
  snippets = { preset = "luasnip" },
  -- Experimental signature help support
  signature = { enabled = true },
  keymap = {
    preset = "super-tab",
    -- ONLY accept/fill the selection when pressing Enter
    ['<CR>'] = { 'accept', 'fallback' },
    -- Use Tab and Shift-Tab to move up and down the menu safely
    ["<Tab>"] = { "select_next", "fallback" },
    ['<S-Tab>'] = { 'select_prev', 'fallback' }
  },
})

