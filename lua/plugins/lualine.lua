return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                -- theme = "iceberg_dark",
                theme = "auto",
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                        color = { fg = "#ff9e64" },
                    },
                    -- {
                    --     require("noice").api.status.command.get,
                    --     cond = require("noice").api.status.command.has,
                    --     color = { fg = "#ff9e64" },
                    -- },
                },
            },
        })
    end,
}
