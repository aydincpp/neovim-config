-- init.lua
--
-- Core Settings
require("core")

-- Plugin Manager
require("config.lazy")

-- Apply colorscheme
vim.schedule(function()
  vim.cmd("colorscheme catppuccin-mocha")
end)
