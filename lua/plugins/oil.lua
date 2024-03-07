-- https://github.com/stevearc/oil.nvim/issues/269
return {
	'stevearc/oil.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
		{ '<C-b>', '<Cmd>Oil<CR>', desc = 'Show file explorer' },
	},
	opts = {
		view_options = { show_hidden = true },
		delete_to_trash = true,
		-- skip_confirm_for_simple_edits = true,
		lsp_file_methods = { autosave_changes = true },
		use_default_keymaps = false,
		keymaps = {
			['?'] = 'actions.show_help',
			['<CR>'] = 'actions.select',
			['<C-p>'] = 'actions.preview',
			['_'] = 'actions.open_cwd',
			['gt'] = 'actions.toggle_trash',
			['<BS>'] = 'actions.parent',
			['q'] = 'actions.close',
			['<C-b>'] = 'actions.close',
			['<Esc>'] = 'actions.close',
		}
	},
}
