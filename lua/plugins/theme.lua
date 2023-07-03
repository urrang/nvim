return {
    {
        'Mofiqul/vscode.nvim',
        config = function()
            local c = require('vscode.colors').get_colors()

            require('vscode').setup({
                transparent = false,
                disable_nvimtree_bg = true,
                group_overrides = {
                    ['@variable.builtin'] = { fg = c.vscBlue },
                    ['@keyword'] = { fg = c.vscBlue },
                    ['@keyword.return'] = { fg = c.vscPink },
                    ['@conditional.ternary'] = { fg = c.vscFront },
                    ['@parameter'] = { fg = '#6FBFF9' }, -- c.vscMediumBlue },
                }
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
					alpha = true,
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
                    -- harpoon = true,

                    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
                },
                -- transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        ['@variable.builtin'] = { fg = colors.mauve },
                        ['@type.qualifier'] = { fg = colors.mauve },
                        ['@parameter'] = { fg = colors.sky },
                        ['@property'] = { fg = colors.text },
                        ['@operator'] = { fg = colors.subtext1 },
                        ['@punctuation.bracket'] = { fg = colors.subtext1 },
                        ['@punctuation.delimiter'] = { fg = colors.subtext1 },
                        -- ['@type'] = { fg = "#BFE7E0" },

                        ['@number'] = { fg = colors.maroon },
                        ['@boolean'] = { fg = colors.maroon },




                        ['cssDefinition'] = { fg = colors.text },
                        ['StorageClass'] = { fg = colors.text },
                        ['cssCustomProp'] = { fg = colors.text },
                        ['cssValueLength'] = { fg = colors.green },
                        ['cssUnitDecorators'] = { fg = colors.green },
                        ['cssColor'] = { fg = colors.green },

                        ['cssValueNumber'] = { fg = colors.maroon },
                        ['cssAttrRegion'] = { fg = colors.maroon },
                        ['cssFunction'] = { fg = colors.text },
                        ['Constant'] = { fg = colors.maroon },

                        -- ['Special'] = { fg = colors.green },
                        -- ['Type'] = { fg = colors.green },
                        -- ['Identifier'] = { fg = colors.green },
                        -- ['CmpItemKindVariable'] = { fg = colors.green },
                        ['@lsp.type.interface'] = { link = 'Type' },
                        ['@lsp.type.enumMember'] = { fg = colors.text },

                        -- ['cssAttrRegion'] = { fg = colors.text },
                        -- ['cssUnitDecorators'] = { fg = colors.yellow },
                        -- ['cssColor'] = { fg = colors.red },

                        -- ['@method'] = { fg = colors.flamingo },
                        -- ['@method.call'] = { fg = colors.flamingo },
                        -- ['@function.call'] = { fg = colors.flamingo },
                        -- ['@property'] = { fg = colors.text },

                        -- ['@variable.builtin'] = { fg = colors.blue },
                        -- ['@method'] = { fg = colors.yellow },
                        -- ['@method.call'] = { fg = colors.yellow },
                        -- ['@function.call'] = { fg = colors.yellow },


                        CmpBorder = { fg = colors.surface2 },

                        -- CmpItemMenu = { bg = colors.pink },
                        CmpSelectedItem = { fg = colors.crust, bg = colors.blue },
                        CmpItemAbbrMatch = { fg = colors.blue, style = { "bold" } },
		                CmpItemAbbrMatchFuzzy = { fg = colors.blue, style = { "bold" } },

                        SagaBorder = { fg = colors.surface2 },
                        -- MiniIndentscopeSymbol = { fg = colors.yellow },

                        FloatBorder = { fg = colors.surface2, bg = colors.base },
                        NormalFloat = { bg = colors.base },
                        -- NormalFloatBorder = { fg = colors.surface2, bg = colors.base },

                        DiagnosticFloatingError = { bg = colors.base },
                        DiagnosticFloatingWarn = { bg = colors.base },
                        DiagnosticFloatingInfo = { bg = colors.base },
                        DiagnosticFloatingHint = { bg = colors.base },
                    }
                end,
                -- color_overrides = {
                --     frappe = {
                --         base = "#2E3440"
                --     }
                -- }
            })

            -- local colors = require("catppuccin.palettes").get_palette()
            -- require("catppuccin.lib.highlighter").syntax {
            --     FloatBorder = { fg = colors.overlay2, bg = colors.mantle },
            -- }

            vim.cmd.colorscheme 'catppuccin'
        end
    },
    -- {
    --     'sainnhe/gruvbox-material',
    --     config = function()
    --       vim.o.background = "dark"
    --       vim.g.gruvbox_material_background = "hard"
    --       -- vim.g.gruvbox_material_transparent_background = 1
    --       vim.cmd.colorscheme 'gruvbox-material'
    --     end,
    -- },
    {
        -- https://github.com/AlexvZyl/nordic.nvim
        'AlexvZyl/nordic.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic'.setup({
                transparent_bg = false,
                italic_comments = false,
                bold_keywords = false,
                override = {
                    ['@variable.builtin'] = { italic = false },
                    ['@namespace'] = { italic = false },
                    ['@text.emphasis'] = { italic = false },
                    -- ['@parameter'] = { italic = false },

                    ['@property'] = { fg = '#BBC3D4' },
                    ['@parameter'] = { fg = '#8FBCBB', italic = false },
                }
                -- theme = 'onedark'
            })

            -- vim.cmd.colorscheme 'nordic'
        end
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                -- variant = 'moon',
                disable_italics = true,
                disable_background = true,
            })
        end
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "storm", --  `moon`, a darker variant `night`,
            transparent = true,
            -- groups = {
            --     background = '#1F252B',
            --     background_nc = '#1F252B',
            -- },
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = false },
                keywords = { italic = false },
                functions = {},
                variables = {},
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "dark", -- style for sidebars, see below
                floats = "dark", -- style for floating windows
            },
            on_highlights = function(hl, c)
                hl['@property'] = { fg = '#C0CAF5' }
            end,
            -- on_colors = function(colors)
            --     colors.bg = '#1F252B'
            -- end,
        }
    },

    {
        'gbprod/nord.nvim',
        config = function()
            require("nord").setup({
                -- transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
                borders = true, -- Enable the border between verticaly split windows visible
                errors = { mode = "bg" }, -- Display mode for errors and diagnostics
                styles = {
                    comments = { italic = false },
                },
                on_highlights = function(hl, colors)
                    hl['@keyword'] = { fg = '#B48EAD' }
                    hl['@number'] = { fg = '#D08770' }
                    hl['@parameter'] = { fg = '#EBCB8B' }


                    hl['@punctuation.bracket'] = { fg = '#949cbb' }
                    hl['@punctuation.delimiter'] = { fg = '#949cbb' }

                    --
                    hl['@conditional'] = { fg = '#B48EAD' }
                    hl['@keyword.return'] = { fg = '#B48EAD' }

                    -- hl['@keyword'] = { fg = '#81A1C1' }
                end,
            })
        end
    },

    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
        require("everforest").setup({
        -- Your config here
        })
        end,
    },
}
