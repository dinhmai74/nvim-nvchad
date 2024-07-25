local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', ft = 'lua', opts = {} },
    { 'folke/neoconf.nvim', ft = 'lua', cmd = 'Neoconf' },
  },
  opts = {
    servers = {},
  },

  setup = {
    -- example to setup with typescript.nvim
    -- tsserver = function(_, opts)
    --   require("typescript").setup({ server = opts })
    --   return true
    -- end,
    -- Specify * to use this function as a fallback for any server
    -- ["*"] = function(server, opts) end,
  },
}

M.config = function(_, opts)
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      local map = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
      end

      if not gon.glance then
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gy', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      end
      map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      map('K', vim.lsp.buf.hover, 'Hover Documentation')
      map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      map('go', vim.diagnostic.open_float, 'Open diagnostic [o]verview')
      map('<leader>ac', vim.lsp.buf.code_action, '[C]ode [A]ction')
      map('<leader>ai', ':TypescriptAddMissingImports<CR>', '   Auto import all')
      map('<leader>ar', ':TypescriptRemoveUnused<CR>', '   Remove unused')
      map('<leader>aI', ':TSLspImportCurrent<CR>', 'Import current')
      map('<leader>ah', vim.lsp.buf.signature_help, 'signature_help')
      map('<leader>ae', '<cmd>EslintFixAll<CR>', 'eslint fix all')
      map('[e', function()
        vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
      end, 'Next [e]rror')

      map(']e', function()
        vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
      end, 'prev [e]rror')

      map('[w', function()
        vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
      end, 'Next [w]arning')

      map(']w', function()
        vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
      end, 'prev [w]arning')
    end,
  })

  local servers = vim.tbl_deep_extend('force', opts.servers, {
    astro = {},
    lua_ls = {
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = 'Replace',
          },
        },
      },
    },
  })
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

  require('mason').setup()

  local ensure_installed = vim.tbl_deep_extend('force', vim.tbl_keys(servers or {}), {
    'prettierd',
  })
  vim.list_extend(ensure_installed, {
    'stylua', -- Used to format Lua code
  })

  -- custom nvchad cmd to install all mason binaries listed
  vim.api.nvim_create_user_command('MasonInstallAll', function()
    vim.cmd('MasonInstall ' .. table.concat(ensure_installed, ' '))
  end, {})

  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  require('mason-lspconfig').setup {
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        require('lspconfig')[server_name].setup(server)
      end,
    },
  }

  local icons = require('gon.ui.icons').diagnostics

  local diagnostics_signs = {
    [vim.diagnostic.severity.ERROR] = {
      sign = icons.Error .. ' ',
      hl_group = 'DiagnosticSignError',
    },
    [vim.diagnostic.severity.WARN] = {
      sign = icons.Warn .. ' ',
      hl_group = 'DiagnosticSignWarn',
    },
    [vim.diagnostic.severity.HINT] = {
      sign = icons.Hint .. ' ',
      hl_group = 'DiagnosticSignHint',
    },
    [vim.diagnostic.severity.INFO] = {
      sign = icons.Info .. ' ',
      hl_group = 'DiagnosticSignInfo',
    },
  }

  for type, diag in pairs(diagnostics_signs) do
    local hl = diag.hl_group
    vim.fn.sign_define(hl, { text = diag.sign, texthl = hl, numhl = hl })
  end

  local diagnostics_float_config = {
    border = 'single',
    -- close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    focusable = true,
    -- header = "",
    prefix = function(diagnostic)
      local severity = diagnostics_signs[diagnostic.severity]
      return severity.sign, severity.hl_group
    end,
    scope = 'line',
    source = 'if_many',
  }

  vim.diagnostic.config {
    virtual_text = {
      severity = { min = vim.diagnostic.severity.ERROR },
      prefix = '●',
      source = 'if_many',
    },
    -- virtual_text = false,
    virtual_lines = false,
    float = diagnostics_float_config,
    underline = false,
    -- underline = {
    --   -- Do not underline text when severity is low (INFO or HINT).
    --   severity = { min = vim.diagnostic.severity.ERROR },
    -- },
  }
end

return M
