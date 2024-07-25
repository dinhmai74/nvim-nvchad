local M = {
  'b0o/incline.nvim',
  lazy = false,
}

-- should winbar file in the right
M.config = function()
  local status_ok, incline = pcall(require, 'incline')
  if not status_ok then
    return
  end

  local trim = require 'gon.utils.trim'

  incline.setup {
    hide = {
      cursorline = false,
      focused_win = false,
      only_win = true,
    },
    highlight = {
      groups = {},
    },
    render = function(props)
      local bufname = vim.api.nvim_buf_get_name(props.buf)
      local icon, iconColor = require('nvim-web-devicons').get_icon_color(bufname, nil, { default = true })
      local render_path = bufname ~= '' and vim.fn.fnamemodify(bufname, ':.') or '[No Name]'

      local render_modified = vim.api.nvim_buf_get_option(props.buf, 'modified') and '  ' or ' '

      local render_incline = {}
      table.insert(render_incline, { icon, guifg = iconColor })
      table.insert(render_incline, { render_modified, group = 'InclineModified' })
      table.insert(render_incline, trim.ellipse_end(render_path, 40))
      return render_incline
    end,
    window = {
      margin = {
        horizontal = 0,
        vertical = 0,
      },
      padding = 2,
    },
  }
end
return M
