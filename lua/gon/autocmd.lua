local autocmd = vim.api.nvim_create_autocmd

-- create directories when needed, when saving a file
autocmd('BufWritePre', {
  pattern = '*',
  group = gon.nvim_create_augroup('create-dir', { clear = true }),
  callback = function()
    local fn = vim.fn
    local dir = fn.expand '<afile>:p:h'
    -- This handles URLs using netrw. See ':help netrw-transparent' for details.
    if dir:find '%l+://' == 1 then
      return
    end
    if fn.isdirectory(dir) == 0 then
      fn.mkdir(dir, 'p')
    end
  end,
})

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 250,
    }
  end,
})

local cmd = vim.cmd

cmd [[
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev q1 q!
cnoreabbrev w1 w!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev qa1 qa!
cnoreabbrev ag Ag
cnoreabbrev rg Rg
cnoreabbrev or OR
]]

gon.autocmd({ 'BufNewFile', 'BufRead' }, {
  group = gon.nvim_create_augroup('treat-ts-config', { clear = true }),
  pattern = { 'tsconfig.json' },
  command = 'set filetype=jsonc',
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.code-snippets' },
  command = 'set filetype=json',
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'json', 'jsonc' },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Mapping utils for qf list',
  group = vim.api.nvim_create_augroup('qf maping', { clear = true }),
  pattern = { 'qf' },
  callback = function()
    vim.keymap.set('n', '<C-n>', ':cnext<CR>', { buffer = true, silent = true })
    vim.keymap.set('n', '<C-p>', ':cprev<CR>', { buffer = true, silent = true })
    vim.keymap.set('n', '<ESC>', ':cclose<CR>', { buffer = true, silent = true })
  end,
})

-- quickfix list delete keymap
function Remove_qf_item()
  local curqfidx = vim.fn.line '.'
  local qfall = vim.fn.getqflist()

  -- Return if there are no items to remove
  if #qfall == 0 then
    return
  end

  -- Remove the item from the quickfix list
  table.remove(qfall, curqfidx)
  vim.fn.setqflist(qfall, 'r')

  -- Reopen quickfix window to refresh the list
  vim.cmd 'copen'

  -- If not at the end of the list, stay at the same index, otherwise, go one up.
  local new_idx = curqfidx < #qfall and curqfidx or math.max(curqfidx - 1, 1)

  -- Set the cursor position directly in the quickfix window
  local winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
  vim.api.nvim_win_set_cursor(winid, { new_idx, 0 })
end

vim.cmd 'command! RemoveQFItem lua Remove_qf_item()'
vim.api.nvim_command 'autocmd FileType qf nnoremap <buffer> dd :RemoveQFItem<cr>'
