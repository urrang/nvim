return {
    -- {
    --     'lewis6991/gitsigns.nvim',
    --     -- event = 'VeryLazy',
    --     opts = {
    --         signs = {
    --             add = { text = '▏' },
    --             change = { text = '▏' },
    --             delete = { text = '▏' },
    --             topdelete = { text = '▏' },
    --             changedelete = { text = '▏' },
    --         },
    --         signcolumn = false,
    --     },
    --     keys = {
    --         { '<leader>gb', '<cmd>Gitsigns blame_line<cr>', 'Git blame' },
    --     },
    -- },
    {
        'NeogitOrg/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            process_spinner = false,
            commit_editor = {
                spell_check = false,
            },
            mappings = {
                status = {
                    ['K'] = false,
                },
            },
        },
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', 'Neogit' },
        },
    },
}
