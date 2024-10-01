local utils = require('utils')
local map = vim.keymap.set

map({ 'n', 'v' }, '<leader>go', utils.open_in_github)

-- Clear search highlight on escape
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Stay at word under cursor when using *
map('n', '*', '*N', { noremap = true, silent = true })

-- Select all content in buffer
map('n', '<C-a>', 'ggVG')

-- Selected text that was just pasted
map('n', 'gp', '`[V`]')

-- Save with ctrl + s
map('n', '<C-s>', ':silent up<cr>', { silent = true })
map('i', '<C-s>', '<esc>:silent up<cr>', { silent = true })

-- Move with Ctrl + arrow keys in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Put deleted content from x/X into black hole register
map('n', 'x', '"_x', { noremap = true })
map('n', 'X', '"_X', { noremap = true })

-- Put deleted content from c/d into register d instead of overriding system clipboard
map({ 'n', 'v' }, 'd', '"dd', { noremap = true })
map({ 'n', 'v' }, 'D', '"dD', { noremap = true })
map({ 'n', 'v' }, 'c', '"dc', { noremap = true })
map({ 'n', 'v' }, 'C', '"dC', { noremap = true })

-- Paste from the d register with leader + p
map('n', '<leader>p', '"dp', { desc = 'Paste deleted text' })
map('n', '<leader>P', '"dP', { desc = 'Paste deleted text' })

-- Change word under cursor with enter (use black hole register for deleted content)
map('n', '<CR>', '"_ciw')

-- Don't override clipboard when pasing in visual mode
map('v', 'p', '"_dP')

-- Show highlight group, for theme overriding
map('n', '<leader>cg', '<cmd>Inspect<cr>')

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Center when moving half a page down/up
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map({ 'n', 'v' }, 'H', '^')
map({ 'n', 'v' }, 'L', '$')
map({ 'n', 'v' }, 'J', '5j')
map({ 'n', 'v' }, 'K', '5k')
map({ 'n', 'v' }, '<C-j>', 'J', { noremap = true })

-- Tab moves indent
map('v', '<Tab>', '>gv', { silent = true })
map('v', '<S-Tab>', '<gv', { silent = true })
map('n', '<Tab>', '>>', { silent = true })
map('n', '<S-Tab>', '<<', { silent = true })

-- Allow jumplist keymap to function with the tab binds above
map('n', '<C-i>', '<C-i>', { noremap = true })

-- Window focus
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Cycle buffers
map('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })

map('n', '<leader>tt', '<cmd>tabNext<CR>', { desc = 'Cycle tabs' })
map('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close tab' })

-- Resize windows using shift + arrow keys
map('n', '<S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

map('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })

-- Jump between lsp diagnostics
map('n', '[e', function()
    vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
end)
map('n', ']e', function()
    vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
end)
