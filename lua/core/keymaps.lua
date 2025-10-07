-- lua/core/keymaps.lua
--
-- Global Keymaps
-- This file loads all core keymap specs defined in lua/core/keymaps_meta.lua
-- and applies them using the mapping utility in lua/utils/mapping.lua.
--
-- NOTE:
-- - To add new keymaps, first define their specs in lua/core/keymaps_meta.lua,
--   then load them using the mapping utility (recommended).
--
-- NOTE:
-- - Plugin-specific keymaps should be defined inside the corresponding
--   plugin specification files to keep the configuration modular.
--
-- WARN:
-- - Always use the mapping utility ("utils.mapping.set_keymaps") instead of vim.keymap.set.
--   See lua/utils/mapping.lua for details on how it works.
--   This ensures consistency, readability, and automatic handling of metadata.

--- All keymaps specs
local meta = require("core.keymaps_meta")

--- Keymap utility functions
local map = require("utils.mapping")

-- General Editing Keymaps
local general = meta.general

-- Clear search highlights
map.set_keymaps(general.clear_search, "<cmd>nohlsearch<CR>")

-- Save all files and reload Neovim configuration
map.set_keymaps(general.save_reload_config, "<cmd>update<CR><cmd>source $MYVIMRC<CR>")

-- Jump to the start of the current line
map.set_keymaps(general.line_start, "^")

-- Jump to the end of the current line
map.set_keymaps(general.line_end, "$")

-- Go to the next search result and center the cursor
map.set_keymaps(general.next_search, "nzz")

-- Go to the previous search result and center the cursor
map.set_keymaps(general.prev_search, "Nzz")

-- Exit terminal mode (back to normal mode)
map.set_keymaps(general.exit_terminal, "<C-\\><C-n>")

-- Text Editing Keymaps
local editing = meta.editing

-- Normal mode indentation
map.set_keymaps(editing.indent_left, "<<")
map.set_keymaps(editing.indent_right, ">>")

-- Visual mode indentation
map.set_keymaps(editing.indent_left_v, "<gv")
map.set_keymaps(editing.indent_right_v, ">gv")

-- Paste and auto-indent
map.set_keymaps(editing.paste_indent, "p`[v`]=`]")

-- File Operations Keymaps
local files = meta.files

-- Save current buffer
map.set_keymaps(files.save_buffer, "<cmd>update<CR>")

-- Save all open buffers
map.set_keymaps(files.save_all, "<cmd>wa<CR>")

-- Save current buffer and quit this window
map.set_keymaps(files.save_quit_window, "<cmd>update<CR><cmd>q<CR>")

-- Save all buffers and quit all windows
map.set_keymaps(files.save_quit_all, "<cmd>wa<CR><cmd>qa<CR>")

-- Quit current window
map.set_keymaps(files.quit_window, "<cmd>q<CR>")

-- Quit all windows
map.set_keymaps(files.quit_all, "<cmd>qa<CR>")

-- Window Management Keymaps
local windows = meta.windows

-- Utility functions for better window management
local windows_utils = require("utils.windows")

-- Split window horizontally (below)
map.set_keymaps(windows.split_horizontal, "<cmd>split<CR>")

-- Split window vertically (to the right)
map.set_keymaps(windows.split_vertical, "<cmd>vsplit<CR>")

-- Move cursor to the left window
map.set_keymaps(windows.move_left, "<C-w>h")

-- Move cursor to the right window
map.set_keymaps(windows.move_right, "<C-w>l")

-- Move cursor to the lower window
map.set_keymaps(windows.move_down, "<C-w>j")

-- Move cursor to the upper window
map.set_keymaps(windows.move_up, "<C-w>k")

-- Window resizing keymaps
--
-- By default, these use the window utility functions for smarter resizing.
-- If you prefer the built-in resize commands instead, uncomment the provided alternatives. 
-- NOTE: set_keymaps will always override previous mappings, so you don't need to delete anything.

-- Resize window narrower
map.set_keymaps(windows.resize_narrower, function() windows_utils.resize_horizontal(-2) end)
-- map.set_keymaps(windows.resize_narrower, "<cmd>vertical resize -2<CR>")

-- Resize window wider
map.set_keymaps(windows.resize_wider, function() windows_utils.resize_horizontal(2) end)
-- map.set_keymaps(windows.resize_wider, "<cmd>vertical resize +2<CR>")

-- Resize window shorter
map.set_keymaps(windows.resize_shorter, function() windows_utils.resize_vertical(-2) end)
-- map.set_keymaps(windows.resize_shorter, "<cmd>resize -2<CR>")

-- Resize window taller
map.set_keymaps(windows.resize_taller, function() windows_utils.resize_vertical(2) end)
-- map.set_keymaps(windows.resize_taller, "<cmd>resize +2<CR>")

-- Buffers & Tabs Keymaps
local buffers_tabs = meta.buffers_tabs

-- Go to the next buffer
map.set_keymaps(buffers_tabs.next_buffer, "<cmd>bnext<CR>")

-- Go to the previous buffer
map.set_keymaps(buffers_tabs.prev_buffer, "<cmd>bprevious<CR>")

-- Delete the current buffer
map.set_keymaps(buffers_tabs.delete_buffer, "<cmd>bdelete<CR>")

-- Go to the next tab
map.set_keymaps(buffers_tabs.next_tab, "<cmd>tabnext<CR>")

-- Go to the previous tab
map.set_keymaps(buffers_tabs.prev_tab, "<cmd>tabprevious<CR>")

-- Open a new tab
map.set_keymaps(buffers_tabs.new_tab, "<cmd>tabnew<CR>")

-- Close the current tab
map.set_keymaps(buffers_tabs.close_tab, "<cmd>tabclose<CR>")
