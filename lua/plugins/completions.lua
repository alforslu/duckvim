return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "saghen/blink.cmp",
        lazy = false, -- lazy loading handled internally
        -- optional: provides snippets for the snippet source
        dependencies = "rafamadriz/friendly-snippets",

        -- use a release tag to download pre-built binaries
        -- version = "v0.*",
        build = "cargo build --release",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- see the "default configuration" section below for full documentation on how to define
            -- your own keymap.
            keymap = {
                ["<Up>"] = false,
                ["<Down>"] = false,
                ["<C-Up>"] = "select_prev",
                ["<C-Down>"] = "select_next",
                -- accept = { "<C-y>" },
                -- select_next = { "<C-n>" },
            },
            completion = {
                menu = {
                    border = "rounded", -- Add rounded borders to the completion menu
                    auto_show = true, -- Ensure the menu auto-shows
                },
                documentation = {
                    auto_show = true, -- Automatically show documentation
                    window = {
                        border = "rounded", -- Add borders to the documentation window
                        winblend = 0, -- Transparency of the window
                        max_width = 60,
                        max_height = 20,
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                    },
                },

                -- default list of enabled providers defined so that you can extend it
                -- elsewhere in your config, without redefining it, via `opts_extend`

                -- experimental signature help support
                -- signature = { enabled = true }
            },
            sources = {
                providers = {
                    buffer = { fallbacks = { "lazydev" } },
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                },
                default = { "lsp", "path", "snippets", "buffer", "lazydev" },
                -- optionally disable cmdline completions
                -- cmdline = {},
            },
            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            -- allows extending the providers array elsewhere in your config
            -- without having to redefine it
            -- opts_extend = { "sources.default" },
        },
    },
}
