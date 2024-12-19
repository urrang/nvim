return {
    enabled = false,
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim',
        { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
        { 'windwp/nvim-autopairs', opts = {} },
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

        cmp.setup.filetype({ 'sql' }, {
            sources = {
                { name = 'vim-dadbod-completion' },
                { name = 'buffer' },
            },
        })

        cmp.setup({
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            view = {
                docs = { auto_open = false },
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    local item_with_kind = require('lspkind').cmp_format({
                        mode = 'symbol',
                        maxwidth = 30,
                    })(entry, vim_item)

                    item_with_kind.menu = ''

                    if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= '' then
                        local detail = '  ' .. entry.completion_item.detail
                        local length = string.len(detail)
                        if length > 22 then
                            detail = string.sub(detail, 1, 21) .. '…'
                        elseif length < 22 then
                            local padding = string.rep(' ', 22 - length)
                            detail = padding .. detail
                        end

                        item_with_kind.menu = detail
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
                documentation = {
                    scrollbar = false,
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:CmpBorder,CursorLine:CmpSelectedItem,Search:None',
                },
                -- documentation = false,
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
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                -- ['<Tab>'] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.confirm()
                --         -- cmp.select_next_item()
                --     elseif luasnip.expand_or_jumpable() then
                --         luasnip.expand_or_jump()
                --     else
                --         fallback()
                --     end
                -- end, { 'i', 's' }),
                -- ['<S-Tab>'] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_prev_item()
                --     elseif luasnip.jumpable(-1) then
                --         luasnip.jump(-1)
                --     else
                --         fallback()
                --     end
                -- end, { 'i', 's' }),
                ['<C-p>'] = function()
                    if cmp.visible_docs() then
                        cmp.close_docs()
                    else
                        cmp.open_docs()
                    end
                end,
            }),
            sources = {
                { name = 'nvim_lsp', priority = 1000 },
                { name = 'luasnip', priority = 750 },
                { name = 'buffer', priority = 500 },
                { name = 'path', priority = 250 },
            },
        })
    end,
}
