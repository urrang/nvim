-- return {
--     'glepnir/dashboard-nvim',
--     event = 'VimEnter',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     config = function()
--         require('dashboard').setup {
--             theme = 'doom'
--         }
--     end,
-- }

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		--     local logo = [[
		--            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
		--            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
		--            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
		--            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
		--            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
		--            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
		--       ]]
		--
		--     local logo2 = [[
		-- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
		-- ████╗  ██║██║   ██║██║████╗ ████║
		-- ██╔██╗ ██║██║   ██║██║██╔████╔██║
		-- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
		-- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
		-- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
		--     ]]
		--
		--     dashboard.section.header.val = vim.split(logo2, "\n")

		dashboard.section.header.val = {
			"                                                  ",
			"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
			"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
			"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
			"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
			"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"                                                  ",
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file",
				"[[:lua require('telescope').extensions.smart_open.smart_open({cwd_only = true}) <cr>]]"),
			-- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
			dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		require("alpha").setup(dashboard.opts)

		-- vim.api.nvim_create_autocmd("User", {
		--   pattern = "LazyVimStarted",
		--   callback = function()
		--     local stats = require("lazy").stats()
		--     local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		--     dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
		--     pcall(vim.cmd.AlphaRedraw)
		--   end,
		-- })
	end,
}
