return {
  'nvim-lua/plenary.nvim',
  -- 'airblade/vim-rooter',
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
    opts = {
      override_by_extension = {
        astro = {
          icon = '',
          color = '#EF8547',
          name = 'astro',
        },
      },
    },
    config = function(_, opts)
      require('nvim-web-devicons').setup(opts)
    end,
  },
  {
    'tzachar/local-highlight.nvim',
    opts = {},
  },
  { 'wakatime/vim-wakatime', event = 'VeryLazy' },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  { 'christoomey/vim-system-copy', lazy = false },
  -- { 'tpope/vim-eunuch', lazy = false, cmd = { 'Delete', 'Chmod', 'SudoWrite', 'Mkdir', 'Wall' } },
  { 'tpope/vim-repeat', lazy = false },
  { 'nicwest/vim-camelsnek', lazy = true, cmd = { 'Snek', 'Pascal', 'Camel', 'Kebab', 'Snakecaps' } },
  -- { 'mg979/vim-visual-multi', branch = 'master', keys = '<C-n>' },
  { 'mbbill/undotree', keys = { { '<leader>u', [[<CMD>UndotreeToggle<CR>]], desc = gon.wk_name('', 'Undo tree') } } },
  {
    'echasnovski/mini.surround',
    version = '*',
    lazy = false,
    config = function()
      require('mini.surround').setup()
    end,
  },
  {
    'echasnovski/mini.misc',
    version = false,
    lazy = false,
    config = function()
      local minimisc = require 'mini.misc'
      minimisc.setup()
      minimisc.setup_restore_cursor()
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    lazy = true,
    version = '*',
    keys = { 'gS' },
    config = function()
      require('mini.splitjoin').setup()
    end,
  },
  { 'tiagovla/scope.nvim', config = true, lazy = false },

  -- editor
  --
  { 'MunifTanjim/nui.nvim' },
  { import = 'plugins.editor.treesitter' },
  { import = 'plugins.editor.glance', enabled = gon.glance },
  { import = 'plugins.editor.trouble' },
  { import = 'plugins.editor.ufo' },
  -- { import = 'plugins.editor.bufferline' },
  { import = 'plugins.editor.bqf' },

  { 'NvChad/nvim-colorizer.lua', config = true },
  { import = 'plugins.editor.search' },
  { import = 'plugins.editor.wilder' },
  { import = 'plugins.editor.flash' },

  { import = 'plugins.editor.git' },
  { import = 'plugins.editor.oil' },
  -- { import = 'plugins.editor.lualine' },

  -- { import = 'plugins.editor.starter' },
  -- { import = 'plugins.editor.rainbow' },

  { import = 'plugins.editor.yanky' },
  { import = 'plugins.editor.smartsplits' },

  -- coding
  { import = 'plugins.coding.cmp' },
  { import = 'plugins.coding.conform' },
  { import = 'plugins.coding.comment' },
  { import = 'plugins.coding.copilot' },
  { import = 'plugins.coding.linting' },
  -- { import = 'plugins.coding.grapple' },
  { import = 'plugins.coding.harpoon' },

  --lang
  --
  { import = 'plugins.lang.typescript' },
  { import = 'plugins.lang.eslint' },
  { import = 'plugins.lang.tailwindcss' },
  { import = 'plugins.lang.jsonls' },
  { import = 'plugins.lang.ruby' },
}
