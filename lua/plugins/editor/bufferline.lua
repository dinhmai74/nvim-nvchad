return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    local colors = require('base46').get_theme_tb 'base_30'
    require('bufferline').setup {
      options = {
        show_buffer_icons = false,
      },
    }
  end,
}
