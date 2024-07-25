local M = {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              lint = {
                cssConflict = 'warning',
                invalidApply = 'error',
                invalidConfigPath = 'error',
                invalidScreen = 'error',
                invalidTailwindDirective = 'error',
                invalidVariant = 'error',
                recommendedVariantOrder = 'warning',
              },
              validate = true,
              experimental = {
                classRegex = {
                  'tw`([^`]*)',
                  'tw\\.[^`]+`([^`]*)`',
                  'tw\\(.*?\\).*?`([^`]*)',
                  'cva\\(([^)]*)\\)',
                  '.*ClassName$',
                },
              },
            },
          },
        },
      },
    },
  },
}

return M
