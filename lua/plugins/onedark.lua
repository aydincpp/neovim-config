-- lua/plugins/onedark.lua
--
-- Onedark colorscheme

return {
  "navarasu/onedark.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'darker'
    }
  end
}
