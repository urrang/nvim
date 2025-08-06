return {
    {
        'neovim/nvim-lspconfig',
        -- event = { 'BufReadPre', 'BufNewFile' },
        event = 'VeryLazy',
        cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'mason-org/mason-lspconfig.nvim',
        },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'ts_ls',
                    'html',
                    'cssls',
                    'jsonls',
                    'svelte',
                    'astro',
                    'prismals',
                    'vue_ls',
                    'lua_ls',
                    'emmet_language_server',
                },
            })
        end,
    },
}
