local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight on yank',
	callback = function() vim.highlight.on_yank() end,
	group = highlight_group,
	pattern = '*',
})

vim.api.nvim_create_autocmd('BufWinEnter', {
	desc = 'Return cursor to where it was last time closing the file',
	pattern = '*',
	command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd('BufRead', {
	desc = 'Start treesitter parser for angular on html files in angular project',
	pattern = '*.html',
	callback = function()
		if vim.fn.findfile('angular.json', '.;') ~= '' then
			vim.treesitter.start(nil, 'angular')
		end
	end
})

vim.api.nvim_create_autocmd('CursorHold', {
	desc = 'Show diagnostics on CursorHold',
	callback = function()
		local opts = {
			focusable = false,
			close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
			border = 'rounded',
			-- source = 'always',
			-- prefix = ' ',
			scope = 'cursor',
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- vim.api.nvim_create_autocmd('BufWinEnter', {
-- 	pattern = '*',
-- 	callback = function(event)
-- 		if vim.bo[event.buf].filetype == 'help' then
-- 			vim.cmd.only()
-- 		end
-- 	end,
-- })
