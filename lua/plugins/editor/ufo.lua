return {
  'kevinhwang91/nvim-ufo',
  lazy = false,
  dependencies = {
    'kevinhwang91/promise-async',
    {
      'luukvbaal/statuscol.nvim',
      lazy = false,
      config = function()
        local builtin = require 'statuscol.builtin'
        require('statuscol').setup {
          -- configuration goes here, for example:
          segments = {
            {
              sign = {
                name = { '.*' },
                maxwidth = 1,
                condition = { true },
              },
              click = 'v:lua.ScSa',
            },
            {
              text = { builtin.lnumfunc, ' ' },
              condition = { true, builtin.not_empty },
              click = 'v:lua.ScLa',
            },
            { sign = { name = { '.*' }, namespace = { 'gitsigns' }, colwidth = 1 }, click = 'v:lua.ScSa' },
            { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
          },
        }
      end,
    },
  },
  config = function()
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    }
  end,
}
