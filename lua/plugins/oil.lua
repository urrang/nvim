-- https://github.com/stevearc/oil.nvim/issues/269
return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<C-b>', '<Cmd>Oil<CR>', desc = 'Show file explorer' },
	},
	opts = {
		keymaps = {
			['<BS>'] = 'actions.parent',
			['q'] = 'actions.close',
			['<C-b>'] = 'actions.close'
		}
	},
}
