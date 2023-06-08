-- null ls https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/lsp_config.lua#L111
return {
    {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { 'williamboman/mason.nvim', config = true },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local cfg = require("plugins.lsp.lsp-config")
            local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
            -- local lsp_defaults = lspconfig.util.default_config

            -- lsp_defaults.capabilities = vim.tbl_deep_extend(
            --     'force',
            --     lsp_defaults.capabilities,
            --     require('cmp_nvim_lsp').default_capabilities()
            -- )

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
                border = 'none',
            }
        }
    },

    -- {
    --     "lvimuser/lsp-inlayhints.nvim",
    --     event = "LspAttach",
    --     opts = {},
    --     config = function(_, opts)
    --         require("lsp-inlayhints").setup(opts)
    --         vim.api.nvim_create_autocmd("LspAttach", {
    --             group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
    --             callback = function(args)
    --                 if not (args.data and args.data.client_id) then
    --                     return
    --                 end
    --                 local client = vim.lsp.get_client_by_id(args.data.client_id)
    --                 require("lsp-inlayhints").on_attach(client, args.buf)
    --             end,
    --         })
    --     end,
    -- },
}
