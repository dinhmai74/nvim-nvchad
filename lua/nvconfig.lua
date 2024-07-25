local M = {}

local highlights = require 'gon.ui.highlights'

local theme = 'everblush'

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_override = highlights.override,
  hl_add = highlights.add,
  theme_toggle = { 'everblush', theme },
  theme = theme, -- default theme
  changed_themes = {
    [theme] = {
      base_16 = {
        base00 = '#151c1f',
      },
      base_30 = {
        darker_black = vim.g.transparency and '#10171a' or '#10171a',
        black = '#151c1f', -- real bg of everblush
        one_bg = '#151c1f', -- real bg of everblush
      },
    },
  },
  transparency = false,

  cmp = {
    icons = true,
    lspkind_text = false,
    -- style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    selected_item_bg = 'colored', -- colored / simple
  },

  telescope = { style = 'borderless' }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = 'default', -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = 'default',
    order = nil,
    modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {},

  nvdash = {},

  cheatsheet = {}, -- simple/grid

  lsp = { signature = true },

  term = {},
}

M.base46 = {
  integrations = {
    'defaults',
    'cmp',
    'devicons',
    'git',
    'lsp',
    'mason',
    'syntax',
    'treesitter',
    'telescope',
    'statusline',
    -- 'bufferline',
  },
}

return M
