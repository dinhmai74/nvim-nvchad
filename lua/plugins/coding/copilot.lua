return {
  {
    'github/copilot.vim',
    lazy = true,
    cmd = { 'Copilot' },
    config = function()
      -- vim.g.copilot_no_tab_map = true
      --
      -- vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
      --   expr = true,
      --   replace_keycodes = false,
      -- })
    end,
  },
}
