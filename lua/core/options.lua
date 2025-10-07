-- lua/core/options.lua
--
-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Enable true color support
vim.opt.termguicolors = true

-- Indentation & Formatting
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.cindent = true
vim.o.textwidth = 100
vim.o.wrap = false

-- Buffer
vim.o.hidden = true
vim.o.swapfile = false
vim.o.undofile = true

-- Command Line
vim.o.inccommand = "split"
vim.o.confirm = true
vim.o.showmode = false

-- Completion
vim.o.completeopt = "menuone,noselect"
vim.o.pumheight = 10

-- Window Splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Timings
vim.o.timeoutlen = 300
vim.o.updatetime = 250

-- Line Number
vim.o.number = true
vim.o.relativenumber = true

-- Sign Column
vim.o.signcolumn = "yes"

-- Mouse
vim.o.mouse = ""

-- Scrolling
vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- UI
vim.o.cursorline = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.laststatus = 3
