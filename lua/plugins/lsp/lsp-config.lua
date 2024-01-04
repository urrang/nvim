local M = {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

M.servers = {
	-- gopls = {},
	-- rust_analyzer = {},

	-- Any useful opts we should pass?
	tsserver = {},
	jsonls = {},
	cssls = {},
	html = {},
	svelte = {},
	angularls = {},
	emmet_language_server = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { globals = { 'vim' } },
		},
	},
}

M.on_attach = function(client, bufnr)
	-- Update Svelte language server when js/ts file changes
	-- https://github.com/neovim/nvim-lspconfig/issues/725
	-- https://github.com/sveltejs/language-tools/issues/2008
	vim.api.nvim_create_autocmd('BufWritePost', {
		pattern = { '*.js', '*.ts' },
		callback = function(ctx)
			if client.name == 'svelte' then
				client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
			end
		end,
	})

	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
	nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')
	nmap('<leader>gp', '<cmd>Lspsaga peek_definition<cr>', 'Peek Definition')
	nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
	-- nmap('gr', vim.lsp.buf.references, 'Find all references')
	nmap('gh', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
end

return M
