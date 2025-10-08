-- lua/config/highlights.lua
--
-- Sets highlight groups to make certain UI elements transparent

local M = {}

local hl = vim.api.nvim_set_hl
local get_hl = vim.api.nvim_get_hl

function M.apply()
  local win_sep = get_hl(0, { name = "WinSeparator" })
  local sign_column = get_hl(0, { name = "SignColumn" })
  local cursor_line_sign = get_hl(0, { name = "CursorLineSign" })
  local normal = get_hl(0, { name = "Normal" })

  -- General
  hl(0, "FloatBorder", { bg = "NONE" })
  hl(0, "NormalFloat", { bg = "NONE" })
  hl(0, "WinSeparator", { bg = "NONE", fg = win_sep.fg })
  hl(0, "EndOfBuffer", { fg = normal.bg, bg = "NONE" })
  hl(0, "SignColumn", { bg = "NONE", fg = sign_column.fg })
  hl(0, "CursorLineSign", { bg = "NONE", fg = cursor_line_sign.fg })

  -- BlinkCmp
  hl(0, "BlinkCmpMenu", { bg = "NONE" })
  hl(0, "BlinkCmpMenuBorder", { bg = "NONE" })
  hl(0, "BlinkCmpKind", { bg = "NONE" })

  -- NvimTree
  hl(0, "NvimTreeNormal", { bg = "NONE" })
  hl(0, "NvimTreeNormalNC", { bg = "NONE" })
  hl(0, "NvimTreeEndOfBuffer", { bg = "NONE", fg = "bg" })
  hl(0, "NvimTreeWinSeparator", { bg = "NONE", fg = win_sep.fg })

  -- Trouble
  hl(0, "TroubleNormal", { bg = "NONE" })
end

return M
