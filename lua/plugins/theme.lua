return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			local c = require('vscode.colors').get_colors()

			require('vscode').setup({
				transparent = false,
				disable_nvimtree_bg = true,
				group_overrides = {
					['@variable.builtin'] = { fg = c.vscBlue },
					['@keyword'] = { fg = c.vscBlue },
					['@keyword.return'] = { fg = c.vscPink },
					['@conditional.ternary'] = { fg = c.vscFront },
					['@parameter'] = { fg = '#6FBFF9' }, -- c.vscMediumBlue },
				},
			})
		end,
	},
	{
		'catppuccin/nvim',
		config = function()
			require('catppuccin').setup({
				flavour = 'frappe',
				no_italic = true,
				no_bold = true,
				integrations = {
					cmp = true,
					neogit = true,
					lsp_saga = true,
					gitsigns = true,
					neotree = true,
					telescope = true,
					notify = true,
					noice = true,
					alpha = true,
					flash = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { 'italic' },
							hints = { 'italic' },
							warnings = { 'italic' },
							information = { 'italic' },
						},
						underlines = {
							errors = { 'underline' },
							hints = { 'underline' },
							warnings = { 'underline' },
							information = { 'underline' },
						},
					},

					which_key = true,
					-- harpoon = true,
				},
				custom_highlights = function(colors)
					return {
						['@variable.builtin'] = { fg = colors.mauve },
						['@type.qualifier'] = { fg = colors.mauve },
						['@parameter'] = { fg = colors.sky },
						['@property'] = { fg = colors.text },
						['@operator'] = { fg = colors.subtext1 },
						['@punctuation.bracket'] = { fg = colors.subtext1 },
						['@punctuation.delimiter'] = { fg = colors.subtext1 },
						-- ['@type'] = { fg = "#BFE7E0" },

						['@number'] = { fg = colors.maroon },
						['@boolean'] = { fg = colors.maroon },

						['cssDefinition'] = { fg = colors.text },
						['StorageClass'] = { fg = colors.text },
						['cssCustomProp'] = { fg = colors.text },
						['cssValueLength'] = { fg = colors.green },
						['cssUnitDecorators'] = { fg = colors.green },
						['cssColor'] = { fg = colors.green },

						['cssValueNumber'] = { fg = colors.maroon },
						['cssAttrRegion'] = { fg = colors.maroon },
						['cssFunction'] = { fg = colors.text },
						['Constant'] = { fg = colors.maroon },

						-- ['Special'] = { fg = colors.green },
						-- ['Type'] = { fg = colors.green },
						-- ['Identifier'] = { fg = colors.green },
						-- ['CmpItemKindVariable'] = { fg = colors.green },
						['@lsp.type.interface'] = { link = 'Type' },
						['@lsp.type.enumMember'] = { fg = colors.text },

						-- ['cssAttrRegion'] = { fg = colors.text },
						-- ['cssUnitDecorators'] = { fg = colors.yellow },
						-- ['cssColor'] = { fg = colors.red },

						-- ['@method'] = { fg = colors.flamingo },
						-- ['@method.call'] = { fg = colors.flamingo },
						-- ['@function.call'] = { fg = colors.flamingo },
						-- ['@property'] = { fg = colors.text },

						-- ['@variable.builtin'] = { fg = colors.blue },
						-- ['@method'] = { fg = colors.yellow },
						-- ['@method.call'] = { fg = colors.yellow },
						-- ['@function.call'] = { fg = colors.yellow },

						CmpBorder = { fg = colors.surface2 },

						-- CmpItemMenu = { bg = colors.pink },
						CmpSelectedItem = { fg = colors.crust, bg = colors.blue },
						CmpItemAbbrMatch = { fg = colors.blue, style = { 'bold' } },
						CmpItemAbbrMatchFuzzy = { fg = colors.blue, style = { 'bold' } },

						SagaBorder = { fg = colors.surface2 },
						-- MiniIndentscopeSymbol = { fg = colors.yellow },

						FloatBorder = { fg = colors.surface2, bg = colors.base },
						NormalFloat = { bg = colors.base },
						-- NormalFloatBorder = { fg = colors.surface2, bg = colors.base },

						DiagnosticFloatingError = { bg = colors.base },
						DiagnosticFloatingWarn = { bg = colors.base },
						DiagnosticFloatingInfo = { bg = colors.base },
						DiagnosticFloatingHint = { bg = colors.base },

						MsgArea = { bg = colors.mantle }, -- cmdline
					}
				end,
			})

			vim.cmd.colorscheme('catppuccin')
		end,
	},
	{ 'antonk52/lake.nvim' },
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').setup({
				transparent_bg = false,
				italic_comments = false,
				bold_keywords = false,
				override = {
					['@variable.builtin'] = { italic = false },
					['@namespace'] = { italic = false },
					['@text.emphasis'] = { italic = false },
					-- ['@parameter'] = { italic = false },

					['@property'] = { fg = '#BBC3D4' },
					['@parameter'] = { fg = '#8FBCBB', italic = false },
				},
			})
		end,
	},
	{
		'folke/tokyonight.nvim',
		opts = {
			style = 'storm', --  `moon`, a darker variant `night`,
			transparent = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				functions = {},
				variables = {},
				sidebars = 'dark',
				floats = 'dark',
			},
			on_highlights = function(hl, _)
				hl['@property'] = { fg = '#C0CAF5' }
			end,
		},
	},
}
