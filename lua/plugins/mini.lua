return {
	'echasnovski/mini.nvim',
	version = false,
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require('mini.comment').setup()
		require('mini.move').setup()
		require('mini.surround').setup({
			mappings = {
				add = '<leader>sa', -- Add surrounding in Normal and Visual modes
				delete = '<leader>sd', -- Delete surrounding
				find = '',  -- Find surrounding (to the right)
				find_left = '', -- Find surrounding (to the left)
				highlight = '', -- Highlight surrounding
				replace = '<leader>sr', -- Replace surrounding
				update_n_lines = '', -- Update `n_lines`
			},
		})

		-- local indentscope = require('mini.indentscope')
		-- indentscope.setup({
		-- 	symbol = "│",
		-- 	options = { try_as_border = true },
		-- 	draw = {
		-- 		animation = indentscope.gen_animation.none()
		-- 	-- 	delay = 0
		-- 	}
		-- })
	end,
	-- init = function()
	-- 	vim.api.nvim_create_autocmd("FileType", {
	-- 		pattern = {
	-- 			  "help",
	-- 			  "alpha",
	-- 			  "dashboard",
	-- 			  "neo-tree",
	-- 			  "Trouble",
	-- 			  "lazy",
	-- 			  "mason",
	-- 			  "notify",
	-- 			  "toggleterm",
	-- 			  "lazyterm",
	-- 		},
	-- 		callback = function()
	-- 			vim.b.miniindentscope_disable = true
	-- 		end,
	-- 	})
	-- end,
}
