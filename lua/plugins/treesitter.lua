vim.g.skip_ts_context_commentstring_module = true

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

			ensure_installed = {
				'typescript',
				'javascript',
				'tsx',
				'html',
				'css',
				'scss',
				'styled',
				'json',
				'markdown',
				'markdown_inline',
				'go',
				'rust',
				'lua',
				'vimdoc',
				'vim',
				'svelte',
				'angular'
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
					'css',
					'lua',
					'xml',
					'markdown',
				},
			},

			auto_install = false,

			incremental_selection = {
				enable = true,
				keymaps = {
					node_incremental = 'v',
					node_decremental = 'V',
					scope_incremental = '<c-s>',
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
		config = function(_, opts)
			require('nvim-treesitter.configs').setup(opts)
			require('ts_context_commentstring').setup({
				enable_autocmd = false
			})

		end,
	},
}
