-- lua/plugins/nvim-tree.lua
--
-- A File Explorer For Neovim Written In Lua

return {
  "nvim-tree/nvim-tree.lua",

  -- Disable netrw before NvimTree loads to prevent conflicts
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,

  opts = {
    view = {
      width = require("config.nvim-tree").min_width
    }
  },

  config = function(_, opts)
    --- Setup NvimTree with the provided options
    --- @diagnostic disable-next-line: different-requires
    require("nvim-tree").setup(opts)

    --- Load additional custom configuration for NvimTree
    --- @diagnostic disable-next-line: different-requires
    require("config.nvim-tree")

    -- Load NvimTree-specific keymap specifications
    local nvim_tree_keymaps = require("core.keymaps_meta").nvim_tree

    -- Keymap utility functions
    local map = require("utils.mapping")

    -- Map toggle action for NvimTree
    map.set_keymaps(nvim_tree_keymaps.toggle, "<cmd>NvimTreeToggle<CR>")
  end
}
