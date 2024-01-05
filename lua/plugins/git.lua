return {
	-- {
	-- 	'tpope/vim-fugitive',
	-- 	event = 'VeryLazy',
	-- 	setup = function()
	-- 		require('vim-fugitive').setup({})
	-- 	end,
	-- },
	{
		'lewis6991/gitsigns.nvim',
		event = 'VeryLazy',
		opts = {
			signs = {
				add = { text = '▏' },
				change = { text = '▏' },
				delete = { text = '▏' },
				topdelete = { text = '▏' },
				changedelete = { text = '▏' },
			},
		},
		keys = {
			{ '<leader>gb', '<cmd>Gitsigns blame_line<cr>', 'Git blame' }
		}
	},
	-- {
	-- 	'sindrets/diffview.nvim',
	-- 	event = 'VeryLazy',
	-- 	opts = {},
	-- },
	{
		'NeogitOrg/neogit',
		dependencies = 'nvim-lua/plenary.nvim',
		opts = {},
		keys = {
			{ '<leader>gg', '<cmd>Neogit<cr>', 'Neogit' },
		}
	}
}
