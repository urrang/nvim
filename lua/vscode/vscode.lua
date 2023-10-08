
-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true

-- Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = require('vscode/vscode_plugins')
require('lazy').setup(plugins)

-- Keymaps
local map = vim.keymap.set
local vscode_cmd = function(cmd)
	return '<Cmd>call VSCodeCall("' .. cmd .. '")<CR>'
end

-- Clear search highlight on escape
map('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })

-- Change word with enter
map('n', '<CR>', 'ciw')

-- Stay at word under cursor when usig *
map('n', '*', '*N', { noremap = true, silent = true })

-- Move with Ctrl + arrow keys in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Tab moves indent
map('v', '<Tab>', '>gv', { silent = true })
map('v', '<S-Tab>', '<gv', { silent = true })
map('n', '<Tab>', '>>', { silent = true })
map('n', '<S-Tab>', '<<', { silent = true })

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

-- Use register d for deleted text to avoid overriding system clipboard
local keys = { 'd', 'D', 'c', 'C', 'x', 'X' }
for _, key in ipairs(keys) do
	map({  'n', 'v' }, key, '"d' .. key, { noremap = true })
end

-- Paste from register d (deleted text)
map('n', '<leader>p', '"dp', { desc = 'Paste deleted text' })
map('n', '<leader>P', '"dP', { desc = 'Paste deleted text' })

-- Console log variable under cursor
map('n', '<leader>cl', "yiwoconsole.log('<Esc>pa', <Esc>pa);<Esc>", { desc = 'Log variable under cursor'})

-- VS Code commands
for i = 1, 9 do
	map('n', '<leader>' .. i, vscode_cmd('workbench.action.openEditorAtIndex' .. i))
end

map('n', '<leader>G', vscode_cmd('workbench.scm.focus'))
map('n', '<leader>E', vscode_cmd('workbench.files.action.focusFilesExplorer'))
map('n', '<leader>A', vscode_cmd('workbench.action.toggleActivityBarVisibility'))

map('n', '<leader>x', vscode_cmd('editor.action.marker.next'), { desc = 'Go to next error' })
map('n', '<leader>X', vscode_cmd('editor.action.marker.prev'), { desc = 'Go to previous error' })

map('n', 'gh', vscode_cmd('editor.action.showHover'))
map('n', 'gr', vscode_cmd('references-view.findReferences'));
map('n', 'gd', vscode_cmd('editor.action.revealDefinition'));

map({ 'n', 'v' }, '<A-j>', vscode_cmd('editor.action.moveLinesDownAction'))
map({ 'n', 'v' }, '<A-j>', vscode_cmd('editor.action.moveLinesDownAction'))

-- Autocmd
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
