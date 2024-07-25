return {
  'nvim-lualine/lualine.nvim',
  -- Include harpoonEx and harpoon as a dependency
  dependencies = {
    'theprimeagen/harpoon',
    'mike-jl/harpoonEx',
  },
  lazy = false,
  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require 'lualine'
    local base_30 = require('base46').get_theme_tb 'base_30'
    local base_16 = require('base46').get_theme_tb 'base_16'

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = base_30.onebg,
  fg       = base_30.grey_fg2,
  yellow   = base_30.yellow,
  cyan     = base_30.cyan,
  darkblue = base_30.seablue,
  green    = base_30.vibrant_green,
  orange   = base_30.orange,
  violet   = base_30.dark_purple,
  magenta  = '#c678dd',
  blue     = base_30.blue,
  red      = base_30.red,
}

    local tabline = {
      lualine_a = {
        {
          'harpoons',
          -- default config
          show_filename_only = true, -- Shows shortened relative path when set to false.
          hide_filename_extension = true, -- Hide filename extension when set to true.
          show_modified_status = true, -- Shows indicator when the buffer is modified.

          mode = 2, -- 0: Shows harpoon file name
          -- 1: Shows harpoon index
          -- 2: Shows harpoon file name + harpoon index

          max_length = vim.o.columns * 2 / 3, -- Maximum width of harpoons component,
          -- it can also be a function that returns
          -- the value of `max_length` dynamically.
          filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha',
            harpoon = 'Harpoon',
          }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

          -- Automatically updates active buffer color to match color of other components (will be overridden if harpoons_colors is set)
          use_mode_colors = true,
          harpoons_color = {
            -- Same values as the general color option can be used here.
            active = 'St_harpoon_active', -- Color for active buffer.
            inactive = 'St_harpoon_inactive ', -- Color for inactive buffer.
          },

          symbols = {
            modified = ' ●', -- Text to show when the buffer is modified
            alternate_file = '#', -- Text to show to identify the alternate file
            directory = '', -- Text to show when the buffer is a directory
          },
          color = { fg = colors.fg },
        },
      },
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand '%:t') ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand '%:p:h'
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- Config
    local config = {
      options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
          -- We are going to use lualine_c an lualine_x as left and
          -- right section. Both are highlighted by c theme .  So we
          -- are just setting default looks o statusline
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      tabline = tabline,
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x at right section
    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left {
      function()
        return '▊'
      end,
      color = { fg = colors.blue }, -- Sets highlighting of component
      padding = { left = 0, right = 1 }, -- We don't need space before this
    }

    ins_left {
      'filename',
      cond = conditions.buffer_not_empty,
      path = 1,
      color = { fg = colors.fg, gui = 'bold' },
    }

    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = { error = ' ', warn = ' ', info = ' ' },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
      },
    }

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left {
      function()
        return '%='
      end,
    }

    -- Add components to right sections
    ins_right {
      'branch',
      icon = '',
      color = { fg = colors.violet, gui = 'bold' },
    }

    ins_right {
      'diff',
      -- Is it me or the symbol for modified us really weird
      symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    }

    ins_right {
      function()
        return '▊'
      end,
      color = { fg = colors.blue },
      padding = { left = 1 },
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
