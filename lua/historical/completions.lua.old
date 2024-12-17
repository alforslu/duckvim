return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = {
            performance = {
                debounce = 0,
                throttle = 0,
            },
        },
        config = function()
            -- Set up nvim-cmp.
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                enabled = function()
                    local context = require("cmp.config.context")
                    -- Disable in comments
                    if vim.api.nvim_get_mode().mode == "c" then
                        return false
                    end
                    -- local buftype = vim.bo.filetype
                    local bufname = vim.api.nvim_buf_get_name(0)
                    if bufname == "neo-tree" then
                        return false
                    end
                    return not context.in_treesitter_capture("comment")
                        and not context.in_syntax_group("Comment")
                        and not context.in_treesitter_capture("string")
                        and not context.in_syntax_group("String")
                end,

                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["§"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),

                preselect = cmp.PreselectMode.Item,
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
