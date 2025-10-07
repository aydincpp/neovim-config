-- lua/plugins/todo-comments.lua
--
-- Highlights and searches for TODO, FIXME, etc. in comments

return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  opts = {
    signs = false
  },
}
