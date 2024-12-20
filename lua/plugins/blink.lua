return {
    'saghen/blink.cmp',
    version = 'v0.*',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        keymap = {
            preset = 'super-tab',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
        },
        completion = {
            list = { max_items = 50 },
            accept = { auto_brackets = { enabled = true } },
            menu = {
                border = 'rounded',
                scrollbar = false,
                draw = {
                    columns = {
                        { 'kind_icon' },
                        { 'label', 'label_description', gap = 1 },
                        { 'import_source' },
                    },
                    components = {
                        label = {
                            width = { fill = true, max = 35 },
                        },
                        import_source = {
                            width = { max = 22 },
                            text = function(ctx)
                                local src = ctx.item.detail
                                if src ~= nil and src ~= '' then
                                    local len = string.len(src)
                                    if len < 22 then
                                        local padding = string.rep(' ', 22 - len)
                                        src = padding .. src
                                    end

                                    return src
                                end
                            end,
                            highlight = 'BlinkCmpSource',
                        },
                    },
                },
            },
        },
        appearance = {
            kind_icons = {
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
            },
        },
    },
    opts_extend = { 'sources.default' },
}
