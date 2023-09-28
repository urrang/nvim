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

require('lazy').setup({
	{ 'tenxsoydev/karen-yank.nvim', config = true },
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {
			modes = {
				search = {
					enabled = false,
				},
			},
		},
		keys = {
			{
				's',
				mode = { 'n', 'x', 'o' },
				function()
					require('flash').jump()
				end,
				desc = 'Flash',
			},
			{
				'S',
				mode = { 'n', 'o', 'x' },
				function()
					require('flash').treesitter()
				end,
				desc = 'Flash Treesitter',
			},
			{
				'r',
				mode = 'o',
				function()
					require('flash').remote()
				end,
				desc = 'Remote Flash',
			},
			{
				'R',
				mode = { 'o', 'x' },
				function()
					require('flash').treesitter_search()
				end,
				desc = 'Flash Treesitter Search',
			},
			{
				'<c-s>',
				mode = { 'c' },
				function()
					require('flash').toggle()
				end,
				desc = 'Toggle Flash Search',
			},
		},
	},
})

-- Keymaps
local map = vim.keymap.set

map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Stay at word under cursor when using *
map('n', '*', '*N', { noremap = true, silent = true })

-- Move with Ctrl + arrow keys in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

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
-- map('i', '<S-Tab>', '<C-d>', { silent = true })
map('n', '<Tab>', '>>', { silent = true })
map('n', '<S-Tab>', '<<', { silent = true })

-- Autocmd
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
