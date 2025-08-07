return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
        {
            '<C-p>',
            function()
                Snacks.picker.smart({
                    -- multi = { 'buffers', 'files' },
                    filter = { cwd = true },
                    layout = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 0.3,
                            min_width = 40,
                            height = 0.3,
                            min_height = 3,
                            box = 'vertical',
                            border = OPTS.float_border,
                            title = '',
                            title_pos = 'center',
                            { win = 'input', height = 1, border = 'bottom' },
                            { win = 'list', border = 'none' },
                            { win = 'preview', title = '{preview}', height = 0.3, border = 'top' },
                        },
                    },
                })
            end,
            desc = 'Smart Find Files',
        },
        -- {
        --     '<leader>fg',
        --     function()
        --         Snacks.picker.grep({
        --             regex = false,
        --             layout = {
        --                 layout = {
        --                     backdrop = false,
        --                 },
        --             },
        --         })
        --     end,
        -- },
        -- {
        --     '<leader>fb',
        --     function()
        --         Snacks.picker.buffers({
        --             layout = {
        --                 preset = 'select',
        --                 layout = {
        --                     width = 0.3,
        --                     height = 0.3,
        --                     min_width = 40,
        --                 },
        --                 -- preview = false,
        --             },
        --         })
        --     end,
        -- },
    },
    opts = {
        picker = {
            enabled = true,
            formatters = {
                file = {
                    filename_first = true,
                },
            },
        },

        bigfile = { enabled = true },
    },
}
