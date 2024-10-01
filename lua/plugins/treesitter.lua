return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'nvim-treesitter/playground',
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
            },

            auto_install = false,

            incremental_selection = {
                enable = true,
                keymaps = {
                    node_incremental = 'v',
                    node_decremental = 'V',
                },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
            require('nvim-ts-autotag').setup({})
        end,
    },
}
