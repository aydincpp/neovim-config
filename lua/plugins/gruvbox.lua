-- lua/plugins/gruvbox.lua
--
-- Gruvbox colorscheme

return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    bold = false,
    italic = {
      strings = false,
      emphasis = false,
      comments = false,
      operators = false,
      folds = false,
    },
    overrides = {
      SignColumn = { bg = "#282828" }
    }
  }
}
