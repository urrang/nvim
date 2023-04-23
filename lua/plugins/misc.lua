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

    {
      "simrat39/symbols-outline.nvim",
      keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
      config = true,
    },

    { "windwp/nvim-autopairs", opts = {} },
    -- {
    --   'j-hui/fidget.nvim',
    --   opts = {
    --     window = {
    --       blend = 0
    --     }
    --   }
    -- },

    {
      'petertriho/nvim-scrollbar',
      opts = {
        handle = {
          text = " ",
          blend = 0, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
          color = "#737994",
          color_nr = nil, -- cterm
          highlight = "CursorColumn",
          hide_if_all_visible = true, -- Hides handle if all lines are visible
        },
      }
    },

      -- "gc" to comment visual regions/lines
    {
      'numToStr/Comment.nvim',
      event = "VeryLazy",
      opts = {
        -- toggler = {
        --   line = '<leader>kc',
        --   block = '<leader>kb',
        -- },
      }
    },

    { 'lukas-reineke/indent-blankline.nvim', opts = {} },
    {
      'smolck/command-completion.nvim',
      event = "VeryLazy",
      opts = {}
    },
    {
      'ThePrimeagen/vim-be-good',
      event = "VeryLazy",
    }
}
