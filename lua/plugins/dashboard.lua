local get_header = function(plugin_text)
	-- local datetime = os.date(' %d.%m   %H:%M')
	local v = vim.version()
	
	return {
		'												   ',
		'											       ',
		'											       ',
		'											       ',
		'											       ',
		'       ███╗   ██╗██╗   ██╗██╗███╗   ███╗          ',
		'       ████╗  ██║██║   ██║██║████╗ ████║          ',
		'       ██╔██╗ ██║██║   ██║██║██╔████╔██║          ',
		'       ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║          ',
		'       ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║          ',
		'       ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝          ',
		'											       ',
		'     󰘬 ' .. v.major .. '.' .. v.minor .. '.' .. v.patch .. '  ' .. (plugin_text or ''),
		'',
	}

	-- local version_text = '󰘬 ' .. v.major .. '.' .. v.minor .. '.' .. v.patch
	-- local bottom_text = datetime .. '\t' .. version_text .. '\t' .. (plugin_text or '')
	-- local bottom_text = version_text .. '    ' .. (plugin_text or '')

	-- return {
	-- 	'												   ',
	-- 	'												   ',
	-- 	'												   ',
	-- 	'███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
	-- 	'████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
	-- 	'██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
	-- 	'██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
	-- 	'██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
	-- 	'╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
	-- 	'												   ',
	-- 	bottom_text,
	-- }
end

return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	opts = function()
		local dashboard = require('alpha.themes.dashboard')

		dashboard.section.header.val = get_header()
		dashboard.section.buttons.val = {
			-- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button(
				'f',
				' ' .. ' Find file',
				-- 'Find file',
				':Telescope smart_open cwd_only=true theme=dropdown prompt_title=<cr>'
			),

			-- dashboard.button('g', 'Grep text', ':Telescope live_grep <CR>'),
			-- dashboard.button('s', 'Restore Session', [[:lua require("persistence").load() <cr>]]),
			-- dashboard.button('q', 'Quit', ':qa<CR>'),
			dashboard.button('g', ' ' .. ' Grep text', ':Telescope live_grep <CR>'),
			dashboard.button('s', ' ' .. ' Restore Session', [[:lua require("persistence").load() <cr>]]),
			dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
		}

		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = 'AlphaButtons'
			button.opts.hl_shortcut = 'AlphaShortcut'
		end

		dashboard.section.header.opts.hl = 'AlphaHeader'
		dashboard.section.buttons.opts.hl = 'AlphaButtons'
		dashboard.section.footer.opts.hl = 'AlphaFooter'
		dashboard.opts.layout[1].val = utf8

		vim.api.nvim_create_autocmd('User', {
			pattern = 'LazyVimStarted',
			callback = function()
				local stats = require('lazy').stats()
				-- local version = vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
				--
				-- -- local plugins = '⚡Neovim' .. version .. ' loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
				-- local footer = '⚡Neovim ' .. version .. ' loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
				-- dashboard.section.footer.val = footer

				local ms = math.floor(stats.startuptime + 0.5)
				-- local plugin_text = ' ' .. stats.count .. '     ' .. ms .. 'ms'
				local plugin_text = ' Loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
				-- local plugin_text = 'loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
				dashboard.section.header.val = get_header(plugin_text)

				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		return dashboard.opts
	end,
}
