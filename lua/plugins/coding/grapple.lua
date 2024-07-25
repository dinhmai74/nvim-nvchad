local M = {
  'cbochs/grapple.nvim',
  lazy = false,
}

M.opts = {
  scope = 'git_branch',
}

M.config = function(_, opts)
  local grapple = require 'grapple'
  grapple.setup(opts)
  vim.keymap.set('n', '<leader>a', require('grapple').toggle)
  vim.keymap.set('n', '<leader>ha', '<cmd>Grapple tag scope=cwd<CR>')
  vim.keymap.set('n', '<C-e>', '<cmd>Grapple open_tags<CR>', { silent = true })
  vim.keymap.set('n', '<Leader>e', '<cmd>Grapple open_tags scope=cwd<CR>', { silent = true })
  vim.keymap.set('n', '<S-l>', '<cmd>Grapple cycle forward scope=git_branch<CR>', { silent = true })
  vim.keymap.set('n', '<S-h>', '<cmd>Grapple cycle backward scope=git_branch<CR>', { silent = true })
  vim.keymap.set('n', '<leader>hh', '<cmd>Grapple tag scope=git_branch<CR>', { silent = true })
  vim.keymap.set('n', '<leader>1', '<cmd>Grapple select index=1<CR>', { silent = true })
  vim.keymap.set('n', '<leader>2', '<cmd>Grapple select index=2<CR>', { silent = true })
  vim.keymap.set('n', '<leader>3', '<cmd>Grapple select index=3<CR>', { silent = true })
  vim.keymap.set('n', '<leader>4', '<cmd>Grapple select index=4<CR>', { silent = true })
  vim.keymap.set('n', '<leader>5', '<cmd>Grapple select index=5<CR>', { silent = true })
  vim.keymap.set('n', '<leader>6', '<cmd>Grapple select index=6<CR>', { silent = true })
end

return M
