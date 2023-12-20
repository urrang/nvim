return {
	{ 'sainnhe/sonokai' },
	{
		'sainnhe/gruvbox-material',
		setup = function()
			vim.g.gruvbox_material_foreground = 'mix'
		end,
	},
	{
		'ellisonleao/gruvbox.nvim',
		config = function()
			require('gruvbox').setup({
				contrast = 'soft',
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					folds = false,
				},
				bold = false,
			})
		end,
	},
	{
		-- Figure out why vars etc are blue..
		'kvrohit/rasmus.nvim',
		config = function() end,
	},
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
				flavour = 'macchiato',
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
						['@type.qualifier'] = { fg = colors.mauve },
						['@parameter'] = { fg = colors.text },
						['@property'] = { fg = colors.text },
						['@operator'] = { fg = colors.subtext1 },
						['@type'] = { fg = colors.teal },
						['Type'] = { fg = colors.teal },

						['@conditional'] = { fg = colors.mauve },
						['@keyword'] = { fg = colors.mauve },
						['@keyword.export'] = { fg = colors.mauve },
						['@constructor.typescript'] = { fg = colors.mauve },
						['@type.typescript'] = { fg = colors.text }, -- imports, anything else?

						['@variable.builtin'] = { fg = colors.red },
						['@constant.builtin'] = { fg = colors.peach },
						['@function.builtin'] = { fg = colors.blue },

						['@number'] = { fg = colors.peach },
						['@boolean'] = { fg = colors.peach },

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

						['@lsp.type.interface'] = { link = 'Type' },
						['@lsp.type.class.typescript'] = { link = 'Type' },
						['@lsp.type.enumMember'] = { fg = colors.text },

						['@keyword.html'] = { fg = colors.sky },

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

						DiagnosticDeprecated = { style = { 'underline' } },

						DiagnosticFloatingError = { bg = colors.base },
						DiagnosticFloatingWarn = { bg = colors.base },
						DiagnosticFloatingInfo = { bg = colors.base },
						DiagnosticFloatingHint = { bg = colors.base },

						MsgArea = { bg = colors.mantle }, -- cmdline

						-- Smart-open file path
						Directory = { fg = colors.overlay1 },
					}
				end,
				color_overrides = {
					all = {
						text = '#c0caf5',
					},
					-- macchiato = {
					-- 	base = '#25292E' -- github dark
					-- }
				},
			})

			vim.cmd.colorscheme('catppuccin')
		end,
	},
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			local palette = require('nordic.colors')

			require('nordic').setup({
				transparent_bg = false,
				italic_comments = false,
				bold_keywords = false,
				override = {
					['@variable.builtin'] = { italic = false },
					['@namespace'] = { italic = false },
					['@text.emphasis'] = { italic = false },
					-- ['@parameter'] = { italic = false },

					['@property'] = { fg = palette.white0 },
					['@parameter'] = { fg = '#8FBCBB', italic = false },
				},
			})
		end,
	},
	{
		'folke/tokyonight.nvim',
		opts = {
			style = 'storm', --  `moon`, a darker variant `night`,
			-- transparent = true,
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
				hl['@parameter'] = { fg = '#C0CAF5' }
			end,
		},
	},
}
