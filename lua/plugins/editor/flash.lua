return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = true,
          -- by default all keymaps are enabled, but you can disable some of them,
          -- by removing them from the list.
          keys = { 't', 'T' },
          search = { wrap = false },
          highlight = { backdrop = true },
          jump = { register = false },
        },
      },
    },
    config = function(_, opts)
      require('flash').setup(opts)
      -- to use this, make sure to set `opts.modes.char.enabled = false`
      local Config = require 'flash.config'
      local Char = require 'flash.plugins.char'
      for _, motion in ipairs { 't', 'T' } do
        vim.keymap.set({ 'n', 'x', 'o' }, motion, function()
          require('flash').jump(Config.get({
            mode = 'char',
            search = {
              mode = Char.mode(motion),
              max_length = 1,
            },
          }, Char.motions[motion]))
        end)
      end
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    optional = true,
    opts = function(_, opts)
      local function flash(prompt_bufnr)
        require('flash').jump {
          pattern = '^',
          highlight = { label = { after = { 0, 0 } } },
          search = {
            mode = 'search',
            exclude = {
              function(win)
                return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'TelescopeResults'
              end,
            },
          },
          action = function(match)
            local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
            picker:set_selection(match.pos[1] - 1)
          end,
        }
      end
      opts.defaults = vim.tbl_deep_extend('force', opts.defaults or {}, {
        mappings = {
          n = { s = flash },
          i = { ['<c-s>'] = flash },
        },
      })
    end,
  },
}
