return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                -- NOTE: Language servers
                ensure_installed = { "lua_ls", "clangd" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- NOTE: Have to setup all lsps
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})

            -- Keymaps
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = '[g]oto [d]efinition'})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = '[g]oto [D]eclaration' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = 'Show information'})
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {desc = '[r]e[n]ame variable'})
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {desc ='[c]ode [a]ctions'})
            vim.keymap.set('n', '<C-f>', function()
                vim.lsp.buf.format { async = true }
            end, {desc = 'Format file'})
        end
    },
}
