return {
  lazy = false,
  url = 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
  config = function()
    require 'rainbow-delimiters.setup' {
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
        typescript = 'rainbow-parens',
        typescriptreact = 'rainbow-parens',
        tsx = 'rainbow-parens',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
