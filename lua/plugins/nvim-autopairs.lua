-- lua/plugins/nvim-autopairs.lua
--
-- Automatically insert matching brackets, parentheses, and quotes

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true
}
