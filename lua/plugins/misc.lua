return {
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true,
    },
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
        'laytan/cloak.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
        keys = {
            { '<leader>ct', '<cmd>CloakToggle<cr>', desc = 'Cloak Toggle' },
        },
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
    -- {
    --     'Wansmer/treesj',
    --     dependencies = { 'nvim-treesitter/nvim-treesitter' },
    --     keys = {
    --         { '<leader>j', '<cmd>TSJToggle<cr>', desc = 'Treesj toggle' },
    --     },
    --     opts = { use_default_keymaps = false, max_join_length = 150 },
    -- },
    {
        'folke/ts-comments.nvim',
        event = 'VeryLazy',
        opts = {},
        -- event = { 'BufReadPost', 'BufNewFile' },
        -- opts = {
        --     lang = {
        --         styled = '/*%s*/',
        --         angular = '<!-- %s -->',
        --     },
        -- },
    },
}
