return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {
    border = false,
    size = { h = 60, w = 70 },
    mappings = { sidebar = nil, term = nil },
    terminals = {
      { name = "Terminal" },
    },
  },
  config = function()
    local map = require("utils.mapping")
    local meta = require("core.keymaps_meta")

    map.set_keymaps(meta.general.toggle_terminal, function()
      vim.cmd("FloatermToggle")
    end)
  end
}
