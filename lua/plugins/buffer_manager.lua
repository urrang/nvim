local map = function(key, fn, desc)
	vim.keymap.set('n', '<leader>' .. key, fn, {desc = desc })
end

map('<space>', function() require('buffer_manager.ui').toggle_quick_menu() end, 'Show open buffers')

for i = 1, 9 do
	map(i, function() require('buffer_manager.ui').nav_file(i) end, 'Go to buffer ' .. i)
end

return {
	'j-morano/buffer_manager.nvim',
	event = 'VeryLazy',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {}
	-- setup = function ()
	-- 	require('buffer_manager').setup({})
	-- end,
}
