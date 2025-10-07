-- lua/plugins/nvim-treesitter.lua
--
-- The goal of nvim-treesitter is both to provide a simple and easy way to use
-- the interface for tree-sitter in Neovim and to provide some basic
-- functionality such as highlighting based on it.

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "c", "cpp", "html", "css", "doxygen", "python", "typescript",
        "javascript", "bash", "json", "yaml", "toml", "vim", "vimdoc", "query",
        "markdown", "markdown_inline"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
    })
  end,
}
