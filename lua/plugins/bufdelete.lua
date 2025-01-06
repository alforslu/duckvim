return {
    "famiu/bufdelete.nvim",
    config = function()
        vim.keymap.set(
            "n",
            "<leader>bd",
            ":Bdelete<CR>",
            { noremap = true, silent = true, desc = "Delete current buffer" }
        )
    end,
}
