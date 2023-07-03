return {
	{
		'tpope/vim-fugitive',
		event = 'VeryLazy',
		setup = function()
			require('vim-fugitive').setup({})
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{
		'sindrets/diffview.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	-- 'tpope/vim-rhubarb',
}
