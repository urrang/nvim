return {
    {
        'glepnir/lspsaga.nvim',
		event = 'VeryLazy',
        dependencies = {
            { 'catppuccin/nvim' },
        },
        config = function()
            require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
                ui = {
                    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
                },
			})
        end
    },
    {
        'neovim/nvim-lspconfig',
        -- event = "BufReadPre",
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            {
                'j-hui/fidget.nvim',
                opts = {
                    window = {
                        blend = 0
                    }
                }
            },
        },
        config = function()
            local cfg = require("plugins.lsp.lsp-config")
            local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

            cfg.setup()

            mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(cfg.servers)
			})

            mason_lspconfig.setup_handlers {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = cfg.capabilities,
                        on_attach = cfg.on_attach,
                        settings = cfg.servers[server_name],
                        -- handlers = {
                        --     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	                    --     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
                        -- }
                    })
                end,
            }

        end
    }
}