-- Disable search highlighting
vim.o.hlsearch = false

-- Set current line to actual number, all others are relative
vim.o.number = true
vim.o.relativenumber = true

-- Always enable mouse :)
vim.o.mouse = 'a'

-- Sync OS and Neovim clipboards.
vim.o.clipboard = 'unnamedplus'

-- Tab stuff
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- Save undo history to file
vim.o.undofile = true

-- Case-insentive searching unless \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable signcolumn, a.k.a. the gutter where you can put e.g. a debug icon
vim.wo.signcolumn = 'yes'

-- Shows auto-complete options even if only 1 item
-- Doesn't auto-select a suggestion
vim.o.completeopt = 'menuone,noselect'

-- Fancy 24-bit colors
vim.o.termguicolors = true

