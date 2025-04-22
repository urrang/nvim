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
        -- 'aktersnurra/no-clown-fiesta.nvim',
        config = function()
            require('no-clown-fiesta').setup({
                transparent = false,
                styles = {
                    lsp = { undercurl = true },
                },
            })

            -- vim.cmd.colorscheme('no-clown-fiesta')
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

                    -- String = { fg = '#A2B5C1' },
                    -- Number = { fg = '#FFCFA8', bold = false },
                    -- Boolean = { fg = '#FFCFA8' },
                    -- Function = { fg = '#88afa2' },
                    --
                    -- ['@keyword'] = { fg = '#7E97AB' },
                    -- Statement = { fg = '#7E97AB' },
                    --
                    -- FloatBorder = { fg = '#505050' },
                    -- BlinkCmpMenuBorder = { fg = '#505050' },
                    -- BlinkCmpMenuSelection = { bg = '#343434' },
                    -- BlinkCmpLabelDescription = { fg = '#65737E' },
                    --
                    -- CmpItemAbbrMatch = { bold = true },
                    -- CmpItemAbbrMatchFuzzy = { bold = true },
                    --
                    -- DiagnosticUnderlineError = { undercurl = true, sp = '#FF8080' },
                    --
                    -- ['@variable.builtin'] = { fg = '#A0A0A0' },
                    -- ['@property'] = { fg = mix('#FFFFFF', '#000000', math.abs(0.80)) },
                    -- ['@lsp.type.property.typescript'] = { fg = '#E1E1E1' },
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
                    orange = '#7E97AB',
                    primary = '#A0A0A0',
                    -- comment = mix("#8b8b8b", "#000000", math.abs(0.90)),
                    orangeLight = '#7E97AB',
                    -- green = mix("#99FFE4", "#000000", math.abs(0.85)),
                    -- green = '#a1cd93',
                    -- green = '#88cad5',
                    -- green = '#A2B5C1',
                    green = '#88afa2',
                    yellowDark = '#7E97AB',

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

    {
        'thesimonho/kanagawa-paper.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            colors = {
                palette = {
                    -- oldWhite = '#b7b7c8',
                    -- fujiWhite = '#b7b7c8',
                    oldWhite = '#c2c1bc',
                    fujiWhite = '#c2c1bc',
                    fujiGray = '#727169',
                },
                theme = {
                    ink = {},
                },
            },
            overrides = function(colors)
                local palette = colors.palette
                return {
                    -- Normal = { bg = '#1f1f1f' },
                    Identifier = { fg = palette.oldWhite },
                    ['@lsp.mod.readonly'] = { fg = palette.oldWhite },
                    ['@lsp.mod.defaultLibrary'] = { fg = palette.dragonBlue2 },
                    ['@lsp.type.parameter'] = { fg = palette.oldWhite },
                    ['@variable.parameter'] = { fg = palette.oldWhite },
                    ['@variable.builtin'] = { italic = false },
                    ['@operator'] = { fg = palette.dragonGray2 },

                    ['@tag.html'] = { fg = palette.dragonPink },
                    -- Identifier = { fg = '#c0c0ce' },
                    -- ['@variable'] = { fg = '#c0c0ce' },
                }
            end,
        },
    },
    {
        'rebelot/kanagawa.nvim',
        config = function()
            require('kanagawa').setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },
                statementStyle = { bold = false },
                colors = {
                    palette = {
                        waveRed = '#c2707a',
                        springGreen = '#97b474',
                        -- fujiWhite = '#b8b4d0',
                        -- fujiWhite = '#C5C9C5',
                        -- oniViolet2 = '#C5C9C5',
                        oldWhite = '#c2c1bc',
                        fujiWhite = '#c2c1bc',
                        fujiGray = '#727169',
                        -- #C5C9C5

                        --paper
                        sumiInkn1 = '#0f0f15',
                        sumiInk0 = '#16161D',
                        sumiInk1 = '#181820',
                        sumiInk2 = '#1a1a22',
                        sumiInk3 = '#1F1F28',
                        sumiInk4 = '#2A2A37',
                        sumiInk5 = '#363646',
                        sumiInk6 = '#54546D',
                    },
                    theme = {
                        wave = {
                            syn = {
                                punct = '#73738c',
                            },
                        },
                        dragon = {},
                    },
                },
                overrides = function(colors)
                    local palette = colors.palette
                    return {
                        Constant = { fg = palette.oniViolet2 },
                        Identifier = { fg = palette.oniViolet2 },
                        Operator = { fg = palette.oniViolet2 },
                        Boolean = { bold = false },
                        Special = { fg = palette.surimiOrange },
                        PreProc = { fg = palette.oniViolet },

                        -- String = { fg = palette.dragonGreen2 },

                        GrappleActive = { bg = palette.sumiInk4, fg = palette.oniViolet2 },
                        GrappleInactive = { bg = palette.sumiInk4, fg = palette.sumiInk6 },

                        MacroRecordingWarning = { fg = palette.surimiOrange, bg = palette.sumiInk4 },

                        SignColumn = { bg = palette.sumiInk3 },
                        LineNr = { bg = palette.sumiInk3 },
                        CursorLineNr = {
                            fg = palette.oniViolet2,
                            bg = palette.sumiInk3,
                            bold = true,
                        },

                        ['@variable'] = { fg = palette.oniViolet2 },
                        ['@variable.member'] = { fg = palette.oniViolet2 },
                        ['@variable.builtin'] = { fg = palette.waveRed, italic = false },
                        -- ['@variable.builtin'] = { fg = '#b6927b', italic = false },
                        ['@lsp.typemod.variable.defaultLibrary'] = { fg = palette.oniViolet2 },

                        ['@type.builtin'] = { fg = palette.waveAqua2 },
                        ['@function.builtin'] = { fg = palette.crystalBlue },
                        -- ['@type.builtin'] = { fg = palette.dragonYellow },
                        ['@keyword.return'] = { fg = palette.oniViolet },
                        ['@keyword.exception'] = { fg = palette.oniViolet },
                        ['@punctuation.special'] = { fg = palette.waveRed },

                        ['@tag'] = { fg = palette.crystalBlue },
                        ['@tag.attribute'] = { fg = palette.waveAqua2 },
                    }
                end,
                theme = 'dragon',
            })

            -- vim.cmd('colorscheme kanagawa')
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
                },
            })

            vim.cmd.colorscheme('catppuccin')
        end,
    },
}
