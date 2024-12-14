return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,
            italic_comments = true,
            borderless_telescope = false,
            theme = {
                highlights = {
                    LineNr = { fg = "#ff5ea0" },
                    LineNrAbove = { fg = "#4f535a" },
                    LineNrBelow = { fg = "#4f535a" },
                },
            }
        })

        vim.cmd("colorscheme cyberdream")
    end
}
