local servers = {
    vtsls = {},
    cssls = {},
    html = {},
    svelte = {},
    astro = {},
    emmet_language_server = {},
    elixirls = {},
    omnisharp = {},
    jsonls = {
        settings = {
            json = {
                schemas = {
                    {
                        fileMatch = { 'package.json' },
                        url = 'https://json.schemastore.org/package.json',
                    },
                    {
                        fileMatch = { 'tsconfig*.json' },
                        url = 'https://json.schemastore.org/tsconfig.json',
                    },
                    {
                        fileMatch = { '.prettierrc' },
                        url = 'https://json.schemastore.org/prettierrc.json',
                    },
                },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                diagnostics = { globals = { 'vim' } },
            },
        },
    },
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('au-lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Set keymaps
        local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('n', '<c-.>', vim.lsp.buf.code_action, 'Code action')
        map('n', 'gh', vim.lsp.buf.hover, 'Hover docs')
        map('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')

        map('n', 'gd', function()
            vim.lsp.buf.definition({
                on_list = function(result)
                    -- vim.fn.setqflist({}, ' ', options)
                    -- vim.cmd.cfirst()

                    if vim.tbl_islist(result.items) and #result.items > 0 then
                        vim.lsp.util.show_document(result.items[1].user_data, 'utf-8')
                    end

                    -- local filtered_items = {}
                    -- for _, v in ipairs(result.items) do
                    --     if string.match(v.user_data.targetUri, '%.d.ts') == nil then
                    --         table.insert(filtered_items, v)
                    --     end
                    -- end
                end,
            })
        end, 'Go to definition')

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('n', '<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, 'Toggle Inlay Hints')
        end

        -- Highlight references of word under cursor
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('au-lsp-highlight', { clear = false })

            -- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            vim.api.nvim_create_autocmd({ 'CursorHold' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            -- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('au-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = 'au-lsp-highlight', buffer = event2.buf })
                end,
            })
        end

        -- Show diagnostics under cursor
        vim.api.nvim_create_autocmd('CursorHold', {
            desc = 'Show diagnostics on CursorHold',
            callback = function()
                vim.diagnostic.open_float(nil, {
                    focusable = false,
                    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
                    border = OPTS.float_border,
                    scope = 'cursor',
                })
            end,
        })
    end,
})

return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
            { 'saghen/blink.cmp' },
        },
        config = function()
            require('mason').setup()

            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local ensure_installed = vim.list_extend(vim.tbl_keys(servers), {
                'stylua',
            })

            require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        require('lspconfig')[server_name].setup(server)
                    end,
                },
            })
        end,
    },
}
