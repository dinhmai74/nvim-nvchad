local M = {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        solargraph = {},
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'ruby',
      })
    end,
  },
}

return M
