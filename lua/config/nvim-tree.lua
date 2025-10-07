-- lua/config/nvim-tree.lua
--
-- Custom configuration for NvimTree plugin.

-- Ensures that NvimTree never ends up as the only visible window,
-- preventing it from taking over the full screen when closing other windows.

local M = {}

-- Utility functions for windows
local windows_utils = require("utils.windows")

-- Load All Augroups
local augroups = require("core.augroups")

vim.api.nvim_create_autocmd("QuitPre", {
  group = augroups.nvim_tree,
  callback = function()
    local cur_tab = vim.api.nvim_get_current_tabpage()
    local wins_in_tab = vim.api.nvim_tabpage_list_wins(cur_tab)
    local nvim_tree_win = nil

    -- Find NvimTree window ID
    nvim_tree_win = windows_utils.find_window_in_tab_by_bufname("NvimTree_")

    -- Exit early if NvimTree is not open, or
    -- the window being closed is NvimTree itself
    local cur_win = vim.api.nvim_tabpage_get_win(cur_tab)
    if not nvim_tree_win or cur_win == nvim_tree_win then
      return
    end

    -- Get a list of all tabpages
    local tabs = vim.api.nvim_list_tabpages()

    -- If only two windows remain (NvimTree + one other),
    -- close NvimTree to prevent it from occupying the entire screen
    if #wins_in_tab == 2 then
      if #tabs > 1 then
        vim.cmd("tabclose")
      else
        vim.api.nvim_win_close(nvim_tree_win, true)
      end
    end
  end
})

-- When the Trouble Symbols split opens, it may push and shrink the NvimTree window.
-- This autocmd ensures that NvimTree never becomes smaller than its minimum width.
M.min_width = 30

vim.api.nvim_create_autocmd("WinResized", {
  group = augroups.nvim_tree,
  callback = function()
    local nvim_tree_win = windows_utils.find_window_in_tab_by_bufname("NvimTree_")
    if not nvim_tree_win then
      return
    end

    local width = vim.api.nvim_win_get_width(nvim_tree_win)
    if width < M.min_width then
      vim.api.nvim_win_set_width(nvim_tree_win, M.min_width)
    end
  end
})

return M
