return {
    -- { 'tpope/vim-sleuth' },
    {
        'olimorris/persisted.nvim',
        lazy = false,
        config = function()
            require('persisted').setup({
                use_git_branch = true,
                silent = true,
            })
        end,
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            keywords = {
                TODO = { icon = ' ', color = 'warning' },
                REVISIT = { icon = ' ', color = 'info' },
            },
        },
    },
    {
        'chrisgrieser/nvim-early-retirement',
        event = 'VeryLazy',
        config = true,
        opts = { retirementAgeMins = 10 },
    },
    {
        'laytan/cloak.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },
    {
        'max397574/better-escape.nvim',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        opts = {
            select = {
                backend = { 'builtin', 'telescope' },
            },
        },
    },
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = 'VeryLazy',
        config = function()
            require('treesj').setup({ use_default_keymaps = false })
            vim.keymap.set('n', '<leader>j', require('treesj').toggle)
        end,
    },
    {
        'folke/ts-comments.nvim',
        event = 'VeryLazy',
        opts = {
            lang = {
                styled = '/* %s */',
                angular = '<!-- %s -->',
            },
        },
    },
    -- {
    --     'numToStr/Comment.nvim',
    --     dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    --     event = 'VeryLazy',
    --     config = function()
    --         require('Comment').setup({
    --             pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    --         })
    --     end,
    -- },
}
