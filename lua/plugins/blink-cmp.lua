-- lua/plugins/blink-cmp.lua
--
-- blink.cmp is a completion plugin with support for LSPs, cmdline, signature help, and snippets.
-- It uses an optional custom fuzzy matcher for typo resistance.
-- It provides extensibility via pluggable sources (LSP, buffer, snippets, etc),
-- component based rendering and dynamic configuration.

return {
  "saghen/blink.cmp",
  version = "1.*",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "default",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-u>"] = { function(cmp) cmp.scroll_documentation_up(2) end },
      ["<C-d>"] = { function(cmp) cmp.scroll_documentation_down(2) end }
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      list = { selection = { preselect = false, auto_insert = true } },
      menu = {
        border = "single",
        scrollbar = false,
        auto_show = true,
        draw = {
          treesitter = { "lsp" },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        treesitter_highlighting = true,
        window = {
          border = "single"
        }
      },
      ghost_text = {
        enabled = true,
        show_with_selection = true,
        show_without_selection = false,
        show_with_menu = true,
        show_without_menu = false
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      frecency = {
        enabled = true,
        path = vim.fn.stdpath('state') .. '/blink/cmp/frecency.dat',
      }
    },
    signature = {
      enabled = true,
      trigger = {
        enabled = true,
        show_on_insert = true,
      },
      window = {
        border = "single",
        treesitter_highlighting = true,
        show_documentation = false,
      }
    },
    cmdline = {
      enabled = true,
      keymap = { preset = 'cmdline' },
      sources = { 'buffer', 'cmdline' },
      completion = {
        menu = {
          auto_show = true
        }
      }
    },
    appearance = {
      highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
      nerd_font_variant = 'mono',
      kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Property = "󰜢",
        Class = "󰠱",
        Interface = "",
        Struct = "󰙅",
        Module = "",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        EnumMember = "",
        Keyword = "󰌋",
        Constant = "󰏿",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        Event = "",
        Operator = "󰆕",
        TypeParameter = '',
      }
    },
    sources = { default = { "lsp", "path", "buffer" }, },
  },
}
