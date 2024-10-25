vim.cmd('ca dbui tab DBUI')

return {
    {
        'tpope/vim-dadbod',
        -- event = 'VeryLazy',
        cmd = 'DBUI',
        dependencies = {
            'kristijanhusak/vim-dadbod-completion',
            'kristijanhusak/vim-dadbod-ui',
        },
    },
}
