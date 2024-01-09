local leader_map = function(key, cmd, label)
	return { '<leader>' .. key, '<cmd>' .. cmd .. '<cr>', desc = label }
end

return {
	'nvim-telescope/telescope.nvim',
	event = 'VeryLazy',
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
		leader_map('fg', 'Telescope live_grep', 'Find by Grep'),
		leader_map('fw', 'Telescope grep_string', 'Grep word under cursor'),
		leader_map('fs', 'Telescope aerial theme=dropdown prompt_title=', 'Find symbols'),

		{ '<C-p>', '<cmd>lua require("telescope").extensions.smart_open.smart_open({cwd_only = true})<cr>', desc = 'Find files' },

		leader_map('ff', 'Telescope smart_open cwd_only=true theme=dropdown prompt_title=', 'Find files'),

		-- {
		-- 	'<leader>ff',
		-- 	function()
		-- 		require('telescope').extensions.smart_open.smart_open({
		-- 			cwd_only = true,
		-- 			theme = "dropdown"
		-- 		})
		-- 	end,
		-- 	desc = 'Find files'
		-- },

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

		return {
			defaults = {
				-- border = true,
				-- prompt_prefix = '   ',
				prompt_prefix = ' ',
				selection_caret = ' ',
				entry_prefix = ' ',

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
						['<C-x>'] = require("trouble.providers.telescope").open_with_trouble,
					},
					n = {
						['<C-p>'] = require('telescope.actions.layout').toggle_preview,
						['<C-j>'] = actions.move_selection_next,
						['<C-k>'] = actions.move_selection_previous,
						['<C-x>'] = require("trouble.providers.telescope").open_with_trouble,
					},
				},
			},
			pickers = {
				live_grep = {
					preview = { hide_on_startup = false },
					prompt_title = '',
					results_title = '',
					preview_title = '',
				},
				grep_string = {
					initial_mode = 'normal',
					preview = { hide_on_startup = false },
					prompt_title = '',
					results_title = '',
					preview_title = '',
				}
			},
		}
	end,
}
