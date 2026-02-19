return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
        config = function()
            require('copilot').setup({
                panel = { enabled = false },
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        -- accept_word = '<Right>',
                        accept_word = '<C-l>',
                        -- next = '<C-l>',
                        -- prev = '<C-h>',
                    },
                },
            })
        end,
    },
}
