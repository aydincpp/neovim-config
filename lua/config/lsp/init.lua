-- lua/config/lsp/init.lua
--
-- This file initializes Neovim's LSP configuration.
--
-- Workflow for users:
-- 1. All global LSP diagnostics settings are defined in:
--      lua/config/lsp/diagnostics.lua
--    You can modify how diagnostics appear, virtual text, signs, etc.
--
-- 2. LSP handlers and the `on_attach` function are defined in:
--      lua/config/lsp/handlers.lua
--    This is where buffer-local keymaps, autoformatting, and dynamic
--    capability handling, etc are set up.
--
-- 3. Server-specific configurations are stored in:
--      lua/config/lsp/servers.lua
--    To add or customize a server, add a new entry in this file.
--    You can optionally override `on_attach` or add custom settings.
--
-- 4. This file (`init.lua`) simply loads diagnostics, handlers, and servers,
--    then enables each server automatically. Normally you do not need
--    to modify this file unless you want to change initialization behavior.

require("config.lsp.diagnostics")
require("config.lsp.handlers")

local servers = require("config.lsp.servers")

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
