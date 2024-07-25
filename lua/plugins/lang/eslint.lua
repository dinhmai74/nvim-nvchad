local M = {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        eslint = {
          settings = {
            packageManager = 'bun',
            codeAction = {
              disableRuleComment = {
                enable = true,
                location = 'separateLine',
              },
              showDocumentation = {
                enable = true,
              },
            },
            codeActionOnSave = {
              enable = false,
              mode = 'all',
            },
            format = true,
            nodePath = '',
            onIgnoredFiles = 'off',
            quiet = false,
            rulesCustomizations = {
              {
                rule = '*',
                severity = 'warn',
              },
            },
            run = 'onType',
            useESLintClass = false,
            validate = 'on',
            workingDirectory = {
              mode = 'location',
            },
          },
        },
      },
    },
  },
}

return M
