return {
    on_attach = function(client)
        vim.print('SVELTE ATTACH')
        vim.api.nvim_create_autocmd('BufWritePost', {
            pattern = { '*.js', '*.ts' },
            callback = function(ctx)
                vim.print('FILE CHANGED')
                client.notify('$/onDidChangeTsOrJsFile', { uri = ctx.match })
            end,
        })
    end,
}
