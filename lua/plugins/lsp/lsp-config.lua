local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.servers = {
    -- gopls = {},
    -- rust_analyzer = {},

    -- typescript-language-server ?
    tsserver = {
        -- settings = {
        --     typescript = {
        --         inlayHints = {
        --             includeInlayParameterNameHints = "literal",
        --             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --             includeInlayFunctionParameterTypeHints = false,
        --             includeInlayVariableTypeHints = false,
        --             includeInlayPropertyDeclarationTypeHints = false,
        --             includeInlayFunctionLikeReturnTypeHints = true,
        --             includeInlayEnumMemberValueHints = true,
        --         },
        --     },
        --     javascript = {
        --         inlayHints = {
        --             includeInlayParameterNameHints = "all",
        --             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        --             includeInlayFunctionParameterTypeHints = true,
        --             includeInlayVariableTypeHints = true,
        --             includeInlayPropertyDeclarationTypeHints = true,
        --             includeInlayFunctionLikeReturnTypeHints = true,
        --             includeInlayEnumMemberValueHints = true,
        --         },
        --     }
        -- },
    },
    jsonls = {},
    cssls = {},
    html = {},
    svelte = {},
    angularls = {},
    emmet_ls = {},

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

M.setup = function()
    -- vim.diagnostic.config({
	-- 	virtual_text = false,
	-- 	float = {
	-- 		focusable = false,
	-- 		style = "minimal",
	-- 		border = "rounded",
	-- 		source = "always",
	-- 		header = "",
	-- 		prefix = "",
	-- 	},
	-- 	signs = true,
	-- 	underline = true,
	-- 	update_in_insert = true,
	-- 	severity_sort = false,
	-- })

    -- show diagnostics in hover window
	vim.api.nvim_create_autocmd("CursorHold", {
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
				-- border = "rounded",
				-- source = "always",
				-- prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

M.on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- Good
    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
    nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')
    nmap('K', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')

    -- Use Lspsaga?
    nmap('<leader>gd', vim.lsp.buf.definition, 'Goto Definition')
    nmap('<leader>gp', '<cmd>Lspsaga peek_definition<cr>', 'Peek Definition')
end

return M