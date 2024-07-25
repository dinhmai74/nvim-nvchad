local M = {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'lukas-reineke/cmp-under-comparator',
    { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true, enabled = true },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    -- "FelipeLema/cmp-async-path",
    'quangnguyen30192/cmp-nvim-ultisnips',
    { 'KadoBOT/cmp-plugins', opts = {} },
    -- { 'abecodes/tabout.nvim', keys = 'tab', opts = {} },
    {
      'SirVer/ultisnips',
      name = 'ulti',
      event = 'BufReadPre',
      lazy = false,
      module = true,
    },
  },
}

M.config = function()
  local present, cmp = pcall(require, 'cmp')
  if not present then
    return
  end
  local cmp_window = require 'cmp.utils.window'
  local border = require('gon.utils.border').border

  vim.opt.completeopt = 'menu,menuone'
  cmp_window.info_ = cmp_window.info
  cmp_window.info = function(self)
    local info = self:info_()
    info.scrollable = falsecmp
    return info
  end

  local icons = require('gon.ui.icons').symbol_kinds
  local compare = require 'cmp.config.compare'
  local displaySources = {
    ['nvim_lsp'] = '',
    ['luasnip'] = icons.Snippet .. ' ',
    ['ulti'] = icons.Snippet .. ' ',
    ['ultisnips'] = icons.Snippet .. ' ',
    ['buffer'] = icons.Buffer .. ' ',
    ['path'] = icons.File .. ' ',
    ['nvim_lsp_signature_help'] = icons.String .. ' ',
  }

  -- ultisnips helper
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local cmp_ultisnips_mappings = require 'cmp_nvim_ultisnips.mappings'

  local options = {
    sorting = {
      priority_weight = 1,
      comparators = { -- compare.locality,
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        require('cmp-under-comparator').under,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    },
    completion = {
      completeopt = 'menu,menuone',
    },
    window = {
      completion = {
        border = border 'FloatBorder',
        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:PmenuSel',
        scrollbar = false,
      },
      documentation = {
        border = border 'FloatBorder',
        winhighlight = 'Normal:NormalFloat',
      },
    },

    snippet = {
      expand = function(args)
        -- require("luasnip").lsp_expand(args.body)
        vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
      end,
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      with_text = true,
      maxwidth = 50,
      format = function(entry, vim_item)
        icons.cmp_copilot = '🚁'
        vim_item.kind = string.format('%s', icons[vim_item.kind])
        vim_item.menu = displaySources[entry.source.name]
        return require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },

      ['<Esc>'] = cmp.mapping {
        c = function()
          if cmp.visible() then
            cmp.close()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', true)
          end
        end,
      },

      -- ['<CR>'] = cmp.mapping.confirm { select = false },
      ['<C-y>'] = cmp.mapping.confirm { select = false },
      ['<C-j>'] = cmp.mapping {
        i = function(fallback)
          if vim.fn['UltiSnips#CanJumpForwards']() == 1 then
            vim.api.nvim_feedkeys(t '<Plug>(ultisnips_jump_forward)', 'm', true)
          else
            fallback()
          end
        end,
        s = function(fallback)
          if vim.fn['UltiSnips#CanJumpForwards']() == 1 then
            vim.api.nvim_feedkeys(t '<Plug>(ultisnips_jump_forward)', 'm', true)
          else
            fallback()
          end
        end,
      },
      -- ["<Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_next_item()
      --   else
      --     -- cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      --     fallback()
      --   end
      -- end, {
      --   "i",
      --   "s",
      -- }),
      -- ["<S-Tab>"] = cmp.mapping(function(fallback)
      --   if cmp.visible() then
      --     cmp.select_prev_item()
      --   else
      --     fallback()
      --   end
      -- end, {
      --   "i",
      --   "s",
      -- }),
    },
    sources = {
      {
        name = 'nvim_lsp',
        priority = 8,
      },
      { name = 'plugins', priority = 8 },
      {
        name = 'ultisnips',
        priority = 7,
      },
      {
        name = 'buffer',
        priority = 6,
        keyword_length = 3,
      },
      {
        name = 'path',
        priority = 6,
      },
      -- {
      --   name = "nvim_lua",
      --   priority = 5,
      -- },
      -- {
      --   name = "path",
      --   priority = 6,
      -- },
    },
  }

  ---@diagnostic disable-next-line: redundant-parameter
  cmp.setup(options)
  -- Autopairs for completion items
  -- local autopairs = require "nvim-autopairs.completion.cmp"
  -- cmp.event:on("confirm_done", autopairs.on_confirm_done())
  --   -- Set configuration for specific filetype.
  -- cmp.setup.filetype("gitcommit", {
  --   sources = cmp.config.sources({
  --     { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  --   }, {
  --     { name = "buffer" },
  --   }),
  -- })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline({ '/', '?' }, {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' },
  --   },
  -- })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(":", {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = "path" },
  --   }, {
  --     { name = "cmdline" },
  --   }),
  -- })
end

return M
