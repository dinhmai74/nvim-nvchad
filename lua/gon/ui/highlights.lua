-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

-- local get_hex = require "custom.utils.get_hex"
local glance_bg = '#14181e'
local glance_bg1 = '#1b2023'
local glance_bg2 = '#171b21'
local glance_light_grey = '#7a818e'
local glance_grey = '#535965'

local telescope_darker = '#10171a'
local telescope_black = '#1e222a'

local diff_view_colors = {
  add = '#343d2f',
  -- change = "#3f2d3d",
  change = '#172a3a',
  text = '#304b44',
  delete = '#4a2022',
}

local M = {}

---@type Base46HLGroupsList
M.override = {
  ['@function'] = { italic = true },
  ['@keyword'] = { italic = true },
  ['@keyword.function'] = { italic = true },
  ['@keyword.return'] = { italic = true },
  ['tyepscriptProp'] = { fg = 'red' },
  IndentBlanklineContextChar = {
    fg = 'nord_blue',
  },
  CmpPmenu = {
    bg = 'darker_black',
  },
  CmpDoc = {
    bg = 'darker_black',
  },
  Pmenu = {
    bg = 'darker_black',
  },
  PmenuSel = {
    bg = 'lightbg',
    fg = 'NONE',
  },
  FloatBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  Comment = {
    italic = true,
  },

  CmpDocBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  FoldColumn = {
    ctermfg = 14,
    ctermbg = 242,
    fg = 'grey_fg',
    bg = 'NONE',
  },
  -- Normal = {
  --   bg = "one_bg",
  -- },
  NormalFloat = {
    bg = 'darker_black',
  },
  DiffAdd = {
    fg = 'NONE',
    bg = diff_view_colors.add,
  },
  DiffChange = {
    fg = 'NONE',
    bg = diff_view_colors.change,
  },
  DiffText = {
    bg = diff_view_colors.text,
    fg = 'NONE',
  },
  DiffDelete = {
    fg = 'grey',
    bg = 'NONE',
  },

  LspSignatureActiveParameter = {
    bg = 'lightbg',
    bold = true,
    fg = 'NONE',
  },

  Search = {
    fg = '#a0a8b7',
    bg = '#4f5c74',
  },

  TelescopeBorder = { fg = telescope_darker, bg = telescope_darker },
  TelescopePromptBorder = { fg = telescope_black, bg = telescope_black },
  TelescopePromptNormal = { fg = 'white', bg = telescope_black },
  TelescopeResultsTitle = { fg = telescope_darker, bg = telescope_darker },
  TelescopePromptPrefix = { fg = 'red', bg = telescope_black },
  TelescopeNormal = { bg = telescope_darker },
  TelescopePreviewTitle = { fg = telescope_black, bg = 'green' },
  TelescopePromptTitle = { fg = telescope_black, bg = 'red' },
  TelescopeSelection = { bg = telescope_black, fg = 'white' },
  TelescopeResultsDiffAdd = { fg = 'green' },
  TelescopeResultsDiffChange = { fg = 'yellow' },
  TelescopeResultsDiffDelete = { fg = 'red' },
  GitSignsAddLn = {
    fg = 'green',
    bg = 'NONE',
  },
  GitSignsChangeLn = {
    fg = 'blue',
    bg = 'NONE',
  },
  GitSignsChange = {
    fg = 'blue',
    bg = 'NONE',
  },
  GitSignsChangedelete = {
    fg = 'nord_blue',
  },
  GitSignsDelete = {
    fg = 'red',
  },
  StatusLine = {
    link = 'StatusLineNC',
  },
  StatusLineNC = {
    bg = 'darker_black',
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = 'green', bold = true },
  -- NoiceMini = { bg = "darker_black " },
  -- NoiceCmdlinePopupBorder = { bg = "darker_black", fg = "darker_black" },
  -- NoiceConfirmBorder = { bg = "darker_black", fg = "darker_black" },
  -- NoiceCmdlinePopupBorderSearch = { bg = "darker_black", fg = "darker_black" },
  -- NoiceCmdlinePopup = { bg = "darker_black" },

  NotifyERRORBorder = { bg = 'darker_black', fg = 'darker_black' },
  NotifyWARNBorder = { bg = 'darker_black', fg = 'darker_black' },
  NotifyINFOBorder = { bg = 'darker_black', fg = 'darker_black' },
  NotifyDEBUGBorder = { bg = 'darker_black', fg = 'darker_black' },
  NotifyTRACEBorder = { bg = 'darker_black', fg = 'darker_black' },
  NotifyBackground = { bg = 'darker_black', fg = 'fg' },
  NotifyINFOBody = { bg = 'darker_black', fg = 'fg' },
  NotifyERRORIcon = { fg = 'red' },
  NotifyERRORTitle = { fg = 'red' },
  NotifyWARNIcon = { fg = 'orange' },
  NotifyWARNTitle = { fg = 'orange' },
  NotifyINFOIcon = { fg = 'green' },
  NotifyINFOTitle = { fg = 'green' },
  NotifyDEBUGIcon = { fg = 'grey' },
  NotifyDEBUGTitle = { fg = 'grey' },
  NotifyTRACEIcon = { fg = 'purple' },
  NotifyTRACETitle = { fg = 'purple' },

  HarpoonBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  HarpoonWindow = {
    bg = 'darker_black',
    fg = 'white',
  },

  TabLineFill = {
    bg = 'lightbg',
  },
  HarpoonInactive = {
    bg = 'lightbg',
    fg = 'grey_fg',
  },
  HarpoonNumberInactive = {
    fg = 'grey_fg',
    bg = 'lightbg',
  },

  HarpoonActive = {
    bg = 'one_bg',
    fg = 'white',
  },
  HarpoonNumberActive = {
    bg = 'one_bg',
    fg = 'white',
  },
  GlancePreviewNormal = {
    bg = glance_bg,
  },
  GlancePreviewEndOfBuffer = {
    bg = glance_bg,
  },
  GlancePreviewMatch = {
    fg = glance_light_grey,
    bg = glance_bg,
  },
  GlancePreviewBorderBottom = {
    bg = glance_bg,
    fg = glance_bg,
  },
  GlanceBorderTop = {
    fg = glance_bg1,
    bg = glance_bg1,
  },
  GlanceWinBarFilename = {
    fg = glance_grey,
    bg = glance_bg1,
  },
  GlanceWinBarFilepath = {
    fg = glance_grey,
    bg = glance_bg1,
  },

  GlanceWinBarTitle = {
    fg = glance_grey,
    bg = glance_bg1,
  },
  GlanceListMatch = {
    fg = glance_light_grey,
    bg = glance_bg,
  },
  GlanceIndent = {
    bg = glance_bg2,
  },
  GlanceListBorderBottom = {
    bg = glance_bg2,
    fg = glance_bg2,
  },
  GlanceListNormal = {
    bg = glance_bg2,
  },
  GlanceListEndOfBuffer = {
    bg = glance_bg2,
  },

  UfoFoldedFg = {
    fg = 'grey_fg',
  },
  LocalHighlight = {
    bg = '#393939',
    ctermbg = 53,
  },
  InclineNormal = {
    fg = 'fg',
    bg = 'one_bg3',
    bold = true,
  },
  InclineNormalNC = {
    fg = 'grey',
    bg = 'NONE',
  },
  InclineSpacing = {
    fg = 'NONE',
    bg = 'purple',
  },
  InclineModified = {
    fg = 'grey',
    bg = 'NONE',
  },
  BqfPreviewFloat = {
    bg = 'darker_black',
  },
  BqfPreviewBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  GitSignsAdd = {
    fg = 'green',
    bg = 'NONE',
  },
  GitSignsAddLn = {
    fg = 'green',
    bg = 'NONE',
  },
  GitSignsChangeLn = {
    fg = 'blue',
    bg = 'NONE',
  },
  GitSignsChange = {
    fg = 'blue',
    bg = 'NONE',
  },
  GitSignsChangedelete = {
    fg = 'nord_blue',
  },
  GitSignsDelete = {
    fg = 'red',
  },
  AlphaHeader = {
    fg = 'grey_fg',
  },
  AlphaButtons = {
    fg = 'light_grey',
  },
  LazyGitFloat = {
    bg = 'darker_black',
  },
  LazyGitBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  NvimTreeModifiedFile = {
    fg = 'orange',
  },
  FzfPreviewBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  FzfBackground = {
    bg = 'darker_black',
  },
  FzfBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  CocFloatingBorder = {
    bg = 'darker_black',
    fg = 'darker_black',
  },
  CocFloating = {
    bg = 'darker_black',
  },
  CocInlayHint = {
    fg = 'light_grey',
  },
  CocErrorVirtualText = {
    fg = 'red',
  },
  CocErrorSign = {
    fg = 'red',
  },
  CocWarningSign = {
    fg = 'orange',
  },
  CocMenuSel = {
    bg = 'lightbg',
    fg = 'NONE',
  },
  DiagnosticError = {
    fg = 'red',
  },

  LspInlayHint = {
    fg = 'light_grey',
  },
  RainbowDelimiterRed = { fg = 'red' },
  RainbowDelimiterYellow = { fg = 'yellow' },
  RainbowDelimiterBlue = { fg = 'blue' },
  RainbowDelimiterOrange = { fg = 'orange' },
  RainbowDelimiterGreen = { fg = 'green' },
  RainbowDelimiterViolet = { fg = 'purple' },
  RainbowDelimiterCyan = { fg = 'cyan' },
  MiniIndentscopeSymbol = { fg = 'blue' },
  MiniPickMatchCurrent = { bg = 'lightbg' },
  St_harpoon_active = { fg = 'white' },
  St_harpoon_inactive = { fg = 'grey' },
  St_grapple_info = { fg = 'blue' },
  St_file_info = { fg = 'fg' },
  St_line = { fg = 'fg' },
  St_git_branch = { fg = 'green' },
  St_dap_info = { fg = 'green' },
  St_dap_breakpoint = { fg = 'red' },
  St_dap_stopped = { fg = 'red' },
}

return M
