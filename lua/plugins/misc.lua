return {
	-- Detect tabstop and shiftwidth automatically
	-- 'tpope/vim-sleuth',

	{ 'folke/which-key.nvim',         opts = {} },
	{ 'folke/persistence.nvim',       opts = {} },
	{ 'tenxsoydev/karen-yank.nvim',   config = true },
	{ 'max397574/better-escape.nvim', opts = {} },
	-- { 'nmac427/guess-indent.nvim',    opts = {} },
	{
		'nvim-pack/nvim-spectre',
		dependencies = { 'nvim-lua/plenary.nvim' },
		event = 'VeryLazy',
		opts = {},
	},

	-- Currently using noice because of some input lag with this one. See:
	-- https://github.com/ray-x/lsp_signature.nvim/issues/276
	-- https://github.com/hrsh7th/nvim-cmp/issues/1613
	-- { 'ray-x/lsp_signature.nvim', config = true },

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
		'mg979/vim-visual-multi',
		event = 'VeryLazy',
	},

	{
		'petertriho/nvim-scrollbar',
		opts = {
			handle = {
				text = ' ',
				blend = 0,      -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
				color = '#737994',
				color_nr = nil, -- cterm
				highlight = 'CursorColumn',
				hide_if_all_visible = true, -- Hides handle if all lines are visible
			},
		},
	},
	{
		'akinsho/toggleterm.nvim',
		opts = {
			direction = 'float',
			open_mapping = [[<leader>tt]],
			float_opts = {
				border = 'rounded'
			}
		}
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			char = '▏',
			show_trailing_blankline_indent = false,
			show_first_indent_level = false,
			use_treesitter = true,
			show_current_context = false,
			filetype_exclude = {
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
	{
		'smolck/command-completion.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'ThePrimeagen/vim-be-good',
		event = 'VeryLazy',
	},
}
