-- lua/utils/mapping.lua
--
-- Utility module for managing Neovim keymaps.
-- Provides functions to set, delete, and check keymaps with default options,
-- safely handle existing mappings, and temporarily override default mapping options.
-- Also supports batch keymap definitions from specs and proper mode validation.

local M = {}

-- Utility module for displaying notifications
local notify = require("utils.notify")

-- See :help map-modes
local valid_modes = {
  n = true,
  i = true,
  v = true,
  x = true,
  s = true,
  o = true,
  t = true,
  l = true,
  ["!"] = true
}

--- Checks if a mode or list of modes is valid
--- @param mode string|string[] Mode(s) to check
--- @return boolean True if all modes are valid
local function is_valid_mode(mode)
  local modes = type(mode) == "table" and mode or { mode }
  for _, m in ipairs(modes) do
    if not valid_modes[m] then return false end
  end

  return true
end

--- Convert special key sequences to Neovim’s internal representation
--- @param key string Key sequence
--- @return string Internal key representation
function M.resolve_keycodes(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

--- Default options applied to all keymaps
--- @type table<string, boolean> Mapping options
M.default_opts = { noremap = true, silent = true }

--- Temporarily modify default keymap options.
--- The previous defaults are saved internally.
--- WARN: Call reset_default_opts() after setting your keymaps
---       to restore the original default options.
---
--- @param new_opts table Table of options to override defaults
function M.set_default_opts(new_opts)
  M._saved_opts = vim.tbl_deep_extend("force", {}, M.default_opts)
  M.default_opts = vim.tbl_deep_extend("force", M.default_opts, new_opts)
end

--- Restore the default keymap options to their previous state.
--- WARN: This must be called after temporarily modifying the defaults with
---       set_default_opts(). After calling this, M.default_opts will revert to what
---       it was before the last set_default_opts() call.
function M.reset_default_opts()
  M.default_opts = M._saved_opts
  M._saved_opts = nil
end

--- Set a keymap with default options.
--- This function merges the provided options with the current defaults (`M.default_opts`),
--- so you only need to specify options that differ from the defaults.
---
--- @param mode string|string[] The mode(s) in which the mapping applies
--- @param lhs string The left-hand side key sequence
--- @param rhs string|function The right-hand side command or Lua function
--- @param opts table? Optional keymap options that override the defaults
--- @param safe boolean? If true, the function will not override existing keymaps. default is false
--- @return boolean True if a mapping was set, false otherwise
function M.set(mode, lhs, rhs, opts, safe)
  -- Check if the provided mode(s) are valid
  if not is_valid_mode(mode) then
    notify.error("Unsupported mode: " .. vim.inspect(mode))
    return false
  end

  -- Respect the `safe` option
  safe = safe or false
  if safe and M.exists(mode, lhs) then
    return false
  end

  -- Merge provided options with defaults and set the keymap
  opts = vim.tbl_deep_extend("force", M.default_opts, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)

  return true
end

--- Set keymaps from a spec definition
--- Specs are defined in lua/core/keymaps_meta.lua
---
--- @param spec table keymap spec containing mode(s) and keys
--- @param rhs string|function The right-hand side command or Lua function
function M.set_keymaps(spec, rhs)
  local keys = spec.keys
  for _, key in ipairs(keys) do
    M.set(spec.mode, key.lhs, rhs, { desc = key.desc })
  end
end

--- Check if a keymap exists.
--- Iterates over all keymaps in the given mode and returns true
--- if a mapping for the specified {lhs} is found.
---
--- @param mode string|string[] Single mode or a table of modes to check
--- @param lhs string The left-hand side key sequence to check
--- @return boolean True if the keymap exists, false otherwise
function M.exists(mode, lhs)
  -- Check if the provided mode(s) are valid
  if not is_valid_mode(mode) then
    notify.error("Unsupported mode: " .. vim.inspect(mode))
    return false
  end

  -- Normalize lhs
  local resolved_lhs = M.resolve_keycodes(lhs)

  -- Normalize mode(s) to a table
  local modes = type(mode) == "table" and mode or { mode }

  -- Iterate over each mode and check all keymaps to see if `lhs` is already mapped
  for _, m in ipairs(modes) do
    --- @diagnostic disable-next-line: param-type-mismatch
    local keymaps = vim.api.nvim_get_keymap(m)
    for _, km in ipairs(keymaps) do
      if km.lhs == resolved_lhs then
        return true
      end
    end
  end

  return false
end

--- Delete a keymap.
--- @param mode string|string[] The mode(s) in which the mapping was set
--- @param lhs string The key sequence to remove
--- @param opts table? Optional options. Defaults to global
--- @return boolean True if a mapping was deleted, false otherwise
function M.del(mode, lhs, opts)
  -- Check if the provided mode(s) are valid
  if not is_valid_mode(mode) then
    notify.error("Unsupported mode: " .. vim.inspect(mode))
    return false
  end

  if not M.exists(mode, lhs) then
    return false
  end

  vim.keymap.del(mode, lhs, opts)
  return true
end

return M
