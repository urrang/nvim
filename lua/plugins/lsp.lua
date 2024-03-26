local servers = {
	tsserver = {},
	jsonls = {},
	cssls = {},
	html = {},
	svelte = {},
	emmet_language_server = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = { globals = { 'vim' } },
		},
	},
}

local on_attach = function(client, bufnr)
	-- Update Svelte language server when js/ts file changes
	-- https://github.com/neovim/nvim-lspconfig/issues/725
	-- https://github.com/sveltejs/language-tools/issues/2008
	if client.name == 'svelte' then
		vim.api.nvim_create_autocmd('BufWritePost', {
			pattern = { '*.js', '*.ts' },
			callback = function(ctx)
				client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
			end,
			group = vim.api.nvim_create_augroup('svelte_ondidchangetsorjsfile', { clear = true }),
		})
	end

	local nmap = function(keys, func, desc)
		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
	nmap('<c-.>', vim.lsp.buf.code_action, 'Code action')
	nmap('<leader>gp', '<cmd>Lspsaga peek_definition<cr>', 'Peek Definition')
	nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
	nmap('gh', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
end

return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			-- {
			-- 	'ray-x/lsp_signature.nvim',
			-- 	event = 'VeryLazy',
			-- 	opts = { hint_enable = false },
			-- },
		},
		config = function()
			require('mason').setup()

			-- Extends default capabilities with completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

			require('mason-lspconfig').setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({
							capabilities = capabilities,
							on_attach = on_attach,
							settings = servers[server_name] or {}
						})
					end,
				},
			})
		end,
	},
	{
		'glepnir/lspsaga.nvim',
		event = 'LspAttach',
		dependencies = {
			{ 'catppuccin/nvim' },
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		opts = {
			symbol_in_winbar = { enable = false },
			lightbulb = { enable = false },
			ui = { title = false },
		},
	},
}
