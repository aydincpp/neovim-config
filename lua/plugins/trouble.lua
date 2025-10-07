-- lua/plugins/trouble.lua
--
-- A pretty list for showing diagnostics, references, telescope results, quickfix and location
-- lists to help you solve all the trouble your code is causing.

return {
  enabled = true,
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    focus = true,
    warn_no_results = true,
    modes = {
      diagnostics = {
        auto_open = true,
        auto_close = true,
        win = {
          relative = "editor",
        }
      },
      symbols = {
        auto_open = true,
        auto_close = true,
        win = {
          type = "split",
          relative = "editor",
          position = "right",
          size = 30,
        }
      }
    }
  }
}
