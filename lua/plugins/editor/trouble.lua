return {
  'folke/trouble.nvim',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '[t',
      function()
        require('trouble').next { skip_groups = true, jump = true }
      end,
    },
    {
      ']t',
      function()
        require('trouble').prev { skip_groups = true, jump = true }
      end,
    },
    {
      'gR',
      '<cmd>Trouble lsp_references<cr>',
    },
  },
  opts = {},
}
