return {
    'folke/snacks.nvim',
    opts = {
        picker = {
            ui_select = false,
            formatters = {
                file = {
                    filename_first = true,
                },
            },
            sources = {
                smart = {
                    multi = { 'buffers', 'files' },
                    prompt = ' ',
                    layout = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 80,
                            height = 0.3,
                            min_height = 3,
                            box = 'vertical',
                            border = OPTS.float_border,
                            title = '',
                            { win = 'input', height = 1, border = 'bottom' },
                            { win = 'list', border = 'none' },
                            { win = 'preview', title = '{preview}', height = 0.3, border = 'top' },
                        },
                    },
                },
            },
        },
        explorer = {},
    },
    keys = {
        {
            '<C-p>',
            function()
                Snacks.picker.smart()
                -- Snacks.picker.smart({
                --     multi = { 'buffers', 'files' },
                --     layout = {
                --         preview = false,
                --         layout = {
                --             backdrop = false,
                --             width = 80,
                --             height = 0.3,
                --             min_height = 3,
                --             box = 'vertical',
                --             border = OPTS.float_border,
                --             title = '',
                --             { win = 'input', height = 1, border = 'bottom' },
                --             { win = 'list', border = 'none' },
                --             { win = 'preview', title = '{preview}', height = 0.3, border = 'top' },
                --         },
                --     },
                -- })
            end,
            desc = 'Smart Find Files',
        },
    },
}
