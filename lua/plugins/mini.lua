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

        require("mini.bufremove").setup()
        vim.keymap.set("n", "<leader>bd", function()
            require("mini.bufremove").delete(0, false)
        end, { desc = "Close buffer" })

        -- Paired brackets
        require("mini.pairs").setup({
            modes = { insert = true, command = true, terminal = false },
            mappings = {
                ["("] = { neigh_pattern = "^[^\\][^%w]" },
                ["["] = { neigh_pattern = "^[^\\][^%w]" },
                ["{"] = { neigh_pattern = "^[^\\][^%w]" },
            },
        })
    end,
}
