vim.g.base46_cache = vim.fn.stdpath 'data' .. '/base46_cache/'
require 'gon'
require 'gon.opts'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup 'plugins'

local integrations = require('nvconfig').base46.integrations
for _, name in ipairs(integrations) do
  dofile(vim.g.base46_cache .. name)
end
--
require('base46').load_all_highlights() -- this compiles + loads hl
require 'gon.autocmd'
require 'gon.usercommand'
require 'gon.mapping'
require 'gon.statusline'
require 'gon.test.jest'
