-- lua/plugins/catppuccin.lua
--
-- Catppuccin colorscheme

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    no_italic = true,
    no_bold = true,
    custom_highlights = function(colors)
      return {
        WinSeparator = { fg = colors.surface0, bg = colors.none }
      }
    end,
  }
}
