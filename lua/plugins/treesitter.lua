return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/playground',
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
		opts = {
			highlight = { enable = true },
			indent = { enable = true },

			-- REVISIT: from LazyVim, figure out what it does and if we want it
			-- context_commentstring = { enable = true, enable_autocmd = false },

			ensure_installed = {
				'typescript',
				'javascript',
				'tsx',
				'html',
				'css',
				'json',
				'markdown',
				'markdown_inline',
				'go',
				'python',
				'rust',
				'lua',
				'vimdoc',
				'vim',
				'svelte',
			},

			context_commentstring = {
				enable = true,
			},

			autotag = {
				enable = true,
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
					'css',
					'lua',
					'xml',
					'php',
					'markdown',
				},
			},

			-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
			auto_install = false,

			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = 'v',
					node_incremental = 'v',
					node_decremental = 'V',
					scope_incremental = '<c-s>',

					-- init_selection = '<c-space>',
					-- node_incremental = '<c-space>',
					-- scope_incremental = '<c-s>',
					-- node_decremental = '<M-space>',
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						['aa'] = '@parameter.outer',
						['ia'] = '@parameter.inner',
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
					},
				},
				swap = {
					enable = true,
					swap_next = {
						['<leader>a'] = '@parameter.inner',
					},
					swap_previous = {
						['<leader>A'] = '@parameter.inner',
					},
				},
			},
		},

		---@param opts TSConfig
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
		end,
	},
}
