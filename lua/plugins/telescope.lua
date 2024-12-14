return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require("telescope").setup({})


            -- Keymaps
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })

            vim.keymap.set('n', '<leader>fw', function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    -- winblend = 100,
                    previewer = false,
                })
            end, { desc = '[F]ind [W]ord fuzzily in current buffer' })
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end
    },
}
