return {
	'j-morano/buffer_manager.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	keys = {
		{
			'<leader><space>',
			':lua require("buffer_manager.ui").toggle_quick_menu()<cr>',
			'Show open buffers',
		},
	},
}
