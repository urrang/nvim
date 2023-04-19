return {
    -- {
    --     'navarasu/onedark.nvim',
    --     priority = 1000,
    --     config = function()
    --         vim.cmd.colorscheme 'onedark'
    --     end,
    -- },
    {
        'Mofiqul/vscode.nvim',
        config = function()
            require('vscode').setup({
                transparent = false,
                disable_nvimtree_bg = true,
            })
            vim.cmd.colorscheme 'vscode'
        end
    },
    {
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
                flavour = "frappe",
            })

            -- vim.cmd.colorscheme 'catppuccin'
        end
    },
    -- {
    --     'AlexvZyl/nordic.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require 'nordic' .load()
    --     end
    -- }
}