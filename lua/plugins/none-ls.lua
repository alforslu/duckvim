-- TODO: Maybe replace this with conform + nvim-lint?
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
            },
        })
    end,
}
