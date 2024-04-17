return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
	config = function()
		local harpoon = require('harpoon')
		local extensions = require("harpoon.extensions")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			}
		})

		harpoon:extend(extensions.builtins.navigate_with_number());

		vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
		vim.keymap.set("n", "<C-Space>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		for num = 1, 9 do
			vim.keymap.set('n', '<leader>' .. num, function() harpoon:list():select(num) end)
		end
	end,
}
