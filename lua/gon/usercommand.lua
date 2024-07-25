local usercmd = vim.api.nvim_create_user_command

usercmd('FixWhitespace', ':%s/s+$//e', {})
usercmd('Neoclip', ':Telescope neoclip', {})
usercmd('LspRename', function()
  vim.lsp.buf.rename()
end, {})

usercmd('Format', function()
  require('conform').format { bufnr = vim.api.nvim_get_current_buf() }
end, {})

usercmd('EditConfig', ':tabe ~/dotfiles/nvim/.config/nvim/init.lua', {})

usercmd('Delete', [[:call delete(expand('%')) | bdelete!]], {})
usercmd('ReloadHl', [[:lua require("base46").load_all_highlights()<CR>]], {})
usercmd('Bwipe', [[:bufdo bd!]], {})

local function copy_relative_path()
  local file_path = vim.fn.expand '%:.'
  vim.fn.setreg('+', file_path)
  vim.notify('Relative path copied to clipboard: ' .. file_path)
end

usercmd('CpFilename', copy_relative_path, {})
