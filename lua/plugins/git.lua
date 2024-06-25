return {
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
            signcolumn = false,
		},
		keys = {
			{ '<leader>gB', '<cmd>Gitsigns blame_line<cr>', 'Git blame' }
		}
	},
	-- {
	-- 	'sindrets/diffview.nvim',
	-- 	event = 'VeryLazy',
	-- 	opts = {},
	-- },
	{
		'NeogitOrg/neogit',
        commit = 'b93316d15c590377f50ca61e70e9129e4aa9b848',
		dependencies = 'nvim-lua/plenary.nvim',
		opts = {
            -- mappings = {
            --     status = {
            --         -- Rebind untrack so it stops stealing my K keymap
            --         -- https://github.com/NeogitOrg/neogit/issues/1314
            --         ['K'] = false,
            --         -- ['<C-Z>'] = 'Untrack',
            --     }
            -- }
        },
		keys = {
			{ '<leader>gg', '<cmd>Neogit<cr>', 'Neogit' },
		}
	}
}
