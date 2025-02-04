return {
    -- {
    --     'tanvirtin/vgit.nvim',
    --     branch = 'v1.0.x',
    --     event = 'VimEnter',
    --     dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --         require('vgit').setup()
    --     end,
    -- },
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
    -- { 'tpope/vim-fugitive', cmd = 'G' },
    {
        'akinsho/git-conflict.nvim',
        event = 'BufReadPre',
        config = true,
        keys = { { '<leader>gx', '<cmd>GitConflictListQf<CR>', 'Add git conflicts to quickfix' } },
    },
    -- {
    --     'sindrets/diffview.nvim',
    --     event = 'VeryLazy',
    --     opts = {
    --         enhanced_diff_hl = true,
    --         file_panel = {
    --             listing_style = 'list',
    --         },
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
