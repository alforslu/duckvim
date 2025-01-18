-- TODO: Maybe replace this with conform + nvim-lint?
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                }),
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            },

            -- Autoformat on write
            -- on_attach = function(client, bufnr)
            --     if client.supports_method("textDocument/formatting") then
            --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            --         vim.api.nvim_create_autocmd("BufWritePre", {
            --             group = augroup,
            --             buffer = bufnr,
            --             callback = function()
            --                 vim.lsp.buf.format()
            --             end,
            --         })
            --     end
            -- end,
        })
    end,
}
