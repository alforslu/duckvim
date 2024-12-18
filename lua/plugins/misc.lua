return {
    { -- Automatic intendation from current files
        "tpope/vim-sleuth",
        config = function()
            vim.g.sleuth_default_width = 4
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            signs = false,
        },
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("inlay-hints").setup()
        end,
    },
    {
        "vyfor/cord.nvim",
        build = "./build || .\\build",
        event = "VeryLazy",
        opts = {}, -- calls require('cord').setup()
    },
    {
        "mrjones2014/smart-splits.nvim",
        build = "./kitty/install-kittens.bash",
        config = function()
            require("smart-splits").setup()
            -- Smart Splits Keymaps
            local smart_splits = require("smart-splits")

            -- Moving between splits
            vim.keymap.set(
                "n",
                "<C-h>",
                smart_splits.move_cursor_left,
                { desc = "Move to split left", silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<C-j>",
                smart_splits.move_cursor_down,
                { desc = "Move to split down", silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<C-k>",
                smart_splits.move_cursor_up,
                { desc = "Move to split up", silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<C-l>",
                smart_splits.move_cursor_right,
                { desc = "Move to split right", silent = true, noremap = true }
            )

            -- Resizing splits with Ctrl + Arrow keys
            vim.keymap.set(
                "n",
                "<C-Up>",
                smart_splits.resize_up,
                { desc = "Resize split up", silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<C-Down>",
                smart_splits.resize_down,
                { desc = "Resize split down", silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<C-Left>",
                smart_splits.resize_left,
                { desc = "Resize split left", silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<C-Right>",
                smart_splits.resize_right,
                { desc = "Resize split right", silent = true, noremap = true }
            )
        end,
    },
}
