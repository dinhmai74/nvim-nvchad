return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'mike-jl/harpoonEx' },
  config = function()
    local harpoon = require 'harpoon'

    local harpoonEx = require 'harpoonEx'
    vim.keymap.set('n', '<leader>hs', function()
      harpoonEx.telescope_live_grep(harpoon:list())
    end, { desc = 'Live grep harpoon files' })
    -- REQUIRED
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    }
    -- REQUIRED

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end)
    vim.keymap.set('n', '<leader>5', function()
      harpoon:list():select(5)
    end)
    vim.keymap.set('n', '<leader>6', function()
      harpoon:list():select(6)
    end)
    vim.keymap.set('n', '<leader>7', function()
      harpoon:list():select(7)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<S-h>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<S-l>', function()
      harpoon:list():next()
    end)
  end,
}
