vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    desc = 'Return cursor to where it was last time closing the file',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Resize windows when terminal is resized',
    group = vim.api.nvim_create_augroup('win_autoresize', { clear = true }),
    command = 'wincmd =',
})

vim.api.nvim_create_autocmd('VimEnter', {
    desc = 'Set keymaps for start screen',
    callback = function()
        if vim.fn.argc() == 0 then
            local buf = vim.api.nvim_get_current_buf()
            local opts = { buffer = buf, noremap = true, silent = true }

            vim.keymap.set('n', 'f', ':lua require("snacks").picker.smart()<CR>', opts)
            vim.keymap.set('n', 's', ':Persisted load<CR>', opts)
            vim.keymap.set('n', 'q', ':qa<CR>', opts)
        end
    end,
})

-- local is_angular_project = nil
-- vim.api.nvim_create_autocmd('BufRead', {
--     desc = 'Start treesitter parser for angular on html files in angular project',
--     pattern = '*.html',
--     callback = function()
--         if is_angular_project == nil then
--             is_angular_project = vim.fn.findfile('angular.json', '.;') ~= ''
--         end
--
--         if is_angular_project then
--             vim.treesitter.start(nil, 'angular')
--         end
--     end,
-- })
