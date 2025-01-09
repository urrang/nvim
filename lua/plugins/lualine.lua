local function macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == '' then
        return ''
    else
        return string.format('%%#MacroRecordingWarning#%s', '[Recording @' .. recording_register .. ']')
    end
end

-- local hl_cache = {}
-- local function grapple_tags()
--     local contents = {}
--
--     local current_file_path = vim.fn.expand('%:p')
--     local tags = require('grapple').tags()
--
--     local set_icon_highlight = function(highlight, fg, bg)
--         if hl_cache[highlight] then
--             return
--         end
--
--         vim.api.nvim_set_hl(0, highlight, { fg = fg, bg = bg })
--     end
--
--     for i, tag in ipairs(tags) do
--         local file_name = tag.path == '' and '(empty)' or vim.fn.fnamemodify(tag.path, ':t')
--         local extension = file_name:match('.*%.([^%.]+)$')
--
--         local icon, color = require('nvim-web-devicons').get_icon_color(file_name, extension, { default = true })
--
--         if current_file_path == tag.path then
--             local icon_hl = 'lualine_icon_' .. extension .. '_active'
--             set_icon_highlight(icon_hl, color, '#242637')
--             local ic = string.format('%%#%s#%s', icon_hl, icon)
--
--             contents[i] = string.format(' %%#GrappleActive# %s %s %%#GrappleActive#%s ', i, ic, file_name)
--         else
--             local icon_hl = 'lualine_icon_' .. extension .. '_inactive'
--             set_icon_highlight(icon_hl, color, '#1e202d')
--
--             local ic = string.format('%%#%s#%s', icon_hl, icon)
--
--             contents[i] = string.format(' %%#GrappleInactive# %s %s %%#GrappleInactive#%s ', i, ic, file_name)
--         end
--     end
--
--     return table.concat(contents)
-- end

return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons', opt = true },
    },
    opts = function()
        local options = {
            icons_enabled = false,
            theme = 'catppuccin',
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
                    -- { 'grapple', separator = '' },
                    -- {
                    --     'filetype',
                    --     colored = true,
                    --     icon_only = true,
                    --     separator = ''
                    -- },
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
                            -- hint = '󱤅 ',
                            -- other = '󰠠 ',
                        },
                        colored = true,
                    },
                    -- {
                    --     'tabs',
                    --     cond = function()
                    --         return #vim.fn.gettabinfo() > 1
                    --     end,
                    --     section_separators = { left = '', right = '' },
                    -- },

                    -- { 'progress', separator = '' },
                    -- { 'location' },
                    -- {
                    -- 	'branch',
                    -- 	icon = {
                    -- 		'',
                    -- 	},
                    -- 	separator = ' ',
                    -- },
                    {},
                },
                lualine_y = {},
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
            -- tabline = {
            --     lualine_c = {
            --         { grapple_tags },
            --     },
            --     lualine_z = {
            --         {
            --             'tabs',
            --             cond = function()
            --                 return #vim.fn.gettabinfo() > 1
            --             end,
            --             section_separators = { left = '', right = '' },
            --         },
            --     },
            -- },
        }

        return options
    end,
}
