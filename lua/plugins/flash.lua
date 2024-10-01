return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        modes = {
            search = {
                enabled = false,
            },
        },
    },
    keys = {
        {
            's',
            mode = { 'n', 'x', 'v', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash',
        },
        {
            'S',
            mode = { 'n', 'o', 'x' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Flash Treesitter',
        },
    },
}
