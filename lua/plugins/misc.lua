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
        opts = {
            text = {
                viewing = "Viewing a file",
                editing = "Editing a file",
            },
        }, -- calls require('cord').setup()
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
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                mappings = { -- Keys to be mapped to their corresponding default scrolling animation
                    "<C-u>",
                    "<C-d>",
                    "<C-b>",
                    "<C-f>",
                    "zt",
                    "zz",
                    "zb",
                },
            })
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "https://github.com/nvim-tree/nvim-web-devicons" }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            file_types = {
                "markdown",
                "md",
                "AgenticChat",
            },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
        -- config = function()
        --     require("nvim-surround").setup({
        --         -- Put your configuration here
        --     })
        -- end
    },
}
