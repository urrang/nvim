local keys = {
    { '<C-Space>', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
    {
        '<C-m>',
        function()
            local grapple = require('grapple')

            -- Allow tagging directly from the Oil buffer
            local oil = require('oil')
            local oil_cursor_entry = oil.get_cursor_entry()
            if oil_cursor_entry then
                local directory = oil.get_current_dir()

                local path = require('grapple.path')
                grapple.toggle({ path = path.join(directory, oil_cursor_entry.name) })
            else
                grapple.toggle()
            end
        end,
    },
}

for num = 1, 9 do
    table.insert(keys, {
        '<leader>' .. num,
        function()
            local grapple = require('grapple')
            if grapple.exists({ index = num }) then
                grapple.select({ index = num })
            end
        end,
    })
end

return {
    'cbochs/grapple.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = keys,
    opts = {
        scopes = {
            {
                name = 'cwd_branch',
                desc = 'Current working directory and git branch',
                fallback = 'cwd',
                cache = {
                    event = { 'BufEnter', 'FocusGained' },
                    debounce = 1000, -- ms
                },
                resolver = function()
                    local git_files = vim.fs.find('.git', {
                        upward = true,
                        stop = vim.loop.os_homedir(),
                    })

                    if #git_files == 0 then
                        return
                    end

                    local root = vim.loop.cwd()

                    local result = vim.fn.system({ 'git', 'symbolic-ref', '--short', 'HEAD' })
                    local branch = vim.trim(string.gsub(result, '\n', ''))

                    local id = string.format('%s:%s', root, branch)
                    local path = root

                    return id, path
                end,
            },
        },
        scope = 'cwd_branch',
        -- scope = 'git_branch',
        style = 'basename',
        tag_title = function()
            return 'Tags'
        end,
        win_opts = {
            width = 60,
            height = 8,
            border = 'rounded',
        },
        -- statusline = {
        --     icon = '',
        --     active = '%%#GrappleActive# %s ',
        --     inactive = '%%#GrappleInactive# %s '
        -- }
    },
}
