local M = {
  'dnlhc/glance.nvim',
  keys = {
    { 'gr', '<CMD>Glance references<CR>', desc = 'Glance references' },
    { 'gd', '<CMD>Glance definitions<CR>', desc = 'Glance definitions' },
    { 'gD', '<CMD>Glance type_definitions<CR>', desc = 'Glance type definitions' },
    { 'gy', '<CMD>Glance implementations<CR>', desc = 'Glance implementations' },
  },
  lazy = false,
}

M.config = function()
  -- Lua configuration
  local glance = require 'glance'
  local actions = glance.actions

  glance.setup {
    height = vim.api.nvim_win_get_height(0) - 10,
    -- list = {
    --   position = "right", -- Position of the list window 'left'|'right'
    --   width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
    -- },
    folds = {
      folded = true, -- Automatically fold list on startup
    },
    border = {
      enable = true, -- Show window borders. Only horizontal borders allowed
    },
    hooks = {
      before_open = function(results, open, jump)
        if #results == 1 then
          pcall(jump, results[1])
        else
          pcall(open, results) -- argument is optional
        end
      end,
    },
    mappings = {
      list = {
        ['l'] = actions.jump,
        ['<c-h>'] = actions.enter_win 'preview', -- Focus preview window
        -- ['<Esc>'] = false -- disable a mapping
      },
      preview = {
        ['Q'] = actions.close,
        ['<leader>l'] = actions.enter_win 'list', -- Focus list window
        ['<c-l>'] = actions.enter_win 'list', -- Focus list window
      },
    },
    theme = { -- This feature might not work properly in nvim-0.7.2
      enable = false, -- Will generate colors for the plugin based on your current colorscheme
      mode = 'darken', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
    },
  }
end

return M
