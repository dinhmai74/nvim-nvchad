if gon.tsserver then
  return {
    'neovim/nvim-lspconfig',
    opts = {
      -- make sure mason installs the server
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          keys = {
            {
              '<leader>co',
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { 'source.organizeImports.ts' },
                    diagnostics = {},
                  },
                }
              end,
              desc = 'Organize Imports',
            },
            {
              '<leader>cR',
              function()
                vim.lsp.buf.code_action {
                  apply = true,
                  context = {
                    only = { 'source.removeUnused.ts' },
                    diagnostics = {},
                  },
                }
              end,
              desc = 'Remove Unused Imports',
            },
          },
          ---@diagnostic disable-next-line: missing-fields
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
    },
  }
end

if gon.tstool then
  return {
    'neovim/nvim-lspconfig',
    dependencies = {
      'pmizio/typescript-tools.nvim',
      ft = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
      },
      enabled = gon.tstool and not gon.coc,
      opts = {
        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = 'insert_leave',
          tsserver_plugins = { '@styled/typescript-styled-plugin' },
          jsx_close_tag = {
            enable = false,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
          tsserver_file_preferences = {
            -- includeInlayParameterNameHints = "all",
            -- includeInlayEnumMemberValueHints = false,
            -- includeInlayFunctionLikeReturnTypeHints = false,
            -- includeInlayFunctionParameterTypeHints = true,
            -- includeInlayPropertyDeclarationTypeHints = false,
            -- includeInlayVariableTypeHints = false,
            -- includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            -- includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          },
        },
      },
      config = function(_, opts)
        gon.user_command('OR', 'TSToolsOrganizeImports')
        gon.user_command('TypescriptAddMissingImports', 'TSToolsAddMissingImports')
        gon.user_command('TypescriptRemoveUnused', 'TSToolsRemoveUnusedImports')

        require('typescript-tools').setup(opts)
      end,
    },
  }
end

return {}
