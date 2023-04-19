-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    { 'folke/which-key.nvim', opts = {} },

      -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    {'ThePrimeagen/vim-be-good'}
}
