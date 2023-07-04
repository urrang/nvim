-- https://neovimcraft.com/plugin/noib3/cokeline.nvim/index.html#nail_care-showoff-of-user-configs
return {
	'akinsho/bufferline.nvim',
	event = 'VeryLazy',
	keys = {
		{ '<leader>bp', '<Cmd>BufferLineTogglePin<CR>',            desc = 'Toggle pin' },
		{ '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
	},
	opts = {
		options = {
			diagnostics = 'nvim_lsp',
			-- always_show_bufferline = false,
			offsets = {
				{
					filetype = 'neo-tree',
					text = '',
					highlight = 'Directory',
					text_align = 'left',
				},
			},
			sort_by = 'insert_at_end',
			hover = {
				enabled = true,
				delay = 200,
				reveal = { 'close' },
			},
			numbers = function(opts)
				return opts.ordinal
			end,
		},
		highlights = {
			buffer_selected = {
				italic = false,
				bold = false,
			},
			numbers_selected = {
				italic = false,
				bold = false,
			},

			diagnostic_selected = {
				italic = false,
				bold = false,
			},

			hint_selected = {
				bold = false,
				italic = false,
			},
			hint_diagnostic_selected = {
				bold = false,
				italic = false,
			},

			info_selected = {
				bold = false,
				italic = false,
			},
			info_diagnostic_selected = {
				bold = false,
				italic = false,
			},

			warning_selected = {
				bold = false,
				italic = false,
			},
			warning_diagnostic_selected = {
				bold = false,
				italic = false,
			},

			error_selected = {
				bold = false,
				italic = false,
			},
			error_diagnostic_selected = {
				bold = false,
				italic = false,
			},
		},
	},
}
