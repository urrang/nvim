local disabled_filetypes = {
    'prompt',
    'TelescopePrompt',
    'DressingInput',
    'gitcommit',
    'oil',
    'buffer_manager',
    'grapple',
}

local disabled_nodes = {
    'comment',
    'comment_content',
    'string',
    'string_content',
}

local import_source_component = {
    highlight = 'BlinkCmpSource',
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
}

return {
    'saghen/blink.cmp',
    version = 'v0.*',
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        enabled = function()
            return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
                and vim.bo.buftype ~= 'prompt'
                and vim.b.completion ~= false
        end,
        sources = {
            -- default = { 'lsp', 'path', 'snippets', 'buffer' },
            default = function()
                local success, node = pcall(vim.treesitter.get_node, { ignore_injections = false })

                if not success or not node or vim.tbl_contains(disabled_nodes, node:type()) then
                    return {}
                end

                return { 'lsp', 'path', 'snippets', 'buffer' }
            end,
            min_keyword_length = function()
                return vim.bo.filetype == 'css' and 1 or 0
            end,
        },
        keymap = {
            preset = 'super-tab',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            -- ['<Esc>'] = { 'hide', 'fallback' },
            ['<C-y>'] = { 'accept', 'fallback' },
            ['>'] = {
                function(cmp)
                    cmp.hide()
                end,
                'fallback',
            },
            cmdline = {
                ['<Tab>'] = { 'select_next' },
                ['<S-Tab>'] = { 'select_prev' },
                ['<Esc>'] = { 'hide', 'fallback' },
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
                auto_show = function(ctx)
                    return ctx.mode ~= 'cmdline' or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
                end,
                draw = {
                    columns = {
                        { 'kind_icon' },
                        { 'label', 'label_description', gap = 1 },
                        { 'import_source' },
                    },
                    components = {
                        label = { width = { fill = true, max = 35 } },
                        import_source = import_source_component,
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
