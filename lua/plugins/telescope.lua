local leader_map = function(key, cmd, label)
	return { '<leader>' .. key, '<cmd>' .. cmd .. '<cr>', desc = label }
end

return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		{
			'nvim-telescope/telescope-fzy-native.nvim',
			build = 'make',
		},
		{
			'danielfalk/smart-open.nvim',
			dependencies = { 'kkharji/sqlite.lua' },
		},
		{ 'stevearc/aerial.nvim' },
	},
	keys = {
		-- leader_map('<space>', 'Telescope buffers', 'Find buffer'),
		leader_map('?', 'Telescope oldfiles', 'Find recent files'),
		leader_map('ff', 'lua require("telescope").extensions.smart_open.smart_open({cwd_only = true})', 'Find files'),
		leader_map('fg', 'Telescope live_grep', 'Find by Grep'),
		-- leader_map('fs', 'Telescope lsp_document_symbols', 'Find symbols'),
		leader_map('fs', 'Telescope aerial', 'Find symbols'),
		-- leader_map('fr', require('telescope.builtin').lsp_references(), 'Find references'),

		leader_map('f1', 'Telescope find_files', 'test1'),
		leader_map('f2', 'lua require("telescope.builtin").find_files{ path_display = { "smart" } }', 'test2'),
		leader_map('f3', 'lua require("telescope.builtin").lsp_references{ show_line = false, trim_text = true }', 'test3'),
		-- trim_text

		{
			'<leader>/',
			function()
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
					winblend = 5,
					previewer = false,
				}))
			end,
			desc = 'Find in current buffer',
		},
		-- { '<leader>fs', '<cmd>Telescope lsp_document_symbols ignore_symbols=variable,enum,constant,class,property<cr>', desc = "Find symbols" }
	},
	opts = function()
		local telescope = require('telescope')
		require('aerial').setup({})

		telescope.load_extension('fzy_native')
		telescope.load_extension('aerial')
		telescope.load_extension('smart_open')

		local actions = require('telescope.actions')
		local colors = require('catppuccin.palettes').get_palette()

		local TelescopeColor = {
			-- TelescopeMatching = { fg = colors.blue },
			-- TelescopeSelection = { fg = colors.flamingo, bg = colors.crust, bold = true },
			TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

			TelescopePromptTitle = { fg = colors.surface0 },
			TelescopePromptPrefix = { bg = colors.mantle },
			TelescopePromptNormal = { bg = colors.mantle },
			TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },

			TelescopeResultsTitle = { fg = colors.mantle },
			TelescopeResultsNormal = { bg = colors.mantle },
			TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },

			TelescopePreviewTitle = { fg = colors.crust },
			TelescopePreviewNormal = { bg = colors.crust },
			TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
			-- TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
			-- TelescopeResultsTitle = { fg = colors.mantle },
			-- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
		}

		-- for hl, col in pairs(TelescopeColor) do
		-- 	vim.api.nvim_set_hl(0, hl, col)
		-- end

		return {
			defaults = {
				-- border = true,
				prompt_prefix = '   ',
				selection_caret = '  ',
				entry_prefix = '  ',

				initial_mode = 'insert',
				selection_strategy = 'reset',
				sorting_strategy = 'ascending',
				layout_strategy = 'horizontal',
				layout_config = {
					horizontal = {
						prompt_position = 'top',
					},
					vertical = {
						mirror = false,
					},
				},
				path_display = function(opts, path)
					local tail = require('telescope.utils').path_tail(path)
					return string.format('%s (%s)', tail, path), { { { 1, #tail }, 'Constant' } }
				end,
				preview = {
					hide_on_startup = true, -- hide previewer when picker starts
				},
				mappings = {
					i = {
						['<C-p>'] = require('telescope.actions.layout').toggle_preview,
						['<C-j>'] = actions.move_selection_next,
						['<C-k>'] = actions.move_selection_previous,
					},
					n = {
						['<C-p>'] = require('telescope.actions.layout').toggle_preview,
						['<C-j>'] = actions.move_selection_next,
						['<C-k>'] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				buffers = {
					initial_mode = 'normal',
				},
				live_grep = {
					preview = {
						hide_on_startup = false
					}
				}
			},
		}
	end,
}
