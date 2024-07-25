-- return {
--   "echasnovski/mini.starter",
--   opts = {
--     items = { { name = "", action = "", section = "" } },
--     header = function()
--       local nonsense = string.format(
--         "%s\n%s",
--         -- stylua: ignore
--         "I use neovim btw",
--         "with a window manager, naturally"
--       )
--       return nonsense
--     end,
--     footer = "... bs et all ...",
--   },
-- }
return {
  "letieu/btw.nvim",
  config = function()
    require('btw').setup()
  end,
}
