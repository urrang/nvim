return {
    'echasnovski/mini.nvim',
    version = false,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('mini.move').setup()

        local hipatterns = require('mini.hipatterns')
        hipatterns.setup({
            highlighters = {
                hex_color = hipatterns.gen_highlighter.hex_color({
                    style = 'inline',
                    inline_text = ' ',
                }),
            },
        })

        local bufremove = require('mini.bufremove')
        bufremove.setup()
        vim.keymap.set('n', '<leader>bc', function()
            if vim.bo.modified then
                local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
                if choice == 1 then
                    vim.cmd.write()
                    bufremove.delete(0)
                elseif choice == 2 then
                    bufremove.delete(0, true)
                end
            else
                bufremove.delete(0)
            end
        end)
    end,
}
