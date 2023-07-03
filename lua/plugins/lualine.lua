-- https://github.com/AlexvZyl/.dotfiles/blob/main/.config/nvim/lua/alex/ui/lualine.lua
-- https://github.com/avocadeys/NVCat/blob/main/lua/plugins/lualine.lua

-- Show git status.
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
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
	opts = function()
		-- local c = require('nordic.colors')

		local options = {
			icons_enabled = false,
			theme = 'catppuccin',
			-- component_separators = '',

			-- https://twitter.com/Adib_Hanna/status/1663056846955991040/photo/1
			-- custom_areas = {
			--     left = function ()
			--         return {
			--             { text = "  ", = "#ffffff" }
			--         }
			--     end
			-- },
			component_separators = '',
			section_separators = '',
			disabled_filetypes = { 'alpha', 'dashboard' },
			sections = {
				lualine_a = {
					{
						'mode',
						separator = { left = '', right = '' },
						-- icon = { ' ' },
						-- separator = {
						--     left = '', right = ''
						-- },
					},
				},
				lualine_b = {},
				lualine_c = {
					{
						'branch',
						icon = {
							'',
							-- color = { fg = c.orange.bright, gui = 'bold' },
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
							removed = ' ',
						},
						-- diff_color = {
						--     added = { fg = c.gray4, gui = 'bold' },
						--     modified = { fg = c.gray4, gui = 'bold' },
						--     removed = { fg = c.gray4, gui = 'bold' },
						-- }
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
							-- color = {
							--     fg = c.orange.bright,
							--     gui = 'bold'
							-- }
						},
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
						-- diagnostics_color = {
						--     error = { fg=c.error, gui='bold' },
						--     warn =  { fg=c.warn, gui='bold'  },
						--     info =  { fg=c.info, gui='bold'  },
						--     hint =  { fg=c.hint, gui='bold'  },
						-- },
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
						'lsp_servers',
					},
				},
				lualine_z = {
					-- 'progress',
					{
						'location',
						-- separator = {
						--     left = '', right = ''
						-- },
					},
				},
			},
		}

		return options
	end,
}
