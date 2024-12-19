return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },

            ensure_installed = {
                'typescript',
                'javascript',
                'tsx',
                'html',
                'css',
                'scss',
                'styled',
                'json',
                'markdown',
                'markdown_inline',
                'go',
                'rust',
                'lua',
                'vimdoc',
                'vim',
                'svelte',
                'angular',
                'astro',
                'elixir',
            },

            auto_install = false,

            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = 'v',
                    node_decremental = 'V',
                },
            },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']f'] = '@function.outer',
                        [']a'] = '@parameter.inner',
                    },
                    goto_next_end = {
                        [']F'] = '@function.outer',
                        [']A'] = '@parameter.inner',
                    },
                    goto_previous_start = {
                        ['[f'] = '@function.outer',
                        ['[a'] = '@parameter.inner',
                    },
                    goto_previous_end = {
                        ['[F'] = '@function.outer',
                        ['[A'] = '@parameter.inner',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>an'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>aN'] = '@parameter.inner',
                    },
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
            require('nvim-ts-autotag').setup({})
        end,
    },
}
