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
                no_italic = true,
                no_bold = true,
                integrations = {
                    cmp = true,
                    lsp_saga = true,
                    gitsigns = true,
                    neotree = true,
                    telescope = true,
                    notify = true,
                    noice = true,
                    -- fidget = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },

                    -- bufferline = true,
                    hop = true,
                    -- lualine = true,
                    which_key = true,
                    -- harboon = true,

                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
                custom_highlights = function(colors)
                    return {
                        CmpBorder = { fg = colors.surface2 },

                        -- CmpItemMenu = { bg = colors.pink },
                        CmpSelectedItem = { fg = colors.crust, bg = colors.blue },
                        CmpItemAbbrMatch = { fg = colors.blue, style = { "bold" } },
		                CmpItemAbbrMatchFuzzy = { fg = colors.blue, style = { "bold" } },
                    }
                end
            })

            -- local colors = require("catppuccin.palettes").get_palette()
            -- require("catppuccin.lib.highlighter").syntax {
            --     FloatBorder = { fg = colors.overlay2, bg = colors.mantle },
            -- }

            vim.cmd.colorscheme 'catppuccin'
        end
    },
    {
        'folke/tokyonight.nvim',
        config = function()
            require("tokyonight").setup({
                style = "storm",
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
                override = {
                    ['@variable.builtin'] = { italic = false },
                    ['@namespace'] = { italic = false },
                    ['@text.emphasis'] = { italic = false },
                    ['@parameter'] = { italic = false }
                }
                -- theme = 'onedark'
            })

            -- vim.cmd.colorscheme 'nordic'
        end
    }
}