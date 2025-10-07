-- lua/plugins/nvim-lspconfig.lua
--
-- Provides configurations for built-in LSP client
-- Defines default settings for language servers

return {
  "neovim/nvim-lspconfig",
  config = function()
    require("config.lsp")
  end
}
