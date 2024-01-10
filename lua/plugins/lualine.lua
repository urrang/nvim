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

local hl_cache = {}

local set_icon_highlight = function(highlight, fg, bg)
	if hl_cache[highlight] then return end

	vim.api.nvim_set_hl(0, highlight, { fg = fg, bg = bg })
end

local function harpoon_files()
	local contents = {}
	local harpoon = require('harpoon');
	local marks_length = harpoon:list():length()
	local current_file_path = vim.fn.fnamemodify(vim.fn.expand('%:p'), ':.')

	for index = 1, marks_length do
		local harpoon_file_path = harpoon:list():get(index).value
		local file_name = harpoon_file_path == '' and '(empty)' or vim.fn.fnamemodify(harpoon_file_path, ':t')
		local extension = file_name:match(".*%.([^%.]+)$")
		-- local filename = vim.fn.expand "%:t"
		-- local extension = vim.fn.expand "%:e"
		local label = file_name

		-- local icon, hl = require('nvim-web-devicons').get_icon(file_name, extension, { default = true })
		local icon, color = require'nvim-web-devicons'.get_icon_color(file_name, extension, { default = true })

		-- local icon_str = ''
		-- if icon then
		-- 	local icon_highlight = 'lualine_icon_' .. extension
		-- 	set_icon_highlight(icon_highlight, color)
		--
		-- 	icon_str = string.format('%%#%s#%s', icon_highlight, icon)
		-- end

		if current_file_path == harpoon_file_path then
			local icon_hl = 'lualine_icon_' .. extension .. '_active'
			set_icon_highlight(icon_hl, color, '#242637')
			local ic = string.format('%%#%s#%s', icon_hl, icon)
			
			contents[index] = string.format('%%#HarpoonNumberActive# %s %s %%#HarpoonActive#%s ', index, ic, file_name)
			-- contents[index] = string.format('%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ', index, file_name)
		else
			local icon_hl = 'lualine_icon_' .. extension .. '_inactive'
			set_icon_highlight(icon_hl, color, '#1e202d')

			local ic = string.format('%%#%s#%s', icon_hl, icon)

			contents[index] = string.format('%%#HarpoonNumberInactive# %s %s %%#HarpoonInactive#%s ', index, ic, file_name)
			-- contents[index] = string.format('%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ', index, file_name)
		end
	end

	return table.concat(contents)
end

-- Show lsp status
-- local function lsp_servers()
-- 	local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
--
-- 	if not lsps or #lsps == 0 then
-- 		return '󰅡 No Active LSP'
-- 	end
--
-- 	local names = {}
-- 	for _, lsp in ipairs(lsps) do
-- 		if lsp.name ~= 'null-ls' then
-- 			table.insert(names, lsp.name)
-- 		end
-- 	end
--
-- 	return '󰅡 ' .. table.concat(names, ', ')
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
						'filename',
						symbols = {
							modified = '',
						},
						separator = { left = '', right = '' },
					},
					{
						'diagnostics',
						sources = { 'nvim_diagnostic' },
						separator = '',
						sections = { 'error', 'warn', 'info' },
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
				},
				lualine_x = {
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
					-- {
					-- 	'diagnostics',
					-- 	sources = { 'nvim_diagnostic' },
					-- 	separator = '',
					-- 	symbols = {
					-- 		-- error = ' ',
					-- 		-- warn = ' ',
					-- 		-- info = ' ',
					-- 		-- hint = ' ',
					-- 		error = ' ',
					-- 		warn = ' ',
					-- 		info = ' ',
					-- 		hint = '󱤅 ',
					-- 		other = '󰠠 ',
					-- 	},
					-- 	colored = true,
					-- },
					-- {
					-- 	lsp_servers,
					-- 	color = function()
					-- 		return { fg = "#8caaee"}
					--
					-- 	end
					-- }
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
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { harpoon_files } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { 'tabs' },
			},
		}

		return options
	end,
}
