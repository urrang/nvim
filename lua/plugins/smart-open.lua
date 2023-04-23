return {
    'danielfalk/smart-open.nvim',
    dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'kkharji/sqlite.lua' }
    },
    config = function()
        require('telescope').load_extension("smart_open")
    end,
}
