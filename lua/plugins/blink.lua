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
}

local path_only_nodes = {
    'string',
    'string_content',
    'string_fragment',
}

local import_source_component = {
    highlight = function()
        return 'BlinkCmpLabelDescription'
    end,
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
            default = function()
                local success, node = pcall(vim.treesitter.get_node, { ignore_injections = false })

                if not success or not node or vim.tbl_contains(disabled_nodes, node:type()) then
                    return {}
                end

                if vim.tbl_contains(path_only_nodes, node:type()) then
                    return { 'path' }
                end

                return { 'lsp', 'path', 'snippets' }
            end,
            min_keyword_length = function()
                if vim.bo.filetype == 'css' or vim.bo.filetype == 'html' then
                    return 1
                else
                    return 0
                end
            end,
        },
        keymap = {
            preset = 'super-tab',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-y>'] = { 'accept', 'fallback' },
            ['>'] = {
                function(cmp)
                    cmp.hide()
                end,
                'fallback',
            },
        },
        completion = {
            trigger = {
                show_on_insert_on_trigger_character = false,
            },
            list = { max_items = 50 },
            accept = { auto_brackets = { enabled = true } },
            menu = {
                border = OPTS.float_border,
                winblend = OPTS.winblend,
                scrollbar = false,
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
        cmdline = {
            keymap = {
                ['<CR>'] = { 'accept', 'fallback' },
            },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
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
