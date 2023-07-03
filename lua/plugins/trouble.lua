return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>x', '<cmd>TroubleToggle document_diagnostics<cr>', 'Show problems' },
	},
	opts = {
		auto_close = true,
		height = 15,
		group = false,
		indent_lines = false,
	},
}

