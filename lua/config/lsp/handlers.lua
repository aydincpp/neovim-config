-- lua/config/lsp/handlers.lua

local M = {}

--- keymaps specs and utility functions
local meta = require("core.keymaps_meta")
local map = require("utils.mapping")

-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
---@param client vim.lsp.Client
---@param method string
---@param bufnr? integer
local function client_supports_method(client, method, bufnr)
  if vim.fn.has 'nvim-0.11' == 1 then
    return client:supports_method(method, bufnr)
  else
    return client.supports_method(client, method, bufnr)
  end
end

--- Called when an LSP client attaches to a buffer.
--- Sets up buffer-local keymaps and autoformatting if supported.
---@param client vim.lsp.Client The LSP client that attached
---@param bufnr integer The buffer number the client attached to
function M.on_attach(client, bufnr)
  -- Set default options for keymaps
  map.set_default_opts({ buffer = bufnr })

  -- Get LSP keymap specifications
  local lsp_keymaps = meta.lsp

  -- Map keybindings
  map.set_keymaps(lsp_keymaps.definition, vim.lsp.buf.definition)
  map.set_keymaps(lsp_keymaps.declaration, vim.lsp.buf.declaration)
  map.set_keymaps(lsp_keymaps.type_definition, vim.lsp.buf.type_definition)
  map.set_keymaps(lsp_keymaps.implementation, vim.lsp.buf.implementation)
  map.set_keymaps(lsp_keymaps.references, vim.lsp.buf.references)
  map.set_keymaps(lsp_keymaps.document_symbols, vim.lsp.buf.document_symbol)
  map.set_keymaps(lsp_keymaps.workspace_symbols, vim.lsp.buf.workspace_symbol)
  map.set_keymaps(lsp_keymaps.workspace_diagnostics, vim.lsp.buf.workspace_diagnostics)
  map.set_keymaps(lsp_keymaps.incoming_calls, vim.lsp.buf.incoming_calls)
  map.set_keymaps(lsp_keymaps.outgoing_calls, vim.lsp.buf.outgoing_calls)
  map.set_keymaps(lsp_keymaps.hover, function() vim.lsp.buf.hover({ border = "single" }) end)
  map.set_keymaps(lsp_keymaps.code_action, vim.lsp.buf.code_action)
  map.set_keymaps(lsp_keymaps.format, vim.lsp.buf.format)
  map.set_keymaps(lsp_keymaps.rename, vim.lsp.buf.rename)

  -- Use trouble LSP features if it exists
  if pcall(require, "trouble") then
    map.set_keymaps(lsp_keymaps.definition, "<cmd>Trouble lsp_definitions<CR>")
    map.set_keymaps(lsp_keymaps.declaration, "<cmd>Trouble lsp_declarations<CR>")
    map.set_keymaps(lsp_keymaps.type_definition, "<cmd>Trouble lsp_type_definitions<CR>")
    map.set_keymaps(lsp_keymaps.references, "<cmd>Trouble lsp_references<CR>")
    map.set_keymaps(lsp_keymaps.document_symbols, "<cmd>Trouble symbols<CR>")
    map.set_keymaps(lsp_keymaps.document_diagnostics, "<cmd>Trouble diagnostics<CR>")
    map.set_keymaps(lsp_keymaps.incoming_calls, "<cmd>Trouble lsp_incoming_calls<CR>")
    map.set_keymaps(lsp_keymaps.outgoing_calls, "<cmd>Trouble lsp_outgoing_calls<CR>")
  end

  -- Check if this client supports formatting in this buffer
  local formatting_method = vim.lsp.protocol.Methods.textDocument_formatting
  if client and client_supports_method(client, formatting_method, bufnr) then
    -- Automatically format the buffer before saving
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end

  -- Reset default keymap options
  map.reset_default_opts()
end

-- Setup autocmd for LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      M.on_attach(client, ev.buf)
    end
  end,
})

-- Handle dynamic capability registration
vim.lsp.handlers["client/registerCapability"] =
    (function(orig)
      return function(err, res, ctx)
        local result = orig(err, res, ctx)
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if client then
          for bufnr in pairs(client.attached_buffers) do
            M.on_attach(client, bufnr)
          end
        end
        return result
      end
    end)(vim.lsp.handlers["client/registerCapability"])

return M
