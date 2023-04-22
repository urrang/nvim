return {
    "nvim-telescope/telescope.nvim",
    dependencies = {{
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }},
    opts = function()
        local colors = require("catppuccin.palettes").get_palette()
        local TelescopeColor = {
            TelescopeMatching = { fg = nil },
            TelescopeSelection = { fg = colors.flamingo, bg = colors.crust, bold = true },

            TelescopePromptTitle = { fg = colors.surface0 },
            TelescopePromptPrefix = { bg = colors.mantle },
            TelescopePromptNormal = { bg = colors.mantle },
            TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },

            TelescopeResultsTitle = { fg = colors.mantle },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },

            TelescopePreviewTitle = { fg = colors.crust },
            TelescopePreviewNormal = { bg = colors.crust },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
            -- TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
            -- TelescopeResultsTitle = { fg = colors.mantle },
            -- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },

            -- mantle = dark, surface0
        }

        for hl, col in pairs(TelescopeColor) do
            vim.api.nvim_set_hl(0, hl, col)
        end

        return {
            defaults = {
                -- border = false,
                prompt_prefix = "   ",
                selection_caret = "  ",
                entry_prefix = "  ",

                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        -- preview_width = 0.55,
                        -- results_width = 0.8
                    },
                    vertical = {
                        mirror = false
                    },
                    -- width = 0.87,
                    -- height = 0.80,
                    -- preview_cutoff = 120
                },
            }
        }
    end
    -- opts = function()
    --     local options = {
    --         defaults = {
    --             vimgrep_arguments = {"rg", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number",
    --                                  "--column", "--smart-case"},
    --             prompt_prefix = "   ",
    --             selection_caret = "  ",
    --             entry_prefix = "  ",
    --             initial_mode = "insert",
    --             selection_strategy = "reset",
    --             sorting_strategy = "ascending",
    --             layout_strategy = "horizontal",
    --             layout_config = {
    --                 horizontal = {
    --                     prompt_position = "top",
    --                     preview_width = 0.55,
    --                     results_width = 0.8
    --                 },
    --                 vertical = {
    --                     mirror = false
    --                 },
    --                 width = 0.87,
    --                 height = 0.80,
    --                 preview_cutoff = 120
    --             },
    --             file_sorter = require("telescope.sorters").get_fuzzy_file,
    --             file_ignore_patterns = {"node_modules"},
    --             generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    --             path_display = {"truncate"},
    --             winblend = 0,
    --             border = {},
    --             borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
    --             color_devicons = true,
    --             set_env = {
    --                 ["COLORTERM"] = "truecolor"
    --             }, -- default = nil,
    --             file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    --             grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    --             qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    --             -- Developer configurations: Not meant for general override
    --             --   buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    --             mappings = {
    --                 n = {
    --                     ["q"] = require("telescope.actions").close
    --                 }
    --             }
    --         },

    --         extensions_list = {"themes", "terms"}
    --     }
    --     require("telescope").load_extension "fzf"
    --     return options
    -- end
}
