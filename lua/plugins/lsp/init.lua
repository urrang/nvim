-- null ls https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/lsp_config.lua#L111
return {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'williamboman/mason.nvim',          config = true },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			local cfg = require('plugins.lsp.lsp-config')
			local mason_lspconfig = require('mason-lspconfig')
			local lspconfig = require('lspconfig')

			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(cfg.servers),
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = cfg.capabilities,
						on_attach = cfg.on_attach,
						settings = cfg.servers[server_name],
					})
				end,
			})
		end,
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = { 'williamboman/mason.nvim' },
		config = function()
			local null_ls = require('null-ls')
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
		keys = {
			{ '<leader>fo', vim.lsp.buf.format, desc = 'Format file' },
		},
	},
	{
		'glepnir/lspsaga.nvim',
		event = 'VeryLazy',
		dependencies = {
			{ 'catppuccin/nvim' },
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'nvim-treesitter/nvim-treesitter' },
		},
		opts = {
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = { enable = false },
			ui = {
				title = false,
				-- border = 'none',
			},
		},
	},
}
