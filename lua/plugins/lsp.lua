local servers = {
    ts_ls = {},
    cssls = {},
    html = {},
    astro = {},
    vue_ls = {},
    emmet_language_server = {
        init_options = {
            excludeLanguages = { 'css', 'less', 'pug', 'sass', 'scss' },
        },
    },
    elixirls = {},
    omnisharp = {},
    svelte = {
        on_attach = function(client)
            vim.api.nvim_create_autocmd('BufWritePost', {
                pattern = { '*.js', '*.ts' },
                callback = function(ctx)
                    client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
                end,
            })
        end,
    },
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
                    if vim.tbl_islist(result.items) and #result.items > 0 then
                        vim.lsp.util.show_document(result.items[1].user_data, 'utf-8')
                    end
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
        -- event = { 'BufReadPre', 'BufNewFile' },
        event = 'VeryLazy',
        cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
        dependencies = {
            -- { 'williamboman/mason.nvim' },
            -- { 'williamboman/mason-lspconfig.nvim' },
            -- 'mason-org/mason.nvim',
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            'saghen/blink.cmp',
        },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local ensure_installed = vim.list_extend(vim.tbl_keys(servers), { 'stylua' })

            require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

            -- for s_name, s_config in pairs(servers) do
            --     s_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, s_config.capabilities or {})
            --     require('lspconfig')[s_name].setup(s_config or {})
            -- end

            for server, config in pairs(servers) do
                if not vim.tbl_isempty(config) then
                    config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
                    vim.lsp.config(server, config)
                end
            end

            require('mason-lspconfig').setup({
                ensure_installed = {},
                automatic_enable = true,
            })

            -- require('mason-lspconfig').setup({
            --     ensure_installed = {},
            --     automatic_installation = false,
            --     handlers = {
            --         function(server_name)
            --             local server = servers[server_name] or {}
            --             server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            --             require('lspconfig')[server_name].setup(server)
            --         end,
            --     },
            -- })
        end,
    },
}
