-- null ls https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/lsp_config.lua#L111
return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local cfg = require('plugins.lsp.lsp-config')
            local mason_lspconfig = require('mason-lspconfig')
			local lspconfig = require('lspconfig')

            mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(cfg.servers)
			})

            mason_lspconfig.setup_handlers {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = cfg.capabilities,
                        on_attach = cfg.on_attach,
                        settings = cfg.servers[server_name],
                    })
                end,
            }
        end
    },
    {
        'glepnir/lspsaga.nvim',
		event = 'VeryLazy',
        dependencies = {
            { 'catppuccin/nvim' },
            {'nvim-tree/nvim-web-devicons'},
            {'nvim-treesitter/nvim-treesitter'}
        },
        opts = {
            symbol_in_winbar = {
                enable = false
            },
            ui = {
                title = false,
                -- border = 'none',
            }
        }
    },
}
