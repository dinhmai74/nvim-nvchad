local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'kkharji/sqlite.lua' },
    { 'fannheyward/telescope-coc.nvim', enabled = gon.coc },
    { 'smartpde/telescope-recent-files', lazy = false },
    { 'johmsalas/text-case.nvim', config = true, lazy = false },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      lazy = false,
    },
    { 'junegunn/fzf.vim', lazy = false, enabled = not gon.mini_fuzzy },
    {
      'junegunn/fzf',
      dir = '~/.fzf',
      build = './install --all',
      lazy = false,
      enabled = not gon.mini_fuzzy,
    },
    {
      'AckslD/nvim-neoclip.lua',
      lazy = false,
      config = function()
        require('neoclip').setup()
      end,
    },
  },
  config = function(_, opts)
    local _, actions = pcall(require, 'telescope.actions')
    local action_layout = require 'telescope.actions.layout'

    require('telescope').setup {
      defaults = {
        prompt_prefix = '   ',
        selection_caret = '  ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        file_ignore_patterns = {
          '.git/',
          '.cache',
          'node_modules',
          '%.o',
          '%.out',
          '%.class',
          '%.pdf',
          '%.mkv',
          '%.mp4',
          '%.zip',
        },

        vimgrep_arguments = {
          'rg',
          '-L',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },

        mappings = {
          i = {
            ['jk'] = { '<esc>', type = 'command' },
            ['<esc>'] = actions.close,
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,
            ['<C-c>'] = actions.close,
            ['<C-j>'] = actions.cycle_history_next,
            ['<C-k>'] = actions.cycle_history_prev,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<CR>'] = actions.select_default,
            ['<C-y>'] = actions.select_default,
            ['<C-x>'] = actions.select_horizontal,
            ['<C-v>'] = actions.select_vertical,
            ['<C-t>'] = actions.select_tab,
            ['<M-p>'] = action_layout.toggle_preview,
          },
          n = {
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<CR>'] = actions.select_default,
            ['q'] = actions.close,
            ['<esc>'] = actions.close,
            ['j'] = actions.move_selection_next, -- next entry
            ['k'] = actions.move_selection_previous, -- previous entry
            ['<M-p>'] = action_layout.toggle_preview,
          },
        },
        path_display = { 'filename_first' },
        -- path_display = function(opts, path)
        --   local tail = require('telescope.utils').path_tail(path)
        --   return string.format('%s (%s)', tail, path), { { { 1, #tail }, 'Constant' } }
        -- end,
        -- path_display = {
        --   shorten = 5,
        --   truncate = 3,
        -- },
        winblend = 0,
        color_devicons = true,
        -- Developer configurations: Not meant for general override
        -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        preview = {
          hide_on_startup = false,
        },
      },
      pickers = {
        find_files = {
          layout_strategy = 'center',
          layout_config = {
            preview_cutoff = 1,
            center = {
              preview_cutoff = 1,
              anchor = 'S',
              width = 0.87,
              height = function(_, _, max_lines)
                return math.min(max_lines, 20)
              end,
            },

            width = 0.87,
            height = 0.9,
          },

          find_command = {
            vim.loop.os_uname().sysname == 'Linux' and 'fdfind' or 'fd',
            '--type',
            'f',
            '--strip-cwd-prefix',
          },
          path_display = {
            'filename_first',
          },
        },
        live_grep = {
          -- @usage don't include the filename in the search results
          only_sort_text = true,
        },

        preview = {
          hide_on_startup = true,
        },
      },
      extensions_list = {
        'neoclip',
        'themes',
        'recent_files',
        -- "frecency",
        -- "ui-select",
        -- "tailiscope",
        -- "projects",
        'textcase',
        'notify',
        'lazy',
      },
      find_files = {
        theme = 'dropdown',
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },

        -- ["ui-select"] = {
        --   require("telescope.themes").get_dropdown {},
        -- },
        coc = {
          prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },

        -- tailiscope = {
        --   register = '"',
        --   default = "base",
        --   doc_icon = " ",
        --   no_dot = true,
        --   initial_mode = "insert",
        --   maps = {
        --     i = {
        --       back = "<C-h>",
        --       open_doc = "<CR>",
        --     },
        --     n = {
        --       back = "b",
        --       open_doc = "od",
        --     },
        --   },
        -- },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>f?', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>fw', function()
      local word = vim.fn.expand '<cword>'
      builtin.grep_string { search = word }
    end)
    vim.keymap.set('n', '<leader>fW', function()
      local word = vim.fn.expand '<cWORD>'
      builtin.grep_string { search = word }
    end)
    vim.keymap.set('n', '<leader>fs', function()
      builtin.grep_string { search = vim.fn.input 'Grep > ' }
    end)
    vim.keymap.set('n', '<leader>fz', ':FZF<CR>', { desc = 'Fzf' })
    vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fg', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>ff', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files hidden=true<CR>', { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers<CR>')
    vim.keymap.set('n', '<leader>fc', function()
      require('telescope.builtin').find_files { cwd = require('telescope.utils').buffer_dir() }
    end)
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    gon.user_command('FindLog', function()
      require('telescope.builtin').live_grep { default_text = 'console\\.log\\(', initial_mode = 'normal' }
    end)
  end,
}

return M
