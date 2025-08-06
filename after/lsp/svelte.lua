return {
    on_attach = function(client, bufnr)
        -- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
        --     pattern = { '*.js', '*.ts' },
        --     callback = function(ctx)
        --         client:notify('$/onDidChangeTsOrJsFile', {
        --             uri = ctx.match,
        --         })
        --     end,
        -- })

        -- vim.api.nvim_create_autocmd('BufWritePost', {
        --     group = vim.api.nvim_create_augroup('svelte-filechange-watcher', { clear = false }),
        --     -- pattern = { '*.js', '*.ts' },
        --     callback = function(ctx)
        --         vim.print('FILE CHANGED')
        --         client:notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
        --     end,
        -- })

        -- Workaround to trigger reloading JS/TS files
        -- See https://github.com/sveltejs/language-tools/issues/2008
        vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.js', '*.ts' },
            buffer = bufnr,
            group = vim.api.nvim_create_augroup('123svelte_js_ts_file_watch', {}),
            callback = function(ctx)
                -- internal API to sync changes that have not yet been saved to the file system
                client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
            end,
        })
    end,
}
