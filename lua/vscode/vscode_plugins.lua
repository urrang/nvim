return {
	{
		'tpope/vim-surround',
		setup = function()
			require('vim-fugitive').setup({})
		end,
	},
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {
			highlight = {
				backdrop = false
			},
			modes = {
				search = {
					enabled = false,
				},
				char = {
					highlight = { backdrop = false }
				}
			},
		},
		keys = {
			{
				's',
				mode = { 'n', 'x', 'v', 'o' },
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
		},
	},
}
