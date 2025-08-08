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
        'catppuccin/nvim',
        config = function()
            require('catppuccin').setup({
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
                        ['Type'] = { fg = colors.teal },
                        ['Constant'] = { fg = colors.maroon },
                        ['StorageClass'] = { fg = colors.text },

                        ['@type'] = { fg = colors.teal },
                        ['@type.builtin'] = { fg = colors.yellow },
                        ['@type.qualifier'] = { fg = colors.mauve },
                        ['@type.typescript'] = { fg = colors.text }, -- imports, anything else?
                        ['@operator'] = { fg = colors.subtext1 },
                        ['@parameter'] = { fg = colors.text },
                        ['@property'] = { fg = colors.text },
                        ['@variable.parameter'] = { fg = colors.text },
                        ['@constructor.typescript'] = { fg = colors.mauve },
                        ['@function.builtin'] = { fg = colors.blue },

                        -- CSS
                        ['@property.css'] = { fg = colors.text },
                        ['@string.plain.css'] = { fg = colors.peach },
                        ['@type.tag.css'] = { fg = colors.mauve },
                        -- CSS in tagged template literals
                        ['@property.class.styled'] = { link = '@property.class.css' },
                        ['@string.plain.styled'] = { link = '@string.plain.css' },
                        ['@type.tag.styled'] = { link = '@type.tag.css' },

                        -- Angular and html
                        ['@tag.delimiter'] = { fg = colors.subtext0 },
                        ['@tag.attribute'] = { fg = colors.sky },
                        ['@keyword.html'] = { fg = colors.sky },
                        ['@keyword.angular'] = { fg = colors.sky },
                        ['@keyword.conditional.ternary.angular'] = { fg = colors.subtext1 },

                        ['@markup.heading'] = { fg = colors.text },
                        ['@text.title'] = { fg = colors.text },
                        ['@text.strong'] = { fg = colors.text },

                        ['@string.special.url.svelte'] = { fg = colors.text, style = {} },

                        BlinkCmpMenu = { bg = colors.base },
                        BlinkCmpMenuBorder = { fg = colors.surface2, bg = colors.base },
                        BlinkCmpMenuSelection = { fg = colors.crust, bg = colors.blue },
                        BlinkCmpLabelDescription = { fg = colors.overlay2 },

                        FloatBorder = { fg = colors.surface2, bg = colors.base },
                        FloatTitle = { bg = colors.base },
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

                        -- Lualine grapple tags
                        GrappleActive = { bg = colors.mantle, fg = colors.text },
                        GrappleInactive = { bg = colors.mantle, fg = colors.surface2 },

                        -- Lualine macro recording indicator
                        MacroRecordingWarning = { fg = colors.yellow, bg = colors.mantle },

                        -- Telescope
                        -- TelescopeRelativePath = { fg = colors.overlay1 },
                        TelescopePathSeparator = { fg = colors.overlay1 },
                        TelescopeResultsComment = { fg = colors.overlay1 },
                        TelescopeSelection = { fg = colors.text },
                        TelescopeBufferLoaded = { fg = colors.text },

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
}
