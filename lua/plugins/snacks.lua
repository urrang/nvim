---@diagnostic disable: undefined-global

return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
        {
            '<C-p>',
            function()
                Snacks.picker.smart({
                    multi = { 'buffers', 'files' },
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
                            title = '{title}',
                            title_pos = 'center',
                            { win = 'input', height = 1, border = 'bottom' },
                            { win = 'list', border = 'none' },
                            { win = 'preview', title = '{preview}', height = 0.3, border = 'top' },
                        },
                        -- layout = {
                        --     backdrop = false,
                        --     row = 1,
                        --     width = 0.4,
                        --     min_width = 80,
                        --     height = 0.4,
                        --     border = 'none',
                        --     box = 'vertical',
                        --     {
                        --         win = 'input',
                        --         height = 1,
                        --         border = 'rounded',
                        --         title = '{title} {live} {flags}',
                        --         title_pos = 'center',
                        --     },
                        --     { win = 'list', border = 'rounded' },
                        --     { win = 'preview', title = '{preview}', border = 'rounded' },
                        -- },
                    },
                })
            end,
            desc = 'Smart Find Files',
        },
        {
            '<leader>/',
            function()
                Snacks.picker.grep()
            end,
            desc = 'Grep',
        },
        {
            '<leader>e',
            function()
                Snacks.explorer()
            end,
            desc = 'File Explorer',
        },
        {
            '<leader>q',
            function()
                Snacks.picker.qflist()
            end,
            desc = 'Quickfix List',
        },
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

        -- REVISIT: are these enabled by default?

        -- dashboard = { enabled = false },
        -- indent = { enabled = false },
        -- input = { enabled = false },
        -- notifier = { enabled = false },
        -- quickfile = { enabled = false },
        -- scroll = { enabled = false },
        -- statuscolumn = { enabled = false },
        -- words = { enabled = false },
    },
}
