-- lua/plugins/tokyonight.lua
--
-- TokyoNight colorscheme

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon",
    styles = {
      comments = { italic = false },
    }
  },
}
