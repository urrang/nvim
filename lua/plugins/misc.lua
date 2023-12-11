return {
	{ 'folke/which-key.nvim', opts = {} },
	{ 'folke/persistence.nvim', opts = {} },
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
			open_mapping = '<F10>',
			direction = 'float',
			float_opts = {
				border = 'rounded',
			},
		},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		main = "ibl",
		opts = {
			indent = {
				char = '▏',
			},
			-- show_trailing_blankline_indent = false,
			-- show_first_indent_level = false,
			-- use_treesitter = true,
			-- show_current_context = false,
			scope = {
				enabled = false
			},
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
