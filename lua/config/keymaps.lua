local utils = require('utils')
local map = vim.keymap.set

map('n', '<leader>so', ':source %<cr>', { desc = 'Source current file' })

map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Switch from terminal mode to normal mode' })

map('n', '<C-f>', ':%s/')

-- Clear search highlight on escape
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Stay at word under cursor when using *
map('n', '*', '*N', { noremap = true, silent = true })

-- Select all content in buffer
map('n', '<C-a>', 'ggVG')

map('n', '<C-n>', function()
    vim.api.nvim_command('enew')
    require('telescope.builtin').filetypes()
end, { desc = 'New empty buffer' })

-- Selected text that was just pasted
map('n', 'gp', '`[V`]')

-- Comment below/above current line
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- Save with ctrl + s
map('n', '<C-s>', ':silent up<cr>', { silent = true })
map('i', '<C-s>', '<esc>:silent up<cr>', { silent = true })
map('v', '<C-s>', '<esc>:silent up<cr>gv', { silent = true })

-- Move with Ctrl + arrow keys in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Paste over entire file
map('n', '<leader>pa', 'ggVG"_dP', { desc = 'Paste over entire file' })

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

map('n', '<leader>tn', '<cmd>tabnew<CR>', { desc = 'Cycle tabs' })
map('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close tab' })

-- Resize windows using shift + arrow keys
map('n', '<S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

map('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })

-- Bracket jumps
map('n', '[b', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
map('n', ']b', '<cmd>bnext<CR>', { desc = 'Next buffer' })

map('n', '[w', '<C-w><C-h>', { desc = 'Previous window' })
map('n', ']w', '<C-w><C-l>', { desc = 'Next window' })

map('n', '[t', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })
map('n', ']t', '<cmd>tabnext<cr>', { desc = 'Next tab' })

map('n', '[q', '<cmd>cprev<cr>', { desc = 'Previous quickfix entry', silent = true })
map('n', ']q', '<cmd>cnext<cr>', { desc = 'Next quickfix entry', silent = true })

map('n', '[e', function()
    vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } })
end, { desc = 'Previous diagnostic' })

map('n', ']e', function()
    vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } })
end, { desc = 'Next diagnostic' })

-- Open selection in github
map({ 'n', 'v' }, '<leader>goo', function()
    utils.open_in_github(false)
end)

-- Open blame view on selection in github
map({ 'n', 'v' }, '<leader>gob', function()
    utils.open_in_github(true)
end)
