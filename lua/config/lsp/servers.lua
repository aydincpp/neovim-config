-- lua/config/lsp/servers.lua
--
-- This file defines all LSP servers that should be configured in Neovim.
-- Each server is represented as a key in the returned table, with its
-- configuration options as the value.
--
-- NOTE: How to add a new LSP server:
--
-- 1. Install the server using your preferred method (e.g., mason.nvim, system package).
-- 2. Add a new entry in this table with the server's name as the key.
--    For example:
--      M.pyright = {} -- default options for Python server
-- 3. If you need custom settings, pass them as a table:
--      M.lua_ls = {
--        settings = {
--          Lua = { runtime = { version = "LuaJIT" } }
--        }
--      }
-- 4. The server will automatically use the global `on_attach` and `handlers`
--    via the LspAttach autocmd in `handlers.lua`.
-- 5. Optional: If you need server-specific keymaps or behavior, you can add
--    an `on_attach` function in the server's table. It will run after the
--    global on_attach.

local M = {}

-- Lua Language Server
M.lua_ls = {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          "${3rd}/busted/library"
        },
      },
      telemetry = {
        enable = false,
      },
    },
  }
}

-- Clangd (C/C++)
M.clangd = {}

-- CMake
M.cmake = {}

return M
