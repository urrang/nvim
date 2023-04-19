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
            -- vim.cmd.colorscheme 'vscode'
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
    {
        'folke/tokyonight.nvim',
        config = function()
            require("tokyonight").setup({
                style = "night",
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })

            -- vim.cmd.colorscheme 'tokyonight'
        end
    },
    {
        -- https://github.com/AlexvZyl/nordic.nvim
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic'.setup({
                italic_comments = false,
                bold_keywords = false,
                theme = 'onedark'
            })

            vim.cmd.colorscheme 'nordic'
        end
    }
}