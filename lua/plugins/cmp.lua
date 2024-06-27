-- https://github.com/ditsuke/nvim-config/blob/5d22ea749ef64b5d3fec0ad3d6ac457e6dcbeb22/lua/ditsuke/plugins/editor/cmp.lua#L46
local function get_lsp_completion_context(completion, source)
	local ok, source_name = pcall(function() return source.source.client.config.name end)
	if not ok then
		return nil
	end

	if source_name == 'tsserver' then
		return completion.detail
	elseif source_name == 'vtsls' then
		if completion.labelDetails ~= nil then
			return completion.labelDetails.description
		end
	end
end

return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'saadparwaiz1/cmp_luasnip',
		'onsails/lspkind.nvim',
        { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
		{ 'windwp/nvim-autopairs', opts = {} },
		-- {
		-- 	'rafamadriz/friendly-snippets',
		-- 	config = function()
		-- 		require('luasnip.loaders.from_vscode').lazy_load()
		-- 	end,
		-- },
	},
	event = 'InsertEnter',
	opts = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')

		luasnip.config.setup({}) -- opts?
		require('luasnip.loaders.from_vscode').lazy_load({ paths = './snippets' })

		local cmp_autopairs = require('nvim-autopairs.completion.cmp')

		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline({
				['<C-k>'] = cmp.mapping.select_prev_item(),
				['<C-j>'] = cmp.mapping.select_next_item(),
				['<Esc>'] = cmp.mapping.close(),
			}),
			completion = {
				completeopt = 'menu,menuone,noinsert,noselect',
			},
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{
					name = 'cmdline',
					option = {
						ignore_cmds = { 'Man', '!' },
					},
				},
			}),
		})

		cmp.setup({
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			formatting = {
				fields = { 'kind', 'abbr', 'menu' },
				format = function(entry, vim_item)
					local item_with_kind = require('lspkind').cmp_format({
						mode = 'symbol',
						maxwidth = 20,
					})(entry, vim_item)

					item_with_kind.menu = ''

					local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
					if completion_context ~= nil and completion_context ~= '' then
						local truncated_context = string.sub(completion_context, 1, 25)
						if truncated_context ~= completion_context then
							truncated_context = truncated_context .. '… '
						end

						item_with_kind.menu = item_with_kind.menu .. '    ' .. truncated_context
					end

					item_with_kind.menu_hl_group = 'CmpItemAbbr'
					return item_with_kind
				end,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			duplicates = {
				nvim_lsp = 1,
				luasnip = 1,
				-- buffer = 1,
				path = 1,
			},
			window = {
				completion = {
					scrollbar = false,
					border = 'rounded',
					winhighlight = 'Normal:Normal,FloatBorder:CmpBorder,CursorLine:CmpSelectedItem,Search:None',
				},
				documentation = false,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete({}),
				['<CR>'] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm()
						-- cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<S-Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
			sources = {
				{ name = 'nvim_lsp', priority = 1000 },
				{ name = 'luasnip',  priority = 750 },
				{ name = 'buffer',   priority = 500 },
				{ name = 'path',     priority = 250 },
			},
		})
	end,
}
