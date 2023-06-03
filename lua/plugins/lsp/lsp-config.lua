local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.servers = {
    -- gopls = {},
    -- rust_analyzer = {},

    -- typescript-language-server ?
    tsserver = {
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "literal",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = false,
                    includeInlayVariableTypeHints = false,
                    includeInlayPropertyDeclarationTypeHints = false,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            }
        },
    },
    jsonls = {},
    cssls = {},
    html = {},
    svelte = {},
    angularls = {},
    emmet_ls = {},
    -- tailwindcss = {}
    -- eslint = {}

    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

-- M.lsp_servers = {
--     "tsserver",
--     "lua_ls",
--     -- "eslint",
--     "jsonls",
--     "cssls",
--     "html",
--     -- "tailwindcss",
--     -- "gopls",
-- }

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
    -- nmap('<leader>ca', '<cmd>Lspsaga code_action<CR>', 'Code Action')

    -- Use Lspsaga?
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')


    -- Idk

    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('K', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')
end

return M