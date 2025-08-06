local disabled_filetypes = {
    'prompt',
    'TelescopePrompt',
    'DressingInput',
    'gitcommit',
    'oil',
    'buffer_manager',
    'grapple',
    'markdown',
}

local comment_nodes = {
    'comment',
    'comment_content',
    'line_comment',
    'block_comment',
}

local string_nodes = {
    'string',
    'string_content',
    'string_fragment',
}

-- local check_enabled = function()
--     local success, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
--     return success and node and not vim.tbl_contains(comment_nodes, node:type())
-- end
--
-- local check_path_enabled = function()
--     local success, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
--     return success and node and vim.tbl_contains(string_nodes, node:type())
-- end

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
    version = '1.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        enabled = function()
            return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
                and vim.bo.buftype ~= 'prompt'
                and vim.b.completion ~= false
        end,
        sources = {
            -- default = { 'lsp', 'path', 'snippets' },
            default = function(ctx)
                local success, node = pcall(vim.treesitter.get_node, { ignore_injections = false })
                if not success or not node or vim.tbl_contains(comment_nodes, node:type()) then
                    return {}
                end

                if vim.tbl_contains(string_nodes, node:type()) then
                    return { 'path' }
                end

                return { 'lsp', 'path', 'snippets' }
            end,
            -- providers = {
            --     snippets = { enabled = check_enabled },
            --     path = { enabled = check_path_enabled },
            --     lsp = { enabled = check_enabled },
            -- },
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
            -- ['>'] = {
            --     function(cmp)
            --         cmp.hide()
            --     end,
            --     'fallback',
            -- },
        },
        completion = {
            trigger = {
                show_on_insert_on_trigger_character = false,
            },
            list = {
                max_items = 30,
            },
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
            completion = {
                menu = {
                    auto_show = function()
                        return vim.fn.getcmdtype() == ':'
                    end,
                },
                list = {
                    selection = {
                        preselect = false,
                    },
                },
            },
            keymap = {
                ['<CR>'] = { 'accept_and_enter', 'fallback' },
            },
        },
        fuzzy = {
            -- max_typos = function(keyword)
            --     return 0
            -- end,
            max_typos = function(keyword)
                return math.floor(#keyword / 4)
            end,
            sorts = {
                'exact',
                -- defaults
                'score',
                'sort_text',
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
