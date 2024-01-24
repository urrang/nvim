return {
	'echasnovski/mini.nvim',
	version = false,
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('mini.move').setup()
		require('mini.bufremove').setup()

		-- require('mini.surround').setup({
		-- 	mappings = {
		-- 		add = '<leader>sa', -- Add surrounding in Normal and Visual modes
		-- 		delete = '<leader>sd', -- Delete surrounding
		-- 		find = '', -- Find surrounding (to the right)
		-- 		find_left = '', -- Find surrounding (to the left)
		-- 		highlight = '', -- Highlight surrounding
		-- 		replace = '<leader>sr', -- Replace surrounding
		-- 		update_n_lines = '', -- Update `n_lines`
		-- 	},
		-- })
	end,
	keys = {
		{
			'<leader>bc',
			function()
				local bd = require('mini.bufremove').delete
				if vim.bo.modified then
					local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
					if choice == 1 then
						vim.cmd.write()
						bd(0)
					elseif choice == 2 then
						bd(0, true)
					end
				else
					bd(0)
				end
			end,
			desc = 'Close buffer'
		},
	},
}
