-- See `:help vim.keymap.set()`

local map = vim.keymap.set

map('n', '<A-h>', '^')
map('n', '<A-l>', '$')

map('n', '<leader>cg', '<cmd>TSHighlightCapturesUnderCursor<cr>')

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

map("n", "<leader>tv",
    function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end,
    { noremap = true, silent = false }
)

-- Center when moving half a page down/up
map('n', "<C-d>", "<C-d>zz")
map('n', "<C-u>", "<C-u>zz")

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Move to start/end of line
map("n", "<C-h>", "^")
map("n", "<C-l>", "$")

-- quitting insert mode
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)
map("i", "jj", "<ESC>", opts)

-- Ctrl+V for pasting from system clipboard
-- map("i", "<c-v>", "<c-r>+", opts)

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Tab moves indent
map('v', '<Tab>', '>gv', { silent = true })
map('v', '<S-Tab>', '<gv', { silent = true })
map('i', '<S-Tab>', '<C-d>', { silent = true })
map('n', '<Tab>', '>>', { silent = true })
map('n', '<S-Tab>', '<<', { silent = true })


-- Window/buffer stuff
map('n', '<leader>ws', '<cmd>vsplit<CR>', { desc = 'Split window' })
map('n', '<leader>wc', '<C-w>c', { desc = 'Close window' })
map('n', '<leader>w1', '<C-w>h', { desc = 'Focus left window' })
map('n', '<leader>w2', '<C-w>l', { desc = 'Focus right window' })
map('n', '<leader>ww', '<C-w>w', { desc = 'Cycle between windows' })

map('n', '<leader>bc', '<cmd>bd<CR>', { desc = 'Close buffer' })
map('n', '<leader>bb', '<cmd>bnext<CR>', { desc = 'Cycle buffers' })
map('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })


-- Resize windows using shift + arrow keys
map("n", "<S-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<S-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
