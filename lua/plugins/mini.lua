return {
	'echasnovski/mini.nvim',
	version = false,
	config = function()
		require('mini.comment').setup()
		require('mini.move').setup()
		require('mini.surround').setup({
			mappings = {
				add = '<leader>sa', -- Add surrounding in Normal and Visual modes
				delete = '<leader>sd', -- Delete surrounding
				find = '', -- Find surrounding (to the right)
				find_left = '', -- Find surrounding (to the left)
				highlight = '', -- Highlight surrounding
				replace = '<leader>sr', -- Replace surrounding
				update_n_lines = '', -- Update `n_lines`
			}
		})
	end
}
