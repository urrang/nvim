local map = vim.keymap.set

-- Clear search highlight on escape
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Stay at word under cursor when using *
map('n', '*', '*N', { noremap = true, silent = true })

-- Select whole file with C-a
map('n', '<C-a>', 'ggVG')

-- Save/save all with Ctrl + s/S
map('n', '<C-s>', ':up<cr>')
map('i', '<C-s>', '<esc>:up<cr>')

-- Change word under cursor with enter
map('n', '<CR>', '"dciw')

-- Move with Ctrl + arrow keys in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Use register d for deleted text to avoid overriding
-- system clipboard. Paste with leader + p
local keys = { 'd', 'D', 'c', 'C', 'x', 'X' }
for _, key in ipairs(keys) do
	map({  'n', 'v' }, key, '"d' .. key, { noremap = true })
end

map('n', '<leader>p', '"dp', { desc = 'Paste deleted text' })
map('n', '<leader>P', '"dP', { desc = 'Paste deleted text' })

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

map('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' });

-- Jump between lsp diagnostics
map('n', '[e', function() vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } }) end)
map('n', ']e', function() vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } }) end)

