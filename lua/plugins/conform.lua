return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local conform = require('conform');

		conform.setup({
			formatters_by_ft = {
				lua = { 'stylua' },
				javascript = { 'prettier' },
				typescript = { 'prettier' },
				javascriptreact = { 'prettier' },
				typescriptreact = { 'prettier' },
				svelte = { 'prettier' },
				html = { 'prettier' },
				css = { 'prettier' },
				json = { 'prettier' },
				markdown = { 'prettier' },
			}
		})

		vim.keymap.set(
			{ 'n', 'v' },
			'<leader>fo',
			function() conform.format({ lsp_fallback = true }) end,
			{ desc = 'Format file' }
		)
	end
}
