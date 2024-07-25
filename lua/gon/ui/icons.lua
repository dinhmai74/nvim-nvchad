local M = {}

--- Diagnostic severities.
M.diagnostics = {
  Error = '✘',
  Warn = '󰀪',
  Info = '',
  Hint = '',
  ERROR = '✘',
  WARN = '󰀪',
  INFO = '',
  HINT = '',
}

--- For folding.
M.arrows = {
  right = '',
  left = '',
  up = '',
  down = '',
}

--- LSP symbol kinds.
M.symbol_kinds = {
  Variable = '',
  Snippet = ' 󰃐',
  Event = '',
  Table = '',
  Buffer = '',
  Object = '',
  Tag = '',
  Boolean = '蘒',
  Number = '',
  Calendar = '',
  Default = '',
  Text = '',
  Method = '󰊕',
  Function = 'ƒ',
  Field = '󰌋',
  Interface = '',
  Module = '',
  Unit = '',
  Enum = '',
  Keyword = '󰌋',
  Color = '',
  File = '',
  Reference = '',
  Null = '',
  Package = '',
  Constructor = '',
  EnumMember = '',
  Struct = '󰙅',
  Operator = '󰆖',
  TypeParameter = '',
  Error = '✘',
  Warn = '󰀪',
  Info = '',
  Hint = '',
  Key = '',
  Folder = '',
  -- Folder = "",
  FolderOpen = '',
  FolderSymlink = '',

  Namespace = '󰌗',
  Class = '󰠱',
  Property = '󰜢',
  Value = '󰎠',
  Constant = '󰏿',
  Array = '[]',
  String = '󰉿',
  Watch = '󰥔',
  Copilot = '',
  Codeium = '',
  TabNine = '',
}

--- Shared icons that don't really fit into a category.
M.misc = {
  bug = '',
  git = '',
  search = '',
  vertical_bar = '│',
}

return M
