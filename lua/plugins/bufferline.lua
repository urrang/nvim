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
					text = 'File explorer',
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
		},
		highlights = {
			buffer_selected = {
				italic = false,
				bold = false,
			},
			diagnostic_selected = {
				italic = false,
				bold = false,
			},
			hint_selected = {
				italic = false,
				bold = false,
			},
		},
	},
}
