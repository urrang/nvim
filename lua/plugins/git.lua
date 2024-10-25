return {
    {
        'lewis6991/gitsigns.nvim',
        -- event = 'VeryLazy',
        opts = {
            signs = {
                add = { text = '▏' },
                change = { text = '▏' },
                delete = { text = '▏' },
                topdelete = { text = '▏' },
                changedelete = { text = '▏' },
            },
            signcolumn = false,
        },
        keys = {
            { '<leader>gB', '<cmd>Gitsigns blame_line<cr>', 'Git blame' },
        },
    },
    -- {
    --     'sindrets/diffview.nvim',
    --     event = 'VeryLazy',
    --     opts = {
    --         enhanced_diff_hl = true,
    --     },
    -- },
    {
        'NeogitOrg/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            commit_editor = {
                spell_check = false,
            },
        },
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', 'Neogit' },
        },
    },
}
