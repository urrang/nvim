vim.api.nvim_create_autocmd('User', {
    desc = 'Close buffer on Oil delete, update Grapple tag on move and delete',
    pattern = 'OilActionsPost',
    callback = function(args)
        if args.data.err then
            return
        end

        local get_buf_nr = function(url)
            local path = url:match('^.*://(.*)$')
            return vim.fn.bufnr(path)
        end

        local grapple = require('grapple')

        for _, action in ipairs(args.data.actions) do
            if action.type == 'delete' and action.entry_type == 'file' then
                local bufnr = get_buf_nr(action.url)
                if bufnr ~= -1 then
                    -- vim.cmd('bdelete ' .. bufnr)
                    if grapple.exists({ buffer = bufnr }) then
                        grapple.untag({ buffer = bufnr })
                    end
                end
            end

            if action.type == 'move' and action.entry_type == 'file' then
                local bufnr = get_buf_nr(action.src_url)
                local dest_bufnr = get_buf_nr(action.dest_url)
                if bufnr ~= -1 then
                    if grapple.exists({ buffer = bufnr }) then
                        -- Couldn't find a way to update current tag, so instead we retag the file
                        grapple.untag({ buffer = bufnr })
                        grapple.tag({ buffer = dest_bufnr })
                    end
                end
            end
        end
    end,
})

return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<C-b>', '<Cmd>Oil<CR>', desc = 'Show file explorer' },
    },
    opts = {
        view_options = { show_hidden = true },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        lsp_file_methods = { autosave_changes = true },
        use_default_keymaps = false,
        keymaps = {
            ['?'] = 'actions.show_help',
            ['<CR>'] = 'actions.select',
            ['<C-p>'] = 'actions.preview',
            ['_'] = 'actions.open_cwd',
            ['gt'] = 'actions.toggle_trash',
            ['<BS>'] = 'actions.parent',
            ['q'] = 'actions.close',
            ['<C-b>'] = 'actions.close',
            ['<Esc>'] = 'actions.close',
        },
    },
}
