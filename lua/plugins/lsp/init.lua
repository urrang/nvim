-- null ls https://github.com/garcia5/dotfiles/blob/master/files/nvim/lua/ag/lsp_config.lua#L111
return {
    {
        'glepnir/lspsaga.nvim',
		event = 'VeryLazy',
        dependencies = {
            { 'catppuccin/nvim' },
            {'nvim-tree/nvim-web-devicons'},
            {'nvim-treesitter/nvim-treesitter'}
        },
        config = true,
        -- config = function()
        --     require('lspsaga').setup({
		-- 		symbol_in_winbar = {
		-- 			enable = false,
		-- 		},
        --         ui = {
        --             kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
        --         },
		-- 	})
        -- end
    },
    { 'williamboman/mason.nvim', config = true },
    {
        'neovim/nvim-lspconfig',
        -- event = "BufReadPre",
        dependencies = {
            -- { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            'glepnir/lspsaga.nvim',
            -- {
            --     'j-hui/fidget.nvim',
            --     opts = {
            --         window = {
            --             blend = 0
            --         }
            --     }
            -- },
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
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { '<leader>x', '<cmd>TroubleToggle document_diagnostics<cr>', 'Show problems' }
        },
        opts = {
            auto_close = true,
            height = 15,
            group = false,
            indent_lines = false,
        },
    }
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
