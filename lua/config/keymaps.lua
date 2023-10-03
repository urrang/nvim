-- See `:help vim.keymap.set()`

local map = vim.keymap.set

-- Clear search highlight on escape
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Stay at word under cursor when using *
map('n', '*', '*N', { noremap = true, silent = true })

-- Save/save all with Ctrl + s/S
map({ 'n', 'i' }, '<C-s>', '<cmd>w<cr>', { silent = true })

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

-- Intend on paste
-- map('n', 'p', ']p')

-- Show highlight group, for theme overriding
map('n', '<leader>cg', '<cmd>TSHighlightCapturesUnderCursor<cr>')

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

map('n', '<leader>tv', function()
	local result = vim.treesitter.get_captures_at_cursor(0)
	print(vim.inspect(result))
end, { noremap = true, silent = false })

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

-- Ctrl+V for pasting from system clipboard
-- map("i", "<c-v>", "<c-r>+", opts)

-- Diagnostic keymaps
map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Tab moves indent
map('v', '<Tab>', '>gv', { silent = true })
map('v', '<S-Tab>', '<gv', { silent = true })
-- map('i', '<S-Tab>', '<C-d>', { silent = true })
map('n', '<Tab>', '>>', { silent = true })
map('n', '<S-Tab>', '<<', { silent = true })

-- Window/buffer/tab stuff
map('n', '<leader>ws', '<cmd>vsplit<CR>', { desc = 'Split window' })
map('n', '<leader>wc', '<C-w>c', { desc = 'Close window' })
map('n', '<leader>w1', '<C-w>h', { desc = 'Focus left window' })
map('n', '<leader>w2', '<C-w>l', { desc = 'Focus right window' })
map('n', '<leader>ww', '<C-w>w', { desc = 'Cycle between windows' })

map('n', '<leader>bc', '<cmd>bd<CR>', { desc = 'Close buffer' })
map('n', '<leader>bb', '<cmd>bnext<CR>', { desc = 'Cycle buffers' })
map('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })

map('n', '<leader>tt', '<cmd>tabNext<CR>', { desc = 'Cycle tabs' })
map('n', '<leader>tc', '<cmd>tabclose<CR>', { desc = 'Close tab' })

-- Resize windows using shift + arrow keys
map('n', '<S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
