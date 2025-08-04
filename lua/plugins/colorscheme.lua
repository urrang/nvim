-- macchiato palette with brightness * 0.94 and hue * 0.9 (hue only changed on some colors)
local custom_catppuccin = {
    rosewater = '#e5cec9',
    flamingo = '#e2baba',
    pink = '#e6b2d8',
    mauve = '#ba96e7',
    maroon = '#e09096',
    peach = '#e69f77',
    yellow = '#e0c795',
    teal = '#83c8be',
    sky = '#88cad5',
    sapphire = '#75b8d6',
    blue = '#82a3e5',
    lavender = '#acb2e9',
    green = '#a1cd93',
    red = '#df8895',
    text = '#c0caf5',
    subtext1 = '#b1b7d3',
    subtext0 = '#9fa5bf',
    overlay2 = '#8e93ac',
    overlay1 = '#7c8198',
    overlay0 = '#6a6f85',
    surface2 = '#585c71',
    surface1 = '#474b5e',
    surface0 = '#35384a',
    base = '#262836',
    mantle = '#1d1f2a',
    crust = '#181924',
}

local custom_catppuccin2 = {
    rosewater = '#e5cec9',
    flamingo = '#e2baba',
    pink = '#e6b2d8',
    mauve = '#ba96e7',
    maroon = '#e09096',
    peach = '#e69f77',
    yellow = '#e0c795',
    teal = '#83c8be',
    sky = '#88cad5',
    sapphire = '#75b8d6',
    blue = '#82a3e5',
    lavender = '#acb2e9',
    green = '#a1cd93',
    red = '#df8895',
    text = '#c0caf5',
    subtext1 = '#b1b7d3',
    subtext0 = '#9fa5bf',
    overlay2 = '#8e93ac',
    overlay1 = '#7c8198',
    overlay0 = '#6a6f85',
    surface2 = '#585c71',
    surface1 = '#474b5e',
    surface0 = '#2B2E34', -- this
    base = '#21242A',
    mantle = '#1C1F25',
    crust = '#1C1F25',
}

local kanappuccin = {
    rosewater = '#e5cec9',
    flamingo = '#e2baba',
    pink = '#e6b2d8',
    mauve = '#957FB8',
    maroon = '#e09096',
    peach = '#e69f77',
    -- yellow = '#e0c795',
    yellow = '#c4b28a',
    teal = '#7AA89F',
    sky = '#7AA89F',
    sapphire = '#7FB4CA',
    blue = '#7E9CD8',
    lavender = '#acb2e9',
    -- green = '#8a9a7b',
    green = '#98BB6C',
    red = '#df8895',
    -- text = '#c0caf5',
    text = '#C5C8C6',
    subtext1 = '#b1b7d3',
    subtext0 = '#9fa5bf',
    -- text = '#CFCFCF',
    -- subtext1 = '#b1b7d3',
    -- subtext0 = '#9fa5bf',
    overlay2 = '#8e93ac',
    overlay1 = '#7c8198',
    overlay0 = '#6a6f85',
    surface2 = '#585c71',
    surface1 = '#474b5e',
    surface0 = '#35384a',
    base = '#1F1F28',
    mantle = '#181820',
    crust = '#16161D',

    -- base = '#1F1F1F',
    -- mantle = '#2A2A37',
    -- crust = '#181820',
}

return {
    {
        dir = '~/git/vscode.nvim',
        config = function()
            require('vscode').setup({
                group_overrides = {
                    GrappleActive = { bg = '#181818', fg = '#ffffff' },
                    GrappleInactive = { bg = '#181818', fg = '#808080' },
                },
            })

            -- vim.cmd.colorscheme('vscode')
        end,
    },
    -- {
    --     'Mofiqul/vscode.nvim',
    --     config = function()
    --         require('vscode').setup({
    --             group_overrides = {},
    --         })
    --     end,
    -- },

    {
        'gbprod/nord.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('nord').setup({
                on_colors = function(colors)
                    -- colors.polar_night.origin = '#14171D'
                    colors.polar_night.origin = '#1E2127'
                    colors.polar_night.bright = '#22262C'
                    colors.polar_night.brighter = '#22262C'

                    colors.frost.polar_water = '#7dcbc0'
                end,
                on_highlights = function(hl, c)
                    local subdued = '#9da3af'

                    hl['@type.builtin'] = { link = '@type' }

                    hl['@variable.parameter'] = { fg = c.snow_storm.origin }

                    hl['@operator'] = { fg = subdued }
                    hl['@keyword.conditional.ternary'] = { fg = '#b48ead' }
                    hl['@punctuation.separator.keyvalue'] = { fg = subdued }
                    hl['@punctuation.bracket'] = { fg = subdued }
                    hl['@punctuation.delimiter'] = { fg = subdued }
                    hl['@tag.delimiter'] = { fg = subdued }

                    -- new
                    -- hl['@type'] = { fg = '#7DCBC0' }

                    hl['@boolean'] = { fg = '#d08770' }
                    hl['@number'] = { fg = '#d08770' }
                    -- hl['@boolean'] = { fg = '#81a1c1' }
                    hl['@constant.falsy'] = { link = '@boolean' }

                    hl['@keyword.angular'] = { fg = c.frost.polar_water }
                    hl['@keyword.conditional.angular'] = { fg = '#b48ead' }
                    hl['@keyword.repeat.angular'] = { fg = '#b48ead' }

                    -- local fn = '#81a1c1'
                    -- hl['@function'] = { fg = fn }
                    -- hl['@function.call'] = { fg = fn }
                    -- hl['@function.method'] = { fg = fn }
                    -- hl['@function.method.call'] = { fg = fn }
                    --
                    -- hl['@keyword'] = { fg = '#88c0d0' }
                    -- hl['@variable.builtin'] = { fg = '#88c0d0' }
                end,
            })
        end,
    },
    {
        'thesimonho/kanagawa-paper.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            overrides = function(colors)
                -- local palette = colors.palette
                return {
                    Identifier = { fg = '#DCD7BA' },
                    ['@variable'] = { fg = '#DCD7BA' },
                    ['@variable.parameter'] = { fg = '#DCD7BA' },
                    ['@lsp.mod.readonly'] = { fg = '#DCD7BA' },
                    ['@lsp.mod.defaultLibrary'] = { fg = colors.theme.syn.fun },
                }
            end,
        },
    },
    {
        'aktersnurra/no-clown-fiesta.nvim',
        config = function()
            require('no-clown-fiesta').setup({
                transparent = false, -- Enable this to disable the bg color
                styles = {
                    -- You can set any of the style values specified for `:h nvim_set_hl`
                    comments = {},
                    functions = {},
                    keywords = {},
                    lsp = {},
                    match_paren = {},
                    type = {},
                    variables = {},
                },
            })
        end,
    },
    {
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                overrides = function(colors)
                    local palette = colors.palette
                    return {
                        Constant = { fg = 'none' },
                        Identifier = { fg = 'none' },
                        Operator = { fg = 'none' },
                        -- String = { fg = palette.dragonGreen2 },
                        -- ['@variable'] = { fg = palette.oniViolet2 },
                        ['@variable.member'] = { fg = 'none' },
                        -- ['@type.builtin'] = { fg = palette.dragonYellow },
                        -- ['@keyword.return'] = { fg = palette.oniViolet },
                    }
                end,
                theme = 'dragon',
            })
        end,
    },

    {
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
                flavour = 'macchiato',
                no_italic = true,
                no_bold = true,
                integrations = {
                    blink_cmp = true,
                    neogit = true,
                    telescope = true,
                    flash = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { 'italic' },
                            hints = { 'italic' },
                            warnings = { 'italic' },
                            information = { 'italic' },
                        },
                        underlines = {
                            errors = { 'undercurl' },
                            hints = { 'undercurl' },
                            warnings = { 'undercurl' },
                            information = { 'undercurl' },
                        },
                    },
                },
                custom_highlights = function(colors)
                    return {
                        ['@type.qualifier'] = { fg = colors.mauve },
                        ['@parameter'] = { fg = colors.text },
                        ['@property'] = { fg = colors.text },
                        ['@operator'] = { fg = colors.subtext1 },
                        ['@type'] = { fg = colors.teal },
                        ['Type'] = { fg = colors.teal },

                        ['@conditional'] = { fg = colors.mauve },
                        ['@keyword'] = { fg = colors.mauve },
                        ['@keyword.export'] = { fg = colors.mauve },
                        ['@constructor.typescript'] = { fg = colors.mauve },
                        ['@type.typescript'] = { fg = colors.text }, -- imports, anything else?

                        -- ['@variable.builtin'] = { fg = colors.red },
                        -- ['@variable.builtin'] = { fg = '#707fc2' },
                        ['@constant.builtin'] = { fg = colors.peach },
                        ['@constant.falsy'] = { fg = colors.peach },
                        ['@function.builtin'] = { fg = colors.blue },

                        ['@number'] = { fg = colors.peach },
                        ['@boolean'] = { fg = colors.peach },

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

                        ['@lsp.typemod.variable.defaultLibrary.typescript'] = { link = '@variable' },
                        ['@lsp.type.variable'] = { link = '@variable' },
                        ['@lsp.type.interface'] = { link = 'Type' },
                        ['@lsp.type.class.typescript'] = { link = 'Type' },
                        ['@lsp.type.enumMember'] = { fg = colors.text },

                        ['@text.title'] = { fg = colors.text },
                        ['@text.strong'] = { fg = colors.text },

                        -- Angular and html
                        ['@tag'] = { fg = colors.blue },
                        ['@tag.delimiter'] = { fg = colors.subtext0 },
                        ['@tag.attribute'] = { fg = colors.sky },
                        ['@keyword.html'] = { fg = colors.sky },
                        ['@keyword.angular'] = { fg = colors.sky },
                        ['@keyword.conditional.ternary.angular'] = { fg = colors.subtext1 },
                        ['@markup.heading'] = { fg = colors.text },

                        -- CSS in tagged template literals
                        ['@property.styled'] = { link = '@property.css' },
                        ['@property.class.styled'] = { link = '@property.class.css' },
                        ['@string.plain.styled'] = { link = '@string.plain.css' },
                        ['@type.tag.styled'] = { link = '@type.tag.css' },
                        --

                        BlinkCmpMenu = { bg = colors.base },
                        BlinkCmpMenuBorder = { fg = colors.surface2, bg = colors.base },
                        BlinkCmpMenuSelection = { fg = colors.crust, bg = colors.blue },
                        BlinkCmpLabelDescription = { fg = colors.overlay2 },

                        FloatBorder = { fg = colors.surface2, bg = colors.base },
                        NormalFloat = { bg = colors.base },

                        DiagnosticDeprecated = { style = { 'underline' } },

                        DiagnosticFloatingError = { bg = colors.base },
                        DiagnosticFloatingWarn = { bg = colors.base },
                        DiagnosticFloatingInfo = { bg = colors.base },
                        DiagnosticFloatingHint = { bg = colors.base },

                        MsgArea = { bg = colors.mantle }, -- cmdline

                        SnacksDashboardDesc = { fg = colors.text },
                        SnacksPickerListCursorLine = { bg = colors.surface0 },
                        SnacksPickerRow = { link = 'NonText' },
                        SnacksPickerMatch = { fg = colors.blue },

                        -- Smart-open file path
                        Directory = { fg = colors.overlay1 },

                        -- Lualine grapple tags
                        -- GrappleActive = { bg = colors.base, fg = colors.text },
                        GrappleActive = { bg = colors.mantle, fg = colors.text },
                        GrappleInactive = { bg = colors.mantle, fg = colors.surface2 },

                        -- Lualine macro recording indicator
                        MacroRecordingWarning = { fg = colors.yellow, bg = colors.mantle },

                        -- Telescope
                        -- TelescopeFileName = { fg = colors.blue },
                        TelescopeRelativePath = { fg = colors.overlay1 },

                        GitConflictAncestorLabel = { fg = colors.text, bg = colors.surface0 },
                        GitConflictAncestor = { bg = colors.surface0 },

                        qfLineNr = { fg = colors.subtext0 },
                    }
                end,
                color_overrides = {
                    macchiato = custom_catppuccin,
                    mocha = custom_catppuccin2,
                },
            })

            vim.cmd.colorscheme('catppuccin-mocha')
        end,
    },
}
