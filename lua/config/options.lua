-- See `:help vim.o`
vim.wo.wrap = false

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.tabstop = 4

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- local lsp = vim.lsp
-- lsp.handlers['textDocument/hover'] = lsp.with(
--   lsp.handlers.hover,
--   { border = 'rounded', max_width = max_width, max_height = max_height }
-- )

-- lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
--   border = 'rounded',
--   max_width = max_width,
--   max_height = max_height,
-- })