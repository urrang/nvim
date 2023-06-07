return {
    'stevearc/aerial.nvim',
    event = "VeryLazy",
    -- Optional dependencies
    dependencies = {
       'nvim-treesitter/nvim-treesitter',
       'nvim-tree/nvim-web-devicons',
       'nvim-telescope/telescope.nvim'
    },
    config = function()
        require('aerial').setup({})
        require('telescope').load_extension('aerial')
    end
}