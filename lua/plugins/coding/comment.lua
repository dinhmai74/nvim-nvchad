---@type NvPluginSpec
local M = {
  "numToStr/Comment.nvim",
}

M.config = function()
  local status_ok, Comment = pcall(require, "Comment")
  if not status_ok then
    return
  end

  local utils = require "Comment.utils"
  Comment.setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M
