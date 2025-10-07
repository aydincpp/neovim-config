-- lua/core/autocmds.lua
--
-- Predefined Augroups
local augroups = require("core.augroups")

-- Highlight Text On Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = augroups.yank_highlight,
  callback = function()
    vim.highlight.on_yank()
  end
})

-- FileType settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

-- Reapply highlights whenever the colorscheme changes
local highlights = require("config.highlights")
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  group = augroups.highlights,
  callback = highlights.apply,
})
