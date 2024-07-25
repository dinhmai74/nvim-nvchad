local icons = require 'gon.ui.icons'

local M = {}

---@return string
function M.file_name()
  local icon = '  '
  local filename = vim.fn.expand '%:.'
  if filename ~= 'Empty ' then
    local devicons_present, devicons = pcall(require, 'nvim-web-devicons')

    if devicons_present then
      local ft_icon = devicons.get_icon(filename)
      icon = (ft_icon ~= nil and ' ' .. ft_icon) or ''
    end

    filename = ' ' .. filename .. ' '
  end
  return '%#St_file_info#' .. icon .. filename
end

---@return string
function M.grapple()
  return ''
  -- local grapple = require('grapple').statusline()

  -- return '%#St_grapple_info#' .. grapple
end
--- Git status (if any).
---@return string
function M.git_component()
  local head = vim.b.gitsigns_head
  if not head then
    return ''
  end

  return '%#St_git_branch#' .. string.format(' %s', head)
end

---@return string
function M.position_component()
  local line = vim.fn.line '.'
  local line_count = vim.api.nvim_buf_line_count(0)
  local col = vim.fn.virtcol '.'

  return table.concat {
    '%#StatuslineItalic#l: ',
    string.format('%%#StatuslineTitle#%d', line),
    string.format('%%#StatuslineItalic#/%d c: %d', line_count, col),
  }
end

--- Renders the statusline.
---@return string
function M.render()
  return table.concat {
    M.file_name(),
    M.grapple(),
    '%#St_line#%=',
  }
end
-- vim.o.statusline = "%!v:lua.require'gon.statusline'.render()"

return M
