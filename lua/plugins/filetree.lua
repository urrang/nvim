return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { '<C-b>', '<Cmd>Neotree toggle<CR>', desc = "Toggle fle tree"}
    },
    config = function ()
        require('neo-tree').setup({
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(file_path)
                        require("neo-tree").close_all()
                    end
                },
            },
            window = {
                mappings = {
                    ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
                    ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
                    ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
                },
            },
        })
    end
}