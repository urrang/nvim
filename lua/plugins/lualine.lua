-- https://github.com/AlexvZyl/.dotfiles/blob/main/.config/nvim/lua/alex/ui/lualine.lua
-- https://github.com/avocadeys/NVCat/blob/main/lua/plugins/lualine.lua
-- Show git status.
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

-- Show lsp status
local function lsp_servers()
	local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })

	if not lsps or #lsps == 0 then
		return "󰅡 No Active LSP"
	end

	local names = {}
	for _, lsp in ipairs(lsps) do
		if lsp.name ~= "null-ls" then
			table.insert(names, lsp.name)
		end
	end

	return "󰅡 " .. table.concat(names, ", ")
end

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
					},
				},
				lualine_b = {},
				lualine_c = {
					{
						'branch',
						icon = {
							'',
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
						colored = true,
					},
					{
						lsp_servers,
						color = function()
							return { fg = "#8caaee"}

						end
					}
				},
				lualine_y = {},
				lualine_z = {
					-- {
					-- 'location',
					-- separator = {
					--     left = '', right = ''
					-- },
					-- },
				},
			},
		}

		return options
	end,
}
