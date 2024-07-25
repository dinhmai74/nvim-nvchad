local M = {
  'stevearc/oil.nvim',
  lazy = true,
  keys = {
    {
      '-',
      function()
        require('oil').open()
      end,
      desc = gon.wk_name('', 'Open oil directory'),
    },
    -- {
    --   "<C-e>",
    --   function()
    --     require("oil").toggle_float()
    --   end,
    --   desc = gon.wk_name("", "Open oil float"),
    -- },
  },
  opts = {
    win_options = {
      signcolumn = 'number',
    },
    skip_confirm_for_simple_edits = true,
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      ['<C-s>'] = 'actions.select_vsplit',
      ['<C-h>'] = 'actions.select_split',
      ['<C-p>'] = 'actions.preview',
      ['<C-c>'] = 'actions.close',
      ['<C-l>'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = 'actions.tcd',
      ['g.'] = 'actions.toggle_hidden',
      ['q'] = 'actions.close',
      ['<ESC>'] = 'actions.close',
    },
    -- delete_to_trash = true,
    -- Set to false to disable all of the above keymaps
    use_default_keymaps = true,
    default_file_explorer = false,
    view_options = {
      show_hidden = true,
    },
    float = { padding = 4, max_width = 100, max_height = 80 },
  },
}

return M
