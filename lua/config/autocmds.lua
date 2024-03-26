vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
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
	end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
	callback = function(event)
		-- Highlight references of the word under cursor
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end

		-- Show diagnostics under cursor
		vim.api.nvim_create_autocmd('CursorHold', {
			desc = 'Show diagnostics on CursorHold',
			callback = function()
				local opts = {
					focusable = false,
					close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
					border = 'rounded',
					scope = 'cursor',
				}
				vim.diagnostic.open_float(nil, opts)
			end,
		})
	end,
})
