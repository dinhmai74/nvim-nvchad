return {
  'gelguy/wilder.nvim',
  lazy = false,
  build = ':UpdateRemotePlugins',
  enabled = not gon.noice,
  keys = { ':' },
  opts = { modes = { ':' } },
  config = function(_, opts)
    local colors = require('base46').get_theme_tb 'base_30'
    local wilder = require 'wilder'
    wilder.set_option('pipeline', {
      wilder.branch(
        wilder.python_file_finder_pipeline {
          file_command = { 'fd', '-tf' },
          dir_command = { 'fd', '-td' },
          filters = { 'fuzzy_filter', 'difflib_sorter' },
        },
        wilder.cmdline_pipeline(),
        wilder.python_search_pipeline()
      ),
    })
    wilder.set_option(
      'renderer',
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
        highlights = {
          border = 'CocFloatingBorder', -- highlight to use for the border
          accent = wilder.make_hl('WilderAccent', 'Pmenu', {
            {
              a = 1,
            },
            {
              a = 1,
            },
            {
              foreground = colors.blue,
            },
          }),
        },
        highlighter = wilder.basic_highlighter(),
        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = 'single',
        pumblend = 3,
      })
    )

    if gon.coc then
      vim.list_extend(opts.modes, {
        '/',
        ':',
      })
    end

    wilder.setup(opts)
  end,
}
