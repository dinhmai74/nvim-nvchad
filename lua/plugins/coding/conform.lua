return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '\\f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
    formatters_by_ft = {
      lua = { 'stylua' },

      javascript = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      astro = { { 'prettierd', 'prettier' } },
    },
  },
}
