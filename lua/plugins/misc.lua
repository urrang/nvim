return {
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'folke/persistence.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'laytan/cloak.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = {},
	},
	{
		'max397574/better-escape.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'stevearc/dressing.nvim',
		event = 'VeryLazy',
		opts = {
			select = {
				backend = { 'builtin', 'telescope' }
			}
		},
	},
	{
		'Wansmer/treesj',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		event = 'VeryLazy',
		config = function()
			require('treesj').setup({})
			vim.keymap.set('n', '<leader>j', require('treesj').toggle)
		end,
	},
	{
		'numToStr/Comment.nvim',
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		event = 'VeryLazy',
		config = function()
			require('Comment').setup({
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
			})
		end,
	},
	{
		'petertriho/nvim-scrollbar',
		event = 'VeryLazy',
		opts = {
			handle = {
				text = ' ',
				blend = 50,
				color = '#737994',
				color_nr = nil,
				highlight = 'CursorColumn',
				hide_if_all_visible = true,
			},
		},
	},
	-- {
	-- 	'akinsho/toggleterm.nvim',
	-- 	opts = {
	-- 		open_mapping = '<c-t>',
	-- 		direction = 'vertical',
	-- 		size = 50,
	-- 		float_opts = {
	-- 			border = 'rounded',
	-- 		},
	-- 	},
	-- },
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'VeryLazy',
		main = 'ibl',
		opts = {
			indent = { char = '▏' },
			scope = { enabled = false },
			exclude = {
				filetypes = {
					'help',
					'alpha',
					'dashboard',
					'neo-tree',
					'Trouble',
					'lazy',
					'mason',
					'notify',
					'toggleterm',
					'lazyterm',
				},
			},
		},
	},
}
