local function macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == '' then
        return ''
    else
        return string.format('%%#MacroRecordingWarning#%s', '[Recording @' .. recording_register .. ']')
    end
end

local function grapple_tags()
    local current_file_path = vim.fn.expand('%:p')
    local tags = require('grapple').tags()

    local contents = {}
    for i, tag in ipairs(tags) do
        local file_name = tag.path == '' and '(empty)' or vim.fn.fnamemodify(tag.path, ':t')
        if current_file_path == tag.path then
            contents[i] = string.format(' %%#GrappleActive# %s: %s ', i, file_name)
        else
            contents[i] = string.format(' %%#GrappleInactive# %s: %s ', i, file_name)
        end
    end

    return table.concat(contents)
end

return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons', opt = true },
    },
    opts = function()
        local options = {
            theme = 'catppuccin',
            icons_enabled = false,
            globalstatus = true,
            component_separators = '',
            section_separators = '',
            disabled_filetypes = {
                statusline = {
                    'alpha',
                    'NeogitStatus',
                },
                tabline = {
                    'alpha',
                    'NeogitStatus',
                },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { left = '', right = '' },
                    },
                },
                lualine_b = {},
                lualine_c = {
                    {
                        'filename',
                        symbols = {
                            modified = '',
                            unnamed = '',
                            readonly = '',
                        },
                        separator = { left = '', right = '' },
                    },
                    {
                        'macro-recording',
                        fmt = macro_recording,
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        separator = '',
                        sections = { 'error', 'warn', 'info' },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                        },
                        colored = true,
                    },
                    {},
                },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_c = {
                    { grapple_tags },
                },
                lualine_z = {
                    {
                        'tabs',
                        cond = function()
                            return #vim.fn.gettabinfo() > 1
                        end,
                        section_separators = { left = '', right = '' },
                    },
                },
            },
        }

        return options
    end,
}
