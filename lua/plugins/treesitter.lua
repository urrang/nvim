local parsers = {
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
}

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local treesitter = require('nvim-treesitter')

            local installed = require('nvim-treesitter.config').get_installed()
            local not_installed = vim.tbl_filter(function(p)
                return not vim.tbl_contains(installed, p)
            end, parsers)

            treesitter.install(not_installed)

            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    pcall(vim.treesitter.start)
                    -- Enable treesitter-based indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    -- {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     event = 'VeryLazy',
    --     branch = 'main',
    --     init = function()
    --         -- Disable entire built-in ftplugin mappings to avoid conflicts.
    --         -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    --         vim.g.no_plugin_maps = true
    --     end,
    --     config = function()
    --         require('config.treesitter-textobjects')
    --     end,
    -- },
    {
        'windwp/nvim-ts-autotag',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close_on_slash = true,
                },
            })
        end,
    },
}
