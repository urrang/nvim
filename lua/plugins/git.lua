return {
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
