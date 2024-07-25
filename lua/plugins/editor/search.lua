return {
  {
    'nvim-pack/nvim-spectre',
    lazy = true,
    opts = {
      live_update = true,
    },
    keys = {
      {
        '<leader>ss',
        "<cmd>lua require('spectre').toggle()<CR>",
      },
      {
        '<leader>sw',
        "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      },
      {
        '<leader>sw',
        '<esc><cmd>lua require("spectre").open_visual()<CR>',
        mode = 'v',
      },
      {
        '<leader>sp',
        '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      },
    },
    config = function(_, opts)
      require('spectre').setup(opts)
    end,
  },
  {
    'cshuaimin/ssr.nvim',
    lazy = true,
    keys = {
      {
        '<leader>sr',
        function()
          require('ssr').open()
        end,
        mode = { 'n', 'x' },
      },
    },
    config = function()
      require('ssr').setup {
        keymaps = {
          close = 'q',
          next_match = 'n',
          prev_match = 'N',
          replace_confirm = '<cr>',
          replace_all = '<leader>R',
        },
      }
    end,
  },
}
