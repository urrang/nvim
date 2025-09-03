return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                svelte = { 'prettier' },
                html = { 'prettier' },
                htmlangular = { 'prettier' },
                css = { 'prettier' },
                json = { 'prettier' },
                markdown = { 'prettier' },
                astro = { 'prettier' },
                prisma = { lsp_format = 'prefer' },
                elixir = { 'mix' },
                eelixir = { 'mix' },
                heex = { 'mix' },
                surface = { 'mix' },
                cs = { 'csharpier' },
            },
            format_on_save = {
                timeout_ms = 500,
            },
            formatters = {
                csharpier = {
                    command = 'dotnet-csharpier',
                    args = { '--write-stdout' },
                },
            },
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>fo', function()
            conform.format()
        end, { desc = 'Format file' })
    end,
}
