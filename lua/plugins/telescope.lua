local map = function(key, cmd, label)
    return { key, '<cmd>' .. cmd .. '<cr>', desc = label }
end

return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzy-native.nvim', build = 'make' },
        {
            'danielfalk/smart-open.nvim',
            branch = '0.3.x',
            dependencies = { 'kkharji/sqlite.lua' },
        },
    },
    keys = {
        map('<leader>fg', 'Telescope live_grep', 'Find by Grep'),
        map('<leader>fw', 'Telescope grep_string', 'Grep word under cursor'),
        map('<leader>fb', 'Telescope buffers theme=dropdown prompt_title=', 'Find buffer'),
        map('<leader>fr', 'Telescope resume', 'Resume last search'),
        map(
            '<leader>fd',
            'Telescope diagnostics theme=dropdown severity_limit=WARN initial_mode=normal',
            'Find diagnostics'
        ),
        map('<leader>fs', 'Telescope persisted theme=dropdown prompt_title=', 'Find session'),
        map('<leader>gb', 'Telescope git_branches', 'Find branch'),

        map('<C-p>', 'Telescope smart_open cwd_only=true theme=dropdown prompt_title=', 'Find file'),

        map('gr', 'Telescope lsp_references', 'LSP references'),

        {
            '<leader>/',
            function()
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                    winblend = 5,
                    previewer = false,
                }))
            end,
            desc = 'Find in current buffer',
        },
    },
    opts = function()
        local telescope = require('telescope')

        telescope.load_extension('fzy_native')
        telescope.load_extension('smart_open')
        telescope.load_extension('persisted')

        local actions = require('telescope.actions')

        return {
            defaults = {
                -- border = true,
                -- prompt_prefix = '   ',
                prompt_prefix = ' ',
                selection_caret = ' ',
                entry_prefix = ' ',

                initial_mode = 'insert',
                selection_strategy = 'reset',
                sorting_strategy = 'ascending',
                layout_strategy = 'horizontal',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                    },
                    vertical = {
                        mirror = false,
                    },
                },
                path_display = function(opts, path)
                    local filename = require('telescope.utils').path_tail(path)

                    -- Remove everything up to and including cwd from the path
                    local cwd = vim.fn.getcwd()
                    path = string.gsub(path, cwd .. '/', '')

                    -- Remove location and code preview from the path
                    -- path = path:match("(.-)%).*")

                    -- local relative_path = remove_cwd_from_path(path)
                    return string.format('%s (%s)', filename, path),
                        {
                            { { 1, #filename }, 'TelescopeFileName' },
                            { { #filename, 999 }, 'TelescopeRelativePath' },
                            -- { { #filename + 1, #filename + #path + 1 }, 'TelescopeRelativePath' }
                        }

                    -- return string.format(' %%#TelescopeFileName# %s %%#TelescopeRelativePath# %s', filename, path)
                end,
                preview = {
                    hide_on_startup = true, -- hide previewer when picker starts
                },
                mappings = {
                    i = {
                        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-x>'] = require('trouble.sources.telescope').open,
                    },
                    n = {
                        ['<C-p>'] = require('telescope.actions.layout').toggle_preview,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-x>'] = require('trouble.sources.telescope').open,
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
                    prompt_title = '',
                    results_title = '',
                    preview_title = '',
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                        '--fixed-strings', -- search for literal strings instead of regex
                    },
                },
                grep_string = {
                    initial_mode = 'normal',
                    preview = { hide_on_startup = false },
                    prompt_title = '',
                    results_title = '',
                    preview_title = '',
                },
                lsp_references = {
                    initial_mode = 'normal',
                    preview = { hide_on_startup = false },
                    layout_config = {
                        width = 0.75,
                    },
                },
                filetypes = {
                    theme = 'dropdown',
                    promp_title = '',
                },
            },
            extensions = {
                persisted = {
                    layout_config = {
                        initial_mode = 'normal',
                    },
                },
            },
        }
    end,
}
