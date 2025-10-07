-- lua/utils/notify.lua
--
-- Utility module for displaying notifications.
-- Provides simple functions to show info, warning, error, and debug messages
-- using vim.notify with the appropriate log level.

local M = {}

--- Notify an info message
--- @param msg string
function M.info(msg)
    vim.notify(msg, vim.log.levels.INFO)
end

--- Notify a warning message
--- @param msg string
function M.warn(msg)
    vim.notify(msg, vim.log.levels.WARN)
end

--- Notify an error message
--- @param msg string
function M.error(msg)
    vim.notify(msg, vim.log.levels.ERROR)
end

--- Notify a debug message
--- @param msg string
function M.debug(msg)
    vim.notify(msg, vim.log.levels.DEBUG)
end

return M
