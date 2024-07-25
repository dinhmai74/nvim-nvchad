local M = {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'javascript',
        'typescript',
        'tsx',
        'tsx',
        'vim',
        'fish',
        'lua',
        'vimdoc',
        'query',
        'bash',
        'regex',
        'markdown',
        'markdown_inline',
        'luadoc',
        'printf',
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  'nvim-treesitter/nvim-treesitter-refactor',
  'JoosepAlviste/nvim-ts-context-commentstring',

  -- Show context of the current function
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = { mode = 'cursor', max_lines = 3 },
  },
}

return M
