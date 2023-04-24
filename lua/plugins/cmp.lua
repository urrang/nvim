local cmp_kinds = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
}

-- https://github.com/NavePnow/dotfiles/blob/main/.config/nvim/lua/plugins/cmp.lua
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'windwp/nvim-autopairs',
    },
    opts = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        luasnip.config.setup {} -- opts?

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        cmp.setup {
            -- matching.disallow_fuzzy_matching
            -- matching.disallow_prefix_unmatching

            -- window.completion.side_padding
            -- window.completion.scrollbar



            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(_, vim_item)
                    vim_item.kind = cmp_kinds[vim_item.kind] or ""
                    return vim_item
                end,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                completion = {
                    scrollbar = false,
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:CmpBorder,CursorLine:CmpSelectedItem,Search:None',
                    -- side_padding = 0
                },
                documentation = {
                    scrollbar = false,
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:CmpBorder,CursorLine:CmpSelectedItem,Search:None',
                },
            },
            mapping = cmp.mapping.preset.insert {
                ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<Esc>"] = cmp.mapping.close(),

                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
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
            },
            sources = cmp.config.sources {
                { name = "nvim_lsp", priority = 1000 },
                { name = "luasnip", priority = 750 },
                { name = "buffer", priority = 500 },
                { name = "path", priority = 250 },
            },
        }
    end
}