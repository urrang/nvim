return {
    {
        'neovim/nvim-lspconfig',
        -- event = "BufReadPre",
        dependencies = {
            -- "hrsh7th/cmp-nvim-lsp",
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
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
                    })
                end,
            }

        end
    }
}