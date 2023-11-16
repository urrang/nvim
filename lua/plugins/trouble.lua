return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>x', '<cmd>TroubleToggle<cr>', 'Toggle trouble.nvim' },
		{ '<leader>dl', '<cmd>TroubleToggle document_diagnostics<cr>', 'Show problems' },
	},
	cmd = 'Trouble',
	opts = {
		auto_close = true,
		height = 15,
		-- group = false,
		indent_lines = false,
	},
}

