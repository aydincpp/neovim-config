-- lua/core/augroups.lua
--
-- Augroups Module
-- Naming: prefix (ns) + descriptive snake_case to avoid collisions

local M = {}

-- Namespace prefix for augroup names
local ns = "my_"

-- Yank Highlight Augroup
M.yank_highlight = vim.api.nvim_create_augroup(ns .. "yank_highlight", { clear = true })

-- FileType Augroup
M.filetype = vim.api.nvim_create_augroup(ns .. "filetype", { clear = true })

-- Highlights Augroup
M.highlights = vim.api.nvim_create_augroup(ns .. "highlights", { clear = true })

-- NvimTree Plugin Augroup
M.nvim_tree = vim.api.nvim_create_augroup(ns .. "nvim_tree", { clear = true })

return M
