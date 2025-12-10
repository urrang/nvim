local map = function(key, cmd, label)
    return { key, '<cmd>' .. cmd .. '<cr>', desc = label }
end

return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- 'nvim-telescope/telescope-frecency.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    keys = {
        map('<leader>fr', 'Telescope resume', 'Resume last search'),
        map('<leader>fg', 'Telescope live_grep', 'Find by Grep'),
        map('<leader>fb', 'Telescope buffers theme=dropdown initial_mode=normal prompt_title=', 'Find buffer'),
        map('<leader>gb', 'Telescope git_branches', 'Find branch'),

        map('gr', 'Telescope lsp_references', 'LSP references'),

        -- map('<C-p>', 'Telescope frecency workspace=CWD theme=dropdown', 'Find filed (frecency)'),
        -- map('<C-p>', 'Telescope find_files', 'Find filed'),
        map('<leader><space>', 'Telescope find_files', 'Find filed'),
    },
    config = function()
        local telescope = require('telescope')

        local make_entry = require('telescope.make_entry')
        local entry_display = require('telescope.pickers.entry_display')
        local devicons = require('nvim-web-devicons')

        local grep_entry_displayer = entry_display.create({
            separator = ' ',
            items = { { width = 2 }, {}, { remaining = true } }, -- icon, name, path
        })

        telescope.setup({
            defaults = {
                results_title = '',
                preview_title = '',
                prompt_prefix = ' ',
                selection_caret = ' ',
                entry_prefix = ' ',

                sorting_strategy = 'ascending',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                    },
                },
                preview = { hide_on_startup = true },
                path_display = { 'filename_first' },
                -- path_display = function(_, path)
                --     local filename = require('telescope.utils').path_tail(path)
                --
                --     -- Remove everything up to and including cwd from the path
                --     local cwd = vim.fn.getcwd()
                --     path = string.gsub(path, cwd .. '/', '')
                --
                --     -- Remove the first colon and everything after it
                --     path = string.gsub(path, ':.*$', '')
                --
                --     local transformed_path = vim.trim(filename .. ' ' .. path)
                --     local path_style = { { { #filename, #transformed_path }, 'TelescopeResultsComment' } }
                --     return transformed_path, path_style
                --
                --     -- return string.format('%s (%s)', filename, path),
                --     --     {
                --     --         { { 1, #filename }, 'TelescopeFileName' },
                --     --         { { #filename, 999 }, 'TelescopeResultsComment' },
                --     --     }
                -- end,
                mappings = {
                    i = {
                        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                    },
                    n = {
                        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-j>'] = require('telescope.actions').move_selection_next,
                        ['<C-k>'] = require('telescope.actions').move_selection_previous,
                    },
                },
                file_ignore_patterns = {
                    'src/assets/pdfjs/*',
                    'src/assets/stimulsoft/*',
                },
            },
            pickers = {
                git_branches = {
                    initial_mode = 'normal',
                    layout_strategy = 'bottom_pane',
                    prompt_title = '',
                    show_remote_tracking_branches = false,
                },
                live_grep = {
                    preview = { hide_on_startup = false },
                    prompt_title = 'Grep',
                    preview_title = '',
                    file_ignore_patterns = { 'node_modules', '.git', '*-lock.json' },
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--fixed-strings', -- search for literal strings instead of regex
                        '--hidden', -- include hidden files
                    },
                    -- https://github.com/nvim-telescope/telescope.nvim/issues/2507#issuecomment-2841001631
                    entry_maker = function(entry)
                        local item = make_entry.gen_from_vimgrep({})(entry)

                        if not item or not item.filename or not item.lnum then
                            return item
                        end

                        local filename = require('telescope.utils').path_tail(item.filename)
                        local relative_path = string.gsub(item.filename, vim.fn.getcwd() .. '/', '')

                        local icon, iconhl = devicons.get_icon(filename, nil, { default = true })

                        item.display = function()
                            return grep_entry_displayer({
                                { icon, iconhl },
                                filename,
                                { relative_path, 'TelescopeResultsComment' },
                            })
                        end

                        item.ordinal = filename
                        item.value = entry

                        return item
                    end,
                },
                lsp_references = {
                    initial_mode = 'normal',
                    preview_title = '',

                    show_line = false,
                    preview = { hide_on_startup = false },
                    layout_config = {
                        width = 0.75,
                    },
                },
                filetypes = {
                    theme = 'dropdown',
                    prompt_title = '',
                },
                find_files = {
                    theme = 'dropdown',
                    prompt_title = '',
                },
                buffers = {
                    mappings = {
                        n = {
                            ['<C-d>'] = require('telescope.actions').delete_buffer,
                        },
                    },
                },
            },
            -- extensions = {
            --     frecency = {
            --         prompt_title = '',
            --         -- auto_validate = false,
            --         matcher = 'fuzzy',
            --         path_display = { 'filename_first' },
            --         show_filter_column = false,
            --         default_workspace = 'CWD',
            --         ignore_patterns = {
            --             '*/.git',
            --             '*/.git/*',
            --             '*/.DS_Store',
            --             'node_modules',
            --             'node_modules/*',
            --             '*/node_modules/*',
            --         },
            --     },
            -- },
        })

        -- Enable Telescope extensions if they are installed
        pcall(telescope.load_extension, 'fzf')
        -- pcall(telescope.load_extension, 'frecency')
        -- pcall(telescope.load_extension('smart_open'))
    end,
}
