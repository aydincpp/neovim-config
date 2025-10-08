-- lua/core/keymaps_meta.lua
--
-- Keymaps Metadata
-- This file defines the metadata for all keymaps in the configuration.
-- Each keymap action is organized by feature/group (e.g., General, Editing, Files, Windows, Buffers/Tabs).
-- Spec:
--   action_name = {
--     group = "Feature group for which-key or organization",
--     mode  = "default mode for this action ('n', 'v', 'i', etc.) or a table of modes if the action works in multiple modes",
--     keys  = {
--       { lhs = "key sequence", desc = "Description shown in docs or which-key" },
--       { lhs = "alternative key", desc = "Optional alternative for same action" },
--     }
--   }
--
-- Notes:
-- - The 'keys' array allows multiple key sequences for a single action.
-- - The 'desc' field should describe what the key does (used for which-key or documentation).
-- - This file does not define the actual actions (rhs); those are implemented in plugin configs or lua/core/keymaps.lua.

local M = {}

-- General Editing Keymaps
M.general = {
  clear_search = {
    group = "General",
    mode = "n",
    keys = { { lhs = "<Esc>", desc = "Clear Search Highlights" } },
  },
  save_reload_config = {
    group = "General",
    mode = "n",
    keys = { { lhs = "<leader>`", desc = "Save And Reload Config" } },
  },
  line_start = {
    group = "General",
    mode = "n",
    keys = { { lhs = "H", desc = "Jump To Line Start" } },
  },
  line_end = {
    group = "General",
    mode = "n",
    keys = { { lhs = "L", desc = "Jump To Line End" } },
  },
  next_search = {
    group = "General",
    mode = "n",
    keys = { { lhs = "n", desc = "Next Search Centered" } },
  },
  prev_search = {
    group = "General",
    mode = "n",
    keys = { { lhs = "N", desc = "Previous Search Centered" } },
  },
  toggle_terminal = {
    group = "General",
    mode = { "n", "t" },
    keys = { { lhs = "<C-.>", desc = "Toggle Terminal" } },
  },
  exit_terminal = {
    group = "General",
    mode = "t",
    keys = { { lhs = "<Esc><Esc>", desc = "Exit Terminal Mode" } },
  },
}

-- Text Editing
M.editing = {
  indent_left = {
    group = "Editing",
    mode = "n",
    keys = { { lhs = "<", desc = "Indent Line Left" } },
  },
  indent_right = {
    group = "Editing",
    mode = "n",
    keys = { { lhs = ">", desc = "Indent Line Right" } },
  },
  indent_left_v = {
    group = "Editing",
    mode = "v",
    keys = { { lhs = "<", desc = "Indent Selection Left" } },
  },
  indent_right_v = {
    group = "Editing",
    mode = "v",
    keys = { { lhs = ">", desc = "Indent Selection Right" } },
  },
  paste_indent = {
    group = "Editing",
    mode = { "n", "x" },
    keys = { { lhs = "p", desc = "Paste & Auto Indent" } }
  },
}

-- File Operations
M.files = {
  save_buffer = {
    group = "Files",
    mode = "n",
    keys = {
      { lhs = "<leader>w", desc = "Save Buffer" },
      { lhs = "<C-s>",     desc = "Save Buffer" },
    },
  },
  save_all = {
    group = "Files",
    mode = "n",
    keys = {
      { lhs = "<leader>W", desc = "Save All Buffers" },
      { lhs = "<C-S-s>",   desc = "Save All Buffers" },
    },
  },
  save_quit_window = {
    group = "Files",
    mode = "n",
    keys = { { lhs = "<leader>x", desc = "Save And Quit Window" } }
  },
  save_quit_all = {
    group = "Files",
    mode = "n",
    keys = { { lhs = "<leader>X", desc = "Save And Quit All Windows" } },
  },
  quit_window = {
    group = "Files",
    mode = "n",
    keys = { { lhs = "<leader>q", desc = "Quit Window" }, },
  },
  quit_all = {
    group = "Files",
    mode = "n",
    keys = { { lhs = "<leader>Q", desc = "Quit All Windows" }, },
  },
  rename_file = {
    group = "Files",
    mode = "n",
    keys = { { lhs = "<leader>rf", desc = "Rename File" } },
  },
}

-- Window Management
M.windows = {
  split_horizontal = {
    group = "Windows",
    mode = "n",
    keys = { { lhs = "<leader>sh", desc = "Horizontal Split" } },
  },
  split_vertical = {
    group = "Windows",
    mode = "n",
    keys = { { lhs = "<leader>sv", desc = "Vertical Split" } },
  },
  move_left = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-h>",    desc = "Move To Left Window" },
      { lhs = "<C-Left>", desc = "Move To Left Window" }
    },
  },
  move_right = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-l>",     desc = "Move To Right Window" },
      { lhs = "<C-Right>", desc = "Move To Right Window" }
    },
  },
  move_down = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-j>",    desc = "Move To Lower Window" },
      { lhs = "<C-Down>", desc = "Move To Lower Window" },
    },
  },
  move_up = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-k>",  desc = "Move To Upper Window" },
      { lhs = "<C-Up>", desc = "Move To Upper Window" }
    },
  },
  resize_narrower = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-S-h>",    desc = "Resize Window Narrower" },
      { lhs = "<C-S-Left>", desc = "Resize Window Narrower" },
    },
  },
  resize_wider = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-S-l>",     desc = "Resize Window Wider" },
      { lhs = "<C-S-Right>", desc = "Resize Window Wider" },
    },
  },
  resize_shorter = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-S-j>",    desc = "Resize Window Shorter" },
      { lhs = "<C-S-Down>", desc = "Resize Window Shorter" },
    },
  },
  resize_taller = {
    group = "Windows",
    mode = "n",
    keys = {
      { lhs = "<C-S-k>",  desc = "Resize Window Taller" },
      { lhs = "<C-S-Up>", desc = "Resize Window Taller" },
    },
  },
}

-- Buffers & Tabs
M.buffers_tabs = {
  next_buffer = {
    group = "Buffers",
    mode = "n",
    keys = {
      { lhs = "<leader>bn", desc = "Next Buffer" },
      { lhs = "<S-l>",      desc = "Next Buffer" },
    },
  },
  prev_buffer = {
    group = "Buffers",
    mode = "n",
    keys = {
      { lhs = "<leader>bp", desc = "Previous Buffer" },
      { lhs = "<S-h>",      desc = "Previous Buffer" },
    },
  },
  delete_buffer = {
    group = "Buffers",
    mode = "n",
    keys = { { lhs = "<leader>bd", desc = "Delete Buffer" } },
  },
  next_tab = {
    group = "Tabs",
    mode = "n",
    keys = {
      { lhs = "<leader>tn", desc = "Next Tab" },
      { lhs = "]t",         desc = "Next Tab" },
    },
  },
  prev_tab = {
    group = "Tabs",
    mode = "n",
    keys = {
      { lhs = "<leader>tp", desc = "Previous Tab" },
      { lhs = "[t",         desc = "Previous Tab" },
    },
  },
  new_tab = {
    group = "Tabs",
    mode = "n",
    keys = {
      { lhs = "<leader>te", desc = "New Tab" },
    },
  },
  close_tab = {
    group = "Tabs",
    mode = "n",
    keys = { { lhs = "<leader>tc", desc = "Close Tab" } },
  },
}

-- LSP keymaps
M.lsp = {
  definition = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "gd", desc = "LSP: Go To Definition" } }
  },
  declaration = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "gD", desc = "LSP: Go To Declaration" } }
  },
  implementation = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "gi", desc = "LSP: Go To Implementation" } }
  },
  type_definition = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "gy", desc = "LSP: Go To Type Definition" } }
  },
  references = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "gr", desc = "LSP: Go To References" } }
  },
  document_symbols = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>ls", desc = "LSP: Document Symbols" } }
  },
  workspace_symbols = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>lS", desc = "LSP: Workspace Symbols" } }
  },
  document_diagnostics = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>ld", desc = "LSP: Document Diagnostics" } }
  },
  workspace_diagnostics = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>lw", desc = "LSP: Workspace Diagnostics" } }
  },
  hover = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "K", desc = "LSP: Hover" } }
  },
  rename = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>rn", desc = "LSP: Rename Symbol" } }
  },
  code_action = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>ca", desc = "LSP: Code Action" } }
  },
  format = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>=", desc = "LSP: Format Buffer" } }
  },
  incoming_calls = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>ic", desc = "LSP: Incoming Calls" } }
  },
  outgoing_calls = {
    group = "LSP",
    mode = "n",
    keys = { { lhs = "<leader>oc", desc = "LSP: Outgoing Calls" } }
  },
}

-- NvimTree Plugin
M.nvim_tree = {
  toggle = {
    group = "NvimTree",
    mode = "n",
    keys = {
      { lhs = "<leader>e", desc = "Toggle NvimTree" },
      { lhs = "<C-S-e>",   desc = "Toggle NvimTree" },
    }
  }
}

-- FZF Plugin
M.fzf = {
  files = {
    group = "FZF",
    mode = "n",
    keys = {
      { lhs = "<leader>ff", desc = "FZF: Find Files" },
    },
  },
  live_grep = {
    group = "FZF",
    mode = "n",
    keys = {
      { lhs = "<leader>fg", desc = "FZF: Live Grep" },
    },
  },
  buffers = {
    group = "FZF",
    mode = "n",
    keys = {
      { lhs = "<leader>fb", desc = "FZF: Find Buffers" },
    },
  },
  help_tags = {
    group = "FZF",
    mode = "n",
    keys = {
      { lhs = "<leader>fh", desc = "FZF: Help Tags" },
    },
  },
  oldfiles = {
    group = "FZF",
    mode = "n",
    keys = {
      { lhs = "<leader>fo", desc = "FZF: Recent Files" },
    },
  },
}

return M
