local last_open_view = nil

return {
	'folke/trouble.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	keys = {
        -- TODO: how to get the old TroubleToggle (toggle last used view) on <leader>x?
		-- { '<leader>x', '<cmd>Trouble lsp_references toggle auto_refresh=false focus=true<cr>', 'Toggle trouble.nvim' },
		{ '<leader>xx', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', 'Buffer diagnostics (Trouble)' },
		{ '<leader>xX', '<cmd>Trouble diagnostics toggle<cr>', 'Diagnostics (Trouble)' },
		{ 'gr', '<cmd>Trouble lsp_references toggle auto_refresh=false focus=true<cr>', 'LSP References (Trouble)' },
	},
	cmd = 'Trouble',
	opts = {
		-- win = { position = 'left' },
		auto_close = true,
		-- height = 15,

		-- group = false,
		indent_lines = false,
        win = {
            position = 'left'
        }
	},
}

