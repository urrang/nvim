vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('au-lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

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

        -- Highlight references of word under cursor
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('au-lsp-highlight', { clear = false })

            -- Skip highlighting if we're in a css block in a typescript file.
            -- Because ts_ls highglights the entire style block in angular decorators.
            local function should_highlight()
                if vim.bo.filetype ~= 'typescript' then
                    return true
                end

                -- Get the language at cursor position
                local cursor = vim.api.nvim_win_get_cursor(0)
                local row, col = cursor[1] - 1, cursor[2]

                local lang_tree = vim.treesitter.get_parser(0)
                if not lang_tree then
                    return true
                end

                local current_tree = lang_tree:language_for_range({ row, col, row, col })
                if not current_tree then
                    return true
                end

                return current_tree:lang() ~= 'css'
            end

            vim.api.nvim_create_autocmd({ 'CursorHold' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = function()
                    if should_highlight() then
                        vim.lsp.buf.document_highlight()
                    end
                end,
                -- callback = vim.lsp.buf.document_highlight,
            })

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

        vim.keymap.set('n', 'ge', function()
            vim.diagnostic.open_float(nil, {
                focusable = true,
                -- close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
                border = OPTS.float_border,
                scope = 'cursor',
            })
        end)

        -- Show diagnostics under cursor
        -- vim.api.nvim_create_autocmd('CursorHold', {
        --     desc = 'Show diagnostics on CursorHold',
        --     callback = function()
        --         vim.diagnostic.open_float(nil, {
        --             focusable = false,
        --             close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter' },
        --             border = OPTS.float_border,
        --             scope = 'cursor',
        --         })
        --     end,
        -- })
    end,
})

return {
    {
        'neovim/nvim-lspconfig',
        -- event = { 'BufReadPre', 'BufNewFile' },
        event = 'VeryLazy',
        cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
        },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'ts_ls',
                    'html',
                    'cssls',
                    'jsonls',
                    'svelte',
                    'astro',
                    'prismals',
                    'vue_ls',
                    'lua_ls',
                    'emmet_language_server',
                },
            })
        end,
    },
}
