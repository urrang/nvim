-- https://github.com/AlexvZyl/.dotfiles/blob/main/.config/nvim/lua/alex/ui/lualine.lua
-- https://github.com/avocadeys/NVCat/blob/main/lua/plugins/lualine.lua

-- Get the lsp of the current buffer, when using native lsp.
-- local function get_native_lsp()
--     local buf_ft = get_current_filetype()
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--         return 'None'
--     end
--     for _, client in ipairs(clients) do
--         local filetypes = client.config.filetypes
--         if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--             return client.name
--         end
--     end
--     return 'None'
-- end

-- Display the difference in commits between local and head.
-- local Job = require 'plenary.job'
-- local function get_git_compare()

--     -- Get the path of the current directory.
--     local curr_dir = vim.api.nvim_buf_get_name(0):match("(.*"..'/'..")")

--     -- Run job to get git.
--     local result = Job:new({
--       command = 'git',
--       cwd = curr_dir,
--       args = { 'rev-list', '--left-right', '--count', 'HEAD...@{upstream}' },
--     }):sync(100)[1]

--     -- Process the result.
--     if type(result) ~= 'string' then return '' end
--     local ok, ahead, behind = pcall(string.match, result, "(%d+)%s*(%d+)")
--     if not ok then return '' end

--     -- No file, so no git.
--     if get_current_buftype() == 'nofile' then
--         return ''
--     end

--     -- Format for lualine.
--     return ' '.. behind .. '  ' .. ahead

-- end

-- Show git status.
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed
        }
    end
end

return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons', opt = true },
        'avocadeys/nvim-lualine-components',
    },
    -- See `:help lualine.txt`
    -- config = {

    --     require('lualine').setup({
    --         options = {
    --             icons_enabled = false,
    --             theme = 'auto',
    --             component_separators = '',
    --             section_separators = '',
    --             disabled_filetypes = {"alpha", "dashboard"}
    --         }
    --     })
    -- },
    opts = function()
        local c = require('nordic.colors')

        local options = {
            icons_enabled = false,
            theme = 'auto',
            -- component_separators = '',
            component_separators = "",
            section_separators = "",
            disabled_filetypes = {"alpha", "dashboard"},
            sections = {
                lualine_a = {
                    {
                        'mode',
                        -- icon = { ' ' },
                        separator = {
                            left = '', right = ''
                        },
                    },
                },
                lualine_b = {},
                lualine_c = {
                    {
                        'branch',
                        icon = {
                            '',
                            color = { fg = c.orange.bright, gui = 'bold' },
                        },
                        separator = ' ',
                    },
                    {
                        'diff',
                        colored = true,
                        source = diff_source,
                        symbols = {
                            -- added = ' ',
                            -- modified = ' ',
                            -- removed = ' ',
                            added = ' ',
                            modified = ' ',
                            removed = ' '
                        },
                        diff_color = {
                            added = { fg = c.gray4, gui = 'bold' },
                            modified = { fg = c.gray4, gui = 'bold' },
                            removed = { fg = c.gray4, gui = 'bold' },
                        }
                        -- icon = {
                            -- ' ',
                            -- color = { fg = c.orange.base },
                        -- }
                    },
                    {
                        get_native_lsp,
                        icon = {
                            '  ',
                            align = 'left',
                            color = {
                                fg = c.orange.bright,
                                gui = 'bold'
                            }
                        }
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        separator = '',
                        symbols = {
                            -- error = ' ',
                            -- warn = ' ',
                            -- info = ' ',
                            -- hint = ' ',
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = '󱤅 ',
                            other = '󰠠 ',
                        },
                        diagnostics_color = {
                            error = { fg=c.error, gui='bold' },
                            warn =  { fg=c.warn, gui='bold'  },
                            info =  { fg=c.info, gui='bold'  },
                            hint =  { fg=c.hint, gui='bold'  },
                        },
                        colored = true,
                    },
                },
                -- lualine_y = {
                --     {
                --         get_native_lsp,
                --         icon = {
                --             '  ',
                --             align = 'left',
                --             color = {
                --                 fg = c.orange.bright,
                --                 gui = 'bold'
                --             }
                --         }
                --     },
                -- },
                lualine_y = {
                    {
                      'lsp_servers'
                    },
                },
                lualine_z = {
                    -- 'progress',
                    {
                        'location',
                        separator = {
                            left = '', right = ''
                        },
                    },
                }
            }
        }

        return options
    end

}
