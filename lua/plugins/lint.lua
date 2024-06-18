return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            typescript = { 'eslint' },
            typescriptreact = { "eslint" },
        }

        -- vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        vim.api.nvim_create_autocmd({ 'TextChanged', 'BufReadPost', 'InsertLeave' }, {
            callback = function()
                require("lint").try_lint(nil, { ignore_errors = true })
            end,
        })
    end
}
