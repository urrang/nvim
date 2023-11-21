return {
	'folke/trouble.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<leader>x', '<cmd>TroubleToggle<cr>', 'Toggle trouble.nvim' },
		{ '<leader>dl', '<cmd>TroubleToggle document_diagnostics<cr>', 'Show problems' },
		{ '<leader>x', '<cmd>TroubleToggle<cr>', 'Toggle trouble.nvim'},
		{ 'gr', '<cmd>TroubleToggle lsp_references<cr>', 'LSP References' },
	},
	cmd = 'Trouble',
	opts = {
		position = 'left',
		auto_close = true,
		-- height = 15,

		-- group = false,
		indent_lines = false,
	},
}

