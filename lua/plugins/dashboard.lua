local get_header = function(plugin_text)
	local datetime = os.date(' %d.%m   %H:%M')
	local v = vim.version();
	local version_text = 'Version: ' .. v.major .. '.' .. v.minor .. '.' .. v.patch
	-- local bottom_text = datetime .. '\t' .. version_text .. '\t' .. (plugin_text or '')
	local bottom_text = version_text .. '    ' .. (plugin_text or '')

	return {
		'												   ',
		'███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
		'████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
		'██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
		'██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
		'██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
		'╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
		'												   ',
		bottom_text,
	}
end

return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	opts = function()
		local dashboard = require('alpha.themes.dashboard')

		-- local datetime = os.date(' %d.%m.%Y   %H:%M')
		--
		-- local function nvim_version()
		-- 	local stats = require('lazy').stats()
		-- 	local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		-- 	plugins_text = 'v'
		-- 		.. vim.version().major
		-- 		.. '.'
		-- 		.. vim.version().minor
		-- 		.. '.'
		-- 		.. vim.version().patch
		-- 		.. '\t'
		-- 		.. stats.count
		-- 		.. ' plugins, '
		-- 		.. ms
		-- 		.. 'ms'
		-- 	return plugins_text
		-- end
		--
		-- dashboard.section.header.val = {
		-- 	'███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
		-- 	'████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
		-- 	'██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
		-- 	'██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
		-- 	'██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
		-- 	'╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
		-- 	'                                                  ',
		-- 	nvim_version() .. '\t\t' .. datetime, -- .. '\t' .. plugins()
		-- }

		dashboard.section.header.val = get_header()
		dashboard.section.buttons.val = {
			dashboard.button(
				'f',
				' ' .. ' Find file',
				":lua require('telescope').extensions.smart_open.smart_open({cwd_only = true}) <cr>"
			),

			-- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button('n', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
			dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
			dashboard.button('g', ' ' .. ' Find text', ':Telescope live_grep <CR>'),
			dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
			dashboard.button('s', ' ' .. ' Restore Session', [[:lua require("persistence").load() <cr>]]),
			dashboard.button('l', '󰒲 ' .. ' Lazy', ':Lazy<CR>'),
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
				-- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				local ms = math.floor(stats.startuptime + 0.5)
				local version = vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch
				--
				-- -- local plugins = '⚡Neovim' .. version .. ' loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
				local footer = '⚡Neovim ' .. version .. ' loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
				dashboard.section.footer.val = footer

				-- local plugin_text = stats.count .. ' plugins loaded in ' .. ms .. 'ms'
				local plugin_text = 'Plugins: ' .. stats.count .. '    Load: ' .. ms .. 'ms'
				dashboard.section.header.val = get_header(plugin_text)
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		return dashboard.opts
	end,
	-- config = function(_, dashboard)
	-- 	require("alpha").setup(dashboard.opts)
	-- end,
}
