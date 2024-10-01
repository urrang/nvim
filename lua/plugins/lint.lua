return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            typescript = { 'eslint' },
            typescriptreact = { 'eslint' },
        }

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
            group = vim.api.nvim_create_augroup('lint', { clear = true }),
            callback = function()
                lint.try_lint(nil, { ignore_errors = true })
            end,
        })
    end,
}
