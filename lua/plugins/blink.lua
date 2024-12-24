return {
    'saghen/blink.cmp',
    version = 'v0.*',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            min_keyword_length = function()
                return vim.bo.filetype == 'css' and 1 or 0
            end,
        },
        keymap = {
            preset = 'super-tab',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            cmdline = {
                ['<Tab>'] = { 'select_next' },
                ['<S-Tab>'] = { 'select_prev' },
                ['<CR>'] = { 'accept', 'fallback' },
            },
        },
        completion = {
            list = {
                max_items = 50,
                selection = function(ctx)
                    return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
                end,
            },
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
