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

local kanappuccin = {
    rosewater = '#e5cec9',
    flamingo = '#e2baba',
    pink = '#e6b2d8',
    mauve = '#957FB8',
    maroon = '#e09096',
    peach = '#e69f77',
    yellow = '#e0c795',
    teal = '#7AA89F',
    sky = '#7FB4CA',
    sapphire = '#7FB4CA',
    blue = '#7E9CD8',
    lavender = '#acb2e9',
    green = '#8a9a7b',
    red = '#E46876',
    -- text = '#c2cae6',
    text = '#b8b4d0',
    subtext1 = '#b1b7d3',
    subtext0 = '#9fa5bf',
    overlay2 = '#8e93ac',
    overlay1 = '#7c8198',
    overlay0 = '#6a6f85',
    surface2 = '#585c71',
    surface1 = '#474b5e',
    surface0 = '#35384a',
    base = '#1F1F28',
    mantle = '#181820',
    crust = '#16161D',
}

local catppuccin_aki = {
    rosewater = '#e5cec9',
    flamingo = '#e2baba',
    pink = '#e6b2d8',
    mauve = '#ad8dbd',
    maroon = '#e09096',
    peach = '#e09f87',
    yellow = '#e6c193',
    teal = '#83c8be',
    sky = '#88cad5',
    sapphire = '#75b8d6',
    blue = '#939dbd',
    lavender = '#acb2e9',
    green = '#a1cd93',
    red = '#df8895',
    text = '#d1cec9',
    subtext1 = '#b1b7d3',
    subtext0 = '#9fa5bf',
    overlay2 = '#8e93ac',
    overlay1 = '#7c8198',
    overlay0 = '#58596e',
    surface2 = '#454756',
    surface1 = '#373846',
    surface0 = '#2c2d39',
    base = '#292a36',
    mantle = '#22232e',
    crust = '#1a1b24',
}

return {
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
        'gmr458/cold.nvim',
        config = function()
            require('cold').setup({})
        end,
    },
    {
        'sho-87/kanagawa-paper.nvim',
        config = function()
            require('kanagawa-paper').setup({
                commentStyle = { italic = false },
                overrides = function(colors)
                    local theme = colors.theme
                    local c = colors.palette
                    return {
                        ['@variable.parameter'] = { fg = theme.ui.fg },
                        ['@variable.builtin'] = { italic = false },
                        ['@keyword.return'] = { fg = c.dragonPink },
                        ['@lsp.type.property'] = { fg = theme.ui.fg },
                    }
                end,
            })

            -- vim.cmd.colorscheme('kanagawa-paper')
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
                        Constant = { fg = palette.oniViolet2 },
                        Identifier = { fg = palette.oniViolet2 },
                        Operator = { fg = palette.oniViolet2 },
                        String = { fg = palette.dragonGreen2 },
                        ['@variable'] = { fg = palette.oniViolet2 },
                        ['@variable.member'] = { fg = palette.oniViolet2 },
                        ['@type.builtin'] = { fg = palette.dragonYellow },
                        ['@keyword.return'] = { fg = palette.oniViolet },
                    }
                end,
                theme = 'dragon',
            })
        end,
    },

    {
        'crispybaccoon/aki',
        config = function()
            local colors = require('aki.colors').colors()

            require('aki').setup({
                contrast_dark = 'medium',
                style = {
                    types = { italic = false },
                    keyword = { italic = false },
                },
                overrides = {
                    -- ['@punctuation.bracket'] = { colors.bg3 },
                    ['@punctuation.bracket'] = { { '#5F6170', 8 } },
                    ['@punctuation.special'] = { { '#5F6170', 8 } },
                    ['@punctuation.delimited'] = { { '#5F6170', 8 } },
                    ['@operator'] = { { '#5F6170', 8 } },

                    ['@constructor'] = { colors.purple },
                    ['@keyword'] = { colors.purple },
                    ['@constant'] = { colors.red },
                    ['@lsp.type.enumMember'] = { colors.fg1 },
                    ['@boolean'] = { colors.yellow },
                    ['@number'] = { colors.yellow },
                    ['@function'] = { colors.blue },

                    --
                    ['@type.builtin.typescript'] = { colors.blue },
                },
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

                        ['@variable.builtin'] = { fg = colors.red },
                        ['@constant.builtin'] = { fg = colors.peach },
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
                    mocha = catppuccin_aki,
                },
            })

            vim.cmd.colorscheme('catppuccin')
        end,
    },
}
