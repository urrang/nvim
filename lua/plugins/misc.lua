return {
	{ 'folke/which-key.nvim',         event = 'VeryLazy', opts = {} },
	{ 'folke/persistence.nvim',       opts = {} },
	{ 'max397574/better-escape.nvim', opts = {} },
	-- { 'tenxsoydev/karen-yank.nvim',   config = true },
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		'tpope/vim-surround',
		setup = function()
			require('vim-fugitive').setup({})
		end,
	},
	{
		'AckslD/nvim-neoclip.lua',
		requires = {
			{ 'nvim-telescope/telescope.nvim' },
		},
		event = 'VeryLazy',
		keys = {
			{ '<leader>cb', '<cmd>Telescope neoclip<cr>', desc = 'Clipboard history' },
		},
		config = function()
			require('neoclip').setup({
				default_register = '+',
				keys = {
					telescope = {
						i = {
							select = '<c-c>',
							paste_behind = '<cr>',
						},
						n = {
							select = '<c-c>',
							paste_behind = '<cr>',
						},
					},
				},
			})

			require('telescope').load_extension('neoclip')
		end,
	},

	{
		'windwp/nvim-ts-autotag',
		dependencies = 'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-ts-autotag').setup({
				filetypes = {
					'html',
					'javascript',
					'typescript',
					'javascriptreact',
					'typescriptreact',
					'svelte',
					'vue',
					'tsx',
					'jsx',
					'rescript',
					'xml',
					'markdown',
				},
				skip_tags = {
					'area',
					'base',
					'br',
					'col',
					'command',
					'embed',
					'hr',
					'img',
					'slot',
					'input',
					'keygen',
					'link',
					'meta',
					'param',
					'source',
					'track',
					'wbr',
					'menuitem',
				},
			})
		end,
		lazy = true,
		event = 'VeryLazy',
	},
	{
		'numToStr/Comment.nvim',
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		config = function()
			require('Comment').setup({
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
			})
		end,
	},
	{
		'petertriho/nvim-scrollbar',
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
	{
		'akinsho/toggleterm.nvim',
		opts = {
			open_mapping = '<c-t>',
			direction = 'vertical',
			size = 50,
			float_opts = {
				border = 'rounded',
			},
		},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
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
				}
			}
		},
	},
}
