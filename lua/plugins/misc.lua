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
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            quickfile = { enabled = true },
        },
    },
    {
        "wintermute-cell/gitignore.nvim",
        config = function()
            require("gitignore")
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function()
            require("gitignore")
        end,
    },
}
