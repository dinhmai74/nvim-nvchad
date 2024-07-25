return {
  'mrjones2014/smart-splits.nvim',
  config = true,
  keys = {
    {
      '<A-h>',
      function()
        require('smart-splits').resize_left()
      end,
      desc = gon.wk_name('←', 'Resize lef'),
    },
    {
      '<A-j>',
      function()
        require('smart-splits').resize_down()
      end,
      desc = gon.wk_name('↓', 'Resize down'),
    },
    {
      '<A-k>',
      function()
        require('smart-splits').resize_up()
      end,
      desc = gon.wk_name('↑', 'Resize up'),
    },
    {
      '<A-l>',
      function()
        require('smart-splits').resize_right()
      end,
      desc = gon.wk_name('→', 'Resize right'),
    },
    {
      '<leader>bsh',
      function()
        require('smart-splits').swap_buf_left()
      end,
      desc = gon.wk_name('←', 'Swap buffer left'),
    },
    {
      '<leader>bsj',
      function()
        require('smart-splits').swap_buf_down()
      end,
      desc = gon.wk_name('↓', 'Swap buffer down'),
    },
    {
      '<leader>bsk',
      function()
        require('smart-splits').swap_buf_up()
      end,
      desc = gon.wk_name('↑', 'Swap buffer up'),
    },
    {
      '<leader>bsl',
      function()
        require('smart-splits').swap_buf_right()
      end,
      desc = gon.wk_name('→', 'Swap buffer right'),
    },
  },
}
