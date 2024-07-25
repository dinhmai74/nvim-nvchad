_G.gon = {}
gon.remove_unused_on_save = false
gon.coc = false
gon.noice = false
gon.tsserver = false
gon.tstool = true
gon.vtsls = false
gon.transparent = false
gon.glance = true

---@diagnostic disable-next-line: unused-local, duplicate-set-field
gon.noti_full = function(mes, title, type)
  print(title .. ': ' .. mes)
end

---@diagnostic disable-next-line: unused-local, duplicate-set-field
gon.noti_mini = function(mes, type)
  print(mes)
end

gon.load_highlight = function(group)
  for hl, col in pairs(group) do
    vim.api.nvim_set_hl(0, hl, col)
  end
end

gon.merge = function(a, b)
  local c = {}
  for k, v in pairs(a) do
    c[k] = v
  end
  for k, v in pairs(b) do
    c[k] = v
  end
  return c
end

gon.autocmd = vim.api.nvim_create_autocmd
gon.user_command = function(name, command, options)
  vim.api.nvim_create_user_command(name, command, options or {})
end
gon.nvim_create_augroup = function(name, options)
  return vim.api.nvim_create_augroup(name, options or {})
end

gon.failed_requires = {}

gon.require = function(module, callback)
  local status_ok, result = pcall(require, module)
  if not status_ok then
    table.insert(gon.failed_requires, module)
    return {
      setup = function(variables) end,
    }
  else
    if callback then
      callback(result)
    end
  end
  return result
end

gon.call_plug_cmd = function(command)
  vim.api.nvim_feedkeys(
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_replace_termcodes('<Plug>' .. command, true, true, true),
    'm',
    true
  )
end

function gon.replace_keycodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function gon.buf_keymap(key, command, config)
  config = config or {}
  vim.api.nvim_buf_set_keymap(config.bufnr or 0, config.mode or 'n', key, command, config.opts or { noremap = true, silent = true })
end

gon.vim_opts = function(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

gon.wk_name = function(icon, name)
  local commandSpaces = '    '
  return icon .. commandSpaces .. name
end
gon.wk_group = function(icon, name)
  local groupSpace = '    '
  return icon .. groupSpace .. name
end

gon.write_data = function(path, old, new)
  local file = io.open(path)
  local content = file:read '*all'
  file:close()

  if content:match(old) then
    content = content:gsub(old, new)
  end

  local file = io.open(path, 'w')
  file:write(content)
  file:close()
end

require "gon.nvchad_types"
