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

-- local comment_nodes = {
--     'comment',
--     'comment_content',
--     'line_comment',
--     'block_comment',
-- }

local string_nodes = {
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

-- https://github.com/hrsh7th/nvim-cmp/blob/106c4bcc053a5da783bf4a9d907b6f22485c2ea0/lua/cmp/config/context.lua#L30
local in_treesitter_capture = function(capture)
    local buf = vim.api.nvim_get_current_buf()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    row = row - 1
    if vim.api.nvim_get_mode().mode == 'i' then
        col = col - 1
    end

    local get_captures_at_pos = -- See neovim/neovim#20331
        require('vim.treesitter').get_captures_at_pos -- for neovim >= 0.8 or require('vim.treesitter').get_captures_at_position -- for neovim < 0.8

    local captures_at_cursor = vim.tbl_map(function(x)
        return x.capture
    end, get_captures_at_pos(buf, row, col))

    if vim.tbl_isempty(captures_at_cursor) then
        return false
    elseif type(capture) == 'string' and vim.tbl_contains(captures_at_cursor, capture) then
        return true
    elseif type(capture) == 'table' then
        for _, v in ipairs(capture) do
            if vim.tbl_contains(captures_at_cursor, v) then
                return true
            end
        end
    end

    return false
end

return {
    enabled = true,
    'saghen/blink.cmp',
    version = '1.*',
    -- dependencies = { 'rafamadriz/friendly-snippets' },
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
        enabled = function()
            return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
                and vim.bo.buftype ~= 'prompt'
                and vim.b.completion ~= false
                and not in_treesitter_capture('comment')
        end,
        sources = {
            default = function()
                local _, node = pcall(vim.treesitter.get_node, { ignore_injections = false })

                -- if not success or not node or vim.tbl_contains(comment_nodes, node:type()) then
                --     return {}
                -- end

                if node and vim.tbl_contains(string_nodes, node:type()) then
                    return { 'path' }
                end

                return { 'lsp', 'snippets' }
            end,
            providers = {
                lsp = {
                    min_keyword_length = function()
                        if
                            vim.bo.filetype == 'css'
                            or vim.bo.filetype == 'html'
                            or vim.bo.filetype == 'typescriptreact'
                        then
                            return 1
                        else
                            return 0
                        end
                    end,
                },
            },
        },
        keymap = {
            preset = 'super-tab',
            ['<Tab>'] = {
                -- function() -- sidekick next edit suggestion
                --     return require('sidekick').nes_jump_or_apply()
                -- end,
                -- function(cmp)
                --     if cmp.snippet_active() then
                --         return cmp.accept()
                --     else
                --         return cmp.select_and_accept()
                --     end
                -- end,
                'snippet_forward',
                function()
                    require('copilot.suggestion').accept()
                end,
                'fallback',
            },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-y>'] = { 'accept', 'fallback' },
        },
        completion = {
            trigger = {
                show_on_insert_on_trigger_character = false,
                show_in_snippet = false,
            },
            list = {
                max_items = 30,
            },
            -- accept = { auto_brackets = { enabled = true } },
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
