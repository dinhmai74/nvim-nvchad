vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
-- vim.opt.listchars = { trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.o.swapfile = false
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:,diff:╱]]
vim.cmd [[set listchars+=tab:\ · ]]
vim.opt.listchars = { leadmultispace = '│ ', multispace = '│ ', tab = '│ ' }
vim.opt.colorcolumn = '80'

-- folding by treesitter
vim.o.foldlevel = 20
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldmethod = 'expr'
vim.o.foldenable = true
vim.o.foldcolumn = '1' -- '0' is not bad

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.UltiSnipsSnippetDirectories = { '~/dotfiles/snips/ulti' }

vim.g.camelsnek_alternative_camel_commands = 1
vim.g.camelsnek_i_am_an_old_fart_with_no_sense_of_humour_or_internet_culture = 1
vim.g.camelsnek_no_fun_allowed = 1
vim.g.fzf_layout = { window = { width = 0.9, height = 0.8 } }
vim.g.fzf_colors = {
  bg = { 'bg', 'FzfBackground' },
  border = { 'fg', 'FzfBorder' },
}
vim.g.rooter_patterns = {
  '.git',
  '.hg',
}

vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
vim.g.UltiSnipsRemoveSelectModeMappings = 0
