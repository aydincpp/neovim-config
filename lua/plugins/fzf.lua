-- lua/plugins/fzf.lua
--
-- Wrapper around fzf

local map = require("utils.mapping")
local keymaps = require("core.keymaps_meta")

return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  init = function()
    vim.env.FZF_DEFAULT_OPTS = table.concat({
      "--border=sharp",
      "--layout=reverse",
      "--info=inline",
      "--preview-window=right:0%,border-sharp",
      "--preview='bat --style=numbers --color=always {}'"
    }, " ")

    vim.g.fzf_layout = {
      window = {
        width = 0.5,
        height = 0.4,
      }
    }
  end,
  config = function()
    -- FZF Keymaps
    map.set_keymaps(keymaps.fzf.files, ":Files<CR>")
    map.set_keymaps(keymaps.fzf.live_grep, ":Rg<CR>")
    map.set_keymaps(keymaps.fzf.buffers, ":Buffers<CR>")
    map.set_keymaps(keymaps.fzf.help_tags, ":Helptags<CR>")
    map.set_keymaps(keymaps.fzf.oldfiles, ":History<CR>")
  end,
}
