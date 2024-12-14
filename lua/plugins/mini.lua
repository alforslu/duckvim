return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        -- Commenting
        require("mini.comment").setup({
            mappings = {
                comment = "''",
                comment_line = "<leader>/",
                comment_visual = "<leader>/",
                textobject = "<leader>/",
            },
        })

        -- Bracket movement (Buffer, diagnostic, comment etc..)
        require("mini.bracketed").setup()

        -- Icons dep
        require("mini.icons").setup()

        -- Paired brackets
        require("mini.pairs").setup()
    end,
}
