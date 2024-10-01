return {
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
            'NVIM ' .. version,
        }

        dashboard.section.buttons.val = {
            dashboard.button('f', 'Find file', ':Telescope smart_open cwd_only=true theme=dropdown prompt_title=<cr>'),
            dashboard.button('s', 'Restore Session', ':SessionLoad<CR>'),
            dashboard.button('q', 'Quit', ':qa<CR>'),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl_shortcut = 'AlphaShortcut'
            button.opts.width = 30
        end

        dashboard.opts.layout[1].val = utf8

        -- vim.api.nvim_create_autocmd('User', {
        -- 	pattern = 'LazyVimStarted',
        -- 	callback = function()
        -- 		local stats = require('lazy').stats()
        -- 		-- local version = vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
        -- 		--
        -- 		-- -- local plugins = '⚡Neovim' .. version .. ' loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        -- 		-- local footer = '⚡Neovim ' .. version .. ' loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        -- 		-- dashboard.section.footer.val = footer
        --
        -- 		local ms = math.floor(stats.startuptime + 0.5)
        -- 		-- local plugin_text = ' ' .. stats.count .. '     ' .. ms .. 'ms'
        -- 		local plugin_text = ' Loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        -- 		-- local plugin_text = 'loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        -- 		dashboard.section.header.val = get_header(plugin_text)
        --
        -- 		pcall(vim.cmd.AlphaRedraw)
        -- 	end,
        -- })

        return dashboard.opts
    end,
}
