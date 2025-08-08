return {
    -- enabled = false,
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
        local dashboard = require('alpha.themes.dashboard')

        local v = vim.version()
        local version = v.major .. '.' .. v.minor .. '.' .. v.patch
        dashboard.section.header.opts.hl = 'AlphaHeader'
        dashboard.section.header.val = {
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            '',
            'NVIM ' .. version,
        }

        dashboard.section.buttons.val = {
            dashboard.button('f', 'Find file', ':Telescope frecency workspace=CWD theme=dropdown<cr>'),
            dashboard.button('s', 'Restore Session', ':SessionLoad<CR>'),
            dashboard.button('q', 'Quit', ':qa<CR>'),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl_shortcut = 'AlphaShortcut'
            button.opts.width = 30
        end

        dashboard.opts.layout[1].val = utf8
        return dashboard.opts
    end,
}
