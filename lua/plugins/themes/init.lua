return {
  {
    'NvChad/base46',
    commit = 'adb64a6ae70f8c61c5ab8892f07d29dafd4d47ad',
    branch = 'v2.5',
    lazy = false,
    build = function()
      require('base46').load_all_highlights()
    end,
  },
}
