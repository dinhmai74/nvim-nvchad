return {
  {
    'sindrets/diffview.nvim',
    after = 'plenary.nvim',
    config = function()
      local actions = require 'diffview.actions'
      require('diffview').setup {
        enhanced_diff_hl = true,
        view = {
          -- Configure the layout and behavior of different types of views.
          -- Available layouts:
          --  'diff1_plain'
          --    |'diff2_horizontal'
          --    |'diff2_vertical'
          --    |'diff3_horizontal'
          --    |'diff3_vertical'
          --    |'diff3_mixed'
          --    |'diff4_mixed'
          -- For more info, see |diffview-config-view.x.layout|.
          default = {
            -- Config for changed files, and staged files in diff views.
            layout = 'diff2_horizontal',
          },
          merge_tool = {
            -- Config for conflicted files in diff views during a merge or rebase.
            layout = 'diff3_mixed',
            disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
          },
          file_history = {
            -- Config for changed files in file history views.
            layout = 'diff2_horizontal',
          },
        },

        keymaps = {
          disable_defaults = false, -- Disable the default keymaps
          view = {
            {
              'n',
              'q',
              ':tabclose<CR>',
              { desc = 'Close diffview' },
            },
            ['gf'] = actions.goto_file_edit,
          },
          file_panel = {
            {
              'n',
              'q',
              ':tabclose<CR>',
              { desc = 'Close diffview' },
            },
            ['<cr>'] = actions.focus_entry,
            ['gf'] = actions.goto_file_edit,
          },
          file_history_panel = {
            {
              'n',
              'q',
              ':tabclose<CR>',
              { desc = 'Close diffview' },
            },
            ['<cr>'] = actions.focus_entry,
            ['gf'] = actions.goto_file_edit,
          },
        },
      }

      vim.cmd [[highlight DiffviewDiffAddAsDelete guibg=#4a2022 gui=none guifg=none]]
      vim.cmd [[highlight DiffviewDiffDelete gui=none guifg=#343d2f guibg=none]]
      vim.cmd [[highlight DiffAddAsDelete gui=none guifg=none guibg=#4a2022]]
      vim.cmd [[highlight DiffDeleteText gui=none guifg=none guibg=#3F2D3D]]

      vim.cmd [[highlight DiffAddText gui=none guifg=none guibg=#1C5458]]
      vim.cmd [[
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#394b70
highlight ConflictMarkerEnd guibg=#3b4252
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
]]
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = {
          text = '│',
        },
        topdelete = {
          text = '',
        },
        changedelete = {
          text = '│',
        },
        untracked = {
          text = '│',
        },
      },
    },

    config = function(_, opts)
      local gitsigns = require 'gitsigns'
      gitsigns.setup(opts)
      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end)
      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end)
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = 'LazyGit',
    keys = {
      {
        '<leader>gZ',
        ':LazyGit<CR>',
      },
    },
    config = function()
      require('telescope').load_extension 'lazygit'
    end,
  },
}
