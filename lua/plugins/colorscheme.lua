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

-- local custom_theme = {
--     rosewater = '#e5cec9',
--     flamingo = '#e2baba',
--     pink = '#e6b2d8',
--     peach = '#e69f77',
--     overlay2 = '#8e93ac',
--     overlay1 = '#7c8198',
--     overlay0 = '#6a6f85',
--     surface2 = '#585c71',
--     surface1 = '#474b5e',
--     surface0 = '#35384a',
--
--     -- DONE
--     text = '#d8dde5',
--     subtext1 = '#8f97a8', -- '#b1b7d3',
--     subtext0 = '#8f97a8', --'#9fa5bf',
--
--     maroon = '#e4797e',
--     red = '#e4797e',
--     mauve = '#c396c3',
--     green = '#9eca99',
--     yellow = '#ecc285',
--
--     -- REVISIT:
--     teal = '#7ec2c2',
--     sky = '#7ec2c2',
--     sapphire = '#7ec2c2',
--     blue = '#7ec2c2',
--     lavender = '#c396c3', -- '#acb2e9',
--
--     base = '#1C1F21',
--     mantle = '#2A2E31',
--     crust = '#2A2E31',
-- }

local kanappuccin = {
    rosewater = '#e5cec9',
    flamingo = '#e2baba',
    pink = '#e6b2d8',
    -- pink = '#c4b28a',
    mauve = '#957FB8',
    maroon = '#e09096',
    peach = '#FFA066',
    yellow = '#c4b28a',
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
    surface2 = '#363646',
    surface1 = '#363646',
    surface0 = '#2A2A37',
    base = '#1F1F28',
    mantle = '#181820',
    crust = '#16161D',
}

return {
    {
        'vague2k/vague.nvim',
        config = function()
            require('vague').setup({
                style = {
                    strings = 'none',
                },
                colors = {
                    bg = '#1C1C1C',
                },
            })
        end,
    },
    {
        dir = '~/git/no-clown-fiesta.nvim',
        -- 'urrang/no-clown-fiesta.nvim',
        config = function()
            require('no-clown-fiesta').setup({
                transparent = false,
            })

            vim.cmd.colorscheme('no-clown-fiesta')
        end,
    },
    {
        'datsfilipe/vesper.nvim',
        config = function()
            local mix = require('vesper.utils').mix

            require('vesper').setup({
                transparent = false,
                italics = {
                    comments = false,
                    keywords = false,
                    functions = false,
                    strings = false,
                    variables = false,
                },
                overrides = {
                    -- Number = { fg = '#BAD7FF', bold = false },
                    -- Boolean = { fg = '#BAD7FF' },
                    -- String = { fg = '#88afa2' },
                    -- Number = { fg = mix('#99FFE4', '#000000', math.abs(0.85)) },

                    -- String = { fg = '' },
                    Number = { fg = '#FFCFA8', bold = false },
                    Boolean = { fg = '#FFCFA8' },
                    Function = { fg = '#88afa2' },

                    ['@keyword'] = { fg = '#7E97AB' },
                    Statement = { fg = '#7E97AB' },

                    FloatBorder = { fg = '#505050' },
                    BlinkCmpMenuBorder = { fg = '#505050' },
                    BlinkCmpMenuSelection = { bg = '#343434' },
                    BlinkCmpLabelDescription = { fg = '#65737E' },

                    CmpItemAbbrMatch = { bold = true },
                    CmpItemAbbrMatchFuzzy = { bold = true },

                    ['@variable.builtin'] = { fg = '#A0A0A0' },
                    ['@property'] = { fg = mix('#FFFFFF', '#000000', math.abs(0.80)) },
                    ['@lsp.type.property.typescript'] = { fg = '#E1E1E1' },
                },
                palette_overrides = {
                    white = '#E1E1E1',
                    bg = '#1f1f1f',
                    bgDark = '#161616', -- inactive statusline (not relevant?), tabline
                    bgDarker = '#232323', -- hover word, picker selected item
                    bgFloat = '#1f1f1f',
                    bgOption = '#343434',

                    -- fg = mix("#FFFFFF", "#000000", math.abs(0.80)),
                    fgLineNr = '#505050',

                    border = '#505050',

                    -- ui colors
                    -- greenLight = mix("#99FFE4", "#000000", math.abs(0.85)),
                    red = '#FF8080',
                    purple = '#FFCFA8', -- functions etc
                    -- purple = '#88cad5', -- functions etc
                    redDark = '#FF8080',
                    orange = '#FFCFA8',
                    primary = '#A0A0A0',
                    -- comment = mix("#8b8b8b", "#000000", math.abs(0.90)),
                    orangeLight = '#FFCFA8',
                    -- green = mix("#99FFE4", "#000000", math.abs(0.85)),
                    -- green = '#a1cd93',
                    -- green = '#88cad5',
                    green = '#A2B5C1',
                    yellowDark = '#FFC799',

                    -- purpleDark = mix("#65737E", "#000000", math.abs(0.80)),
                    symbol = '#65737E',
                    secondary = '#FFFFFF', -- numbers

                    -- Diagnostic colors
                    error = '#FF8080',
                    warn = '#FFC799',
                    info = '#99FFE4',
                    hint = '#65737E',

                    -- Not relevant?
                    fgAlt = '#FEFEFE', -- TabLineSel
                    fgInactive = '#65737E', -- statusline, tabline

                    -- Unused
                    fgCommand = '#FEFEFE',
                    fgDisabled = '#505050',
                    fgSelection = '#343434',
                    fgSelectionInactive = '#505050',
                    terminalbrightblack = '#343434',

                    borderFocus = '#65737E',
                    borderDarker = '#A0A0A0',
                },
            })

            -- vim.cmd.colorscheme('vesper')
        end,
    },

    -- {
    --     'gmr458/cold.nvim',
    --     config = function()
    --         require('cold').setup({})
    --     end,
    -- },
    -- {
    --     'sho-87/kanagawa-paper.nvim',
    --     config = function()
    --         require('kanagawa-paper').setup({
    --             commentStyle = { italic = false },
    --             overrides = function(colors)
    --                 local theme = colors.theme
    --                 local c = colors.palette
    --                 return {
    --                     ['@variable.parameter'] = { fg = theme.ui.fg },
    --                     ['@variable.builtin'] = { italic = false },
    --                     ['@keyword.return'] = { fg = c.dragonPink },
    --                     ['@lsp.type.property'] = { fg = theme.ui.fg },
    --                 }
    --             end,
    --         })
    --
    --     end,
    -- },

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
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
                -- flavour = 'macchiato',
                flavour = 'mocha',
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
                    mocha = kanappuccin,
                },
            })

            -- vim.cmd.colorscheme('catppuccin')
        end,
    },
}
